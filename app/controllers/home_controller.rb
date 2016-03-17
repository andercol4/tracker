class HomeController < ApplicationController
  def index
    @most_recent = Seizure.last
    @time_of_day_data = generate_dataset(30)
  end
  def time_of_day
    seizure_times_array = generate_dataset(params[:time])
    render json: seizure_times_array
  end
  private
  def generate_dataset(time)
    @seizures = Seizure.get_by_time(time)
    seizure_times = Array.new(24, 0)
    @seizures.each do |seizure|
      seizure_times[seizure.date.hour] += 1
    end
    seizure_times
  end
end
