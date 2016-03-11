class SeizureController < ApplicationController
  def index
    @seizures = Seizure.all
  end

  def show
    @seizure = Seizure.find(params[:id])
  end
end
