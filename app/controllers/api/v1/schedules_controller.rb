module Api
  module V1
    class SchedulesController < ApplicationController

      def create
      end

      def show
        render json: Schedule.find(params[:id]), include: 'cohort', serializer: ScheduleWithAttendanceRecordsByDate
      end
    end
  end
end

