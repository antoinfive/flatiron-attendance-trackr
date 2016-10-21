module Api
  module V1
    class AttendanceRecordsController < ApplicationController

      def index
        if current_user.instructor?
          render json: current_user.active_cohort.attendance_records_by_date
        else
          render json: current_user.attendance_records
        end
      end

      def show
        render json: AttendanceRecord.find(params[:id]), include: 'student, schedule'
      end
    end
  end
end
