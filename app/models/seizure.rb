class Seizure < ActiveRecord::Base
  acts_as_taggable
  def simple_time
    self.date.strftime("%l:%M %P")
  end
  def simple_date
    self.date.strftime("%b %-d, %Y")
  end
end
