module Api
  module V1
    class AttendanceRecordsController < ApplicationController

      def index
        render json: AttendanceRecord.where(schedule_id: params[:schedule_id]), include: 'student'
      end

      def show
        render json: AttendanceRecord.find(params[:id]), include: 'student, schedule'
      end
    end
  end
end
