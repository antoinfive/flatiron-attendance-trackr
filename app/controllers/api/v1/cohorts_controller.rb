module Api  
  module V1
    class CohortsController < ApplicationController

      def index
       render json: Cohort.all
      end

      def show
        render json: Cohort.find(params[:id]), include: ['students']
      end
    end
  end
end
