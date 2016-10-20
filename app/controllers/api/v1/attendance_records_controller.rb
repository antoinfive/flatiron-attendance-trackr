module Api
  module V1
    class AttendanceRecordsController < ApplicationController

      def index
        binding.pry
        @schedule = Schedule.find(params[:schedule_id])
        render json: @schedule, serializer: ScheduleWithAttendanceRecordsByDateSerializer
        # render json: AttendanceRecord.where(schedule_id: params[:schedule_id])
      end

      def show
        render json: AttendanceRecord.find(params[:id]), include: 'student, schedule'
      end
    end
  end
end
