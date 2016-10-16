module Api
  module V1
    class UsersController < ApplicationController
      def me
        puts "#{request.env['HTTP_AUTHORIZATION']}"
        render json: {current_user: "some dude"}
      end
    end
  end
end
