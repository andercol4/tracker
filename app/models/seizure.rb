class Seizure < ActiveRecord::Base
  acts_as_taggable
  validates_presence_of :date
  validates_presence_of :length
  # validate :seizure_date_cannot_be_in_the_future
  # def seizure_date_cannot_be_in_the_future
  #   if self.date > DateTime.now
  #     errors.add(:expiration_date, "can't be in the past")
  #   end
  # end


  def simple_time
    if self.date
      self.date.strftime("%l:%M %P")
    else
      'N/A'
    end
  end
  def simple_date
    if self.date
      self.date.strftime("%b %-d, %Y")
    else
      'N/A'
    end
  end
  def parsed_length
    if self.length != 0
      minutes = self.length.to_s.split('')
      seconds = minutes.pop(2)
      minutes = minutes.join('')
      second_percent = seconds.join('').to_i / 100.0 * 60
      second_percent = second_percent.to_i.to_s
      if second_percent == '0'
        time = "#{minutes}:#{second_percent}0"
      else
        time = "#{minutes}:#{second_percent}"
      end
    else
      '0:00'
    end
  end
  def encrypt_length
    if self.length
      minutes = self.length.to_s.split('')
      seconds = minutes.pop(2)
      second_percent = seconds.join('').to_i / 60.0 * 100
      second_percent = second_percent.to_i.to_s
      minutes = minutes.join('')
      if second_percent == '0'
        time = minutes + second_percent + '0'
      else
        # binding.pry
        time = minutes + second_percent
      end
    else
      '000'
    end
    time
  end

  def self.get_by_time(time = 30)
    Seizure.where("date >= ? AND date <= ?", time.to_i.days.ago, DateTime.now)
  end
end
