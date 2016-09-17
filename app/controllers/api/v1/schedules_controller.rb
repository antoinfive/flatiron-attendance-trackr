module Api
  module V1
    class SchedulesController < ApplicationController

      def show
        render json: Schedule.find(params[:id]), serializer: ScheduleWithAttendanceRecordsByDateSerializer
      end
    end
  end
end