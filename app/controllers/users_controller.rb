class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token 
    def index
        render json: User.all
    end

    def new
        redirect_to '/signup'
    end

    def create
        first_name = params[:first_name]
        last_name = params[:last_name]
        email = params[:email]
        address = params[:address]
        password_digest = params[:password]

        new_user = User.create!(
            first_name: first_name,
            last_name: last_name,
            email: email,
            address: address,
            password: password_digest,
        )
        render plain: "Working!!"
    end
end