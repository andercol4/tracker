class Seizure < ActiveRecord::Base
  def simple_time
    self.time.strftime("%l:%M %P")
  end
  def simple_date
    self.date.strftime("%b %-d, %Y")
  end
end
