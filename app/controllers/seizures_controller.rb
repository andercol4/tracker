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
    binding.pry
  end
  private

  def seizure_params
    params.require(:seizure).permit(:date, :length, :notes, :medicine_taken, :tag_list)
  end
end
