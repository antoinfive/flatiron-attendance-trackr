module Api
  module V1
    class UsersController < ApplicationController
      def me
        puts "#{request.env['HTTP_AUTHORIZATION']}"
        binding.pry
        render json: {current_user: current_user}
      end
    end
  end
end
