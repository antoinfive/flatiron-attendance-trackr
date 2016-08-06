class CohortsController < ApplicationController

  def index
   render json: Cohort.all
  end

  def show
    render json: Cohort.find(params[:id])
  end
end
