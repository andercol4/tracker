class Seizure < ActiveRecord::Base
  acts_as_taggable
  def simple_time
    self.date.strftime("%l:%M %P")
  end
  def simple_date
    self.date.strftime("%b %-d, %Y")
  end
  def parsed_length
    self.length
  end

  def encrypt_length
    minutes = self.length.to_s.split('')
    seconds = minutes.pop(2)
    second_percent = seconds.join('').to_i / 60.0 * 100
    second_percent = second_percent.to_i.to_s
    minutes = minutes.join('')
    time = minutes + second_percent
  end
end
