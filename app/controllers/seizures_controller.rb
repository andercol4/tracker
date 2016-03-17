class SeizuresController < ApplicationController
  def index
    @seizures = Seizure.all.order(created_at: :desc)
  end

  def show
    @seizure = Seizure.find(params[:id])
  end

  def new
    @seizure = Seizure.new
  end

  def create
    @seizure = Seizure.new(seizure_params)
    @seizure.length = @seizure.encrypt_length
    @seizure.save
    redirect_to root_path
  end

  def average
    @seizures = Seizure.get_by_time(params[:time])
    average = find_average(@seizures)
    render json: {average: average}
  end
  private

  def find_average(seizures)
    if seizures.any?
      total = 0
      seizures.each do |seizure|
        total = total += seizure.length
      end
      average = total / seizures.count
      parse_length(average)
    else
      average = '0:00'
    end
  end
  def parse_length(length)
    minutes = length.to_s.split('')
    second_percent = minutes.pop(2)
    minutes = minutes.join('')
    seconds = second_percent.join('').to_i / 100.0 * 60
    seconds = seconds.to_i
    if seconds < 10
      time = minutes + ':0' + seconds.to_s
    else
      time = minutes + ':' + seconds.to_s
    end
  end
  def seizure_params
    params.require(:seizure).permit(:date, :length, :notes, :medicine_taken, :tag_list)
  end
end
