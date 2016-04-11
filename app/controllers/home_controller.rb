class HomeController < ApplicationController

  def index
    @most_recent = Seizure.last
    @time_of_day_data = generate_time_of_day_dataset(30)
    @tags = Seizure.tag_counts_on(:tags)
    @recent_seizures = generate_recent_seizures_dataset
  end

  def time_of_day
    seizure_times_array = generate_time_of_day_dataset(params[:time])
    render json: seizure_times_array
  end

  private

  def generate_time_of_day_dataset(time)
    seizures = Seizure.get_by_time(time)
    seizure_times = Array.new(24, 0)
    seizures.each do |seizure|
      seizure_times[seizure.date.hour] += 1
    end
    seizure_times
  end

  def generate_recent_seizures_dataset(time = 31)
    dataset = Hash.new
    time.to_i.times do |i|
      dataset[i.days.ago.strftime('%b %-d')] = 0
    end
    seizures = Seizure.get_by_time(time - 1)
    seizures.each do |seizure|
      # binding.pry
      dataset[seizure.date.strftime('%b %-d')] += 1
    end
    dataset
  end
end
