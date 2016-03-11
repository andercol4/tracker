class SeizuresController < ApplicationController
  def index
    @seizures = Seizure.all.order(created_at: :desc)
  end

  def show
    @seizure = Seizure.find(params[:id])
  end
end
