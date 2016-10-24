module Api  
  module V1
    class StudentsController < ApplicationController

      def index

       render json: current_user.active_cohort.students
      end

    end
  end
end
