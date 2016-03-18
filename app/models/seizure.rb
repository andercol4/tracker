class Seizure < ActiveRecord::Base
  acts_as_taggable
  validate :seizure_date_cannot_be_in_the_future
  validates :date, :length, presence: true
  def seizure_date_cannot_be_in_the_future
    if self.date < DateTime.now
      errors.add(:expiration_date, "can't be in the past")
    end
  end


  def simple_time
    self.date.strftime("%l:%M %P")
  end
  def simple_date
    self.date.strftime("%b %-d, %Y")
  end
  def parsed_length
    minutes = self.length.to_s.split('')
    seconds = minutes.pop(2)
    minutes = minutes.join('')
    second_percent = seconds.join('').to_i / 100.0 * 60
    second_percent = second_percent.to_i.to_s
    time = minutes + ':' + second_percent
  end
  def encrypt_length
    minutes = self.length.to_s.split('')
    seconds = minutes.pop(2)
    second_percent = seconds.join('').to_i / 60.0 * 100
    second_percent = second_percent.to_i.to_s
    minutes = minutes.join('')
    time = minutes + second_percent
  end

  def self.get_by_time(time = 30)
    Seizure.where("date >= ?", time.to_i.days.ago)
  end
end
