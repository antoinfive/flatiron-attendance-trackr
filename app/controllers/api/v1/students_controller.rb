module Api
  module V1
    class StudentsController < ApplicationController
      before_action :set_student 

      def show 
        
        render json: @student.attendance_records
      end

      private 
      
      def set_student
        @student = User.find(params[:id])
      end

    end
  end
end
