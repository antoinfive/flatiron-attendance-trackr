module Api
  module V1
    class AttendanceRecordsController < ApplicationController

      def index
        render json: AttendanceRecord.all.take(10)
        # render json: AttendanceRecord.where(schedule_id: params[:schedule_id])
      end

      def show
        render json: AttendanceRecord.find(params[:id]), include: 'student, schedule'
      end
    end
  end
end
