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
    minutes = self.length
    seconds = minutes.pop(2)
    second_percent = seconds % 60
    binding.pry
  end
end
