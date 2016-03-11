class HomeController < ApplicationController
  def index
    @most_recent = Seizure.last
  end
end
