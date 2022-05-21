class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    respond_to :html, :json
    def index
        render json: session[:current_user_id];
    end
    def create
        user = User.find_by_email(params[:user][:email])
        puts params[:user][:password]
        if user && user.authenticate(params[:user][:password])
        #     session[:current_user_id] = user.id
        #     render :json => {:user_id => user.id}, :status => 200
        #     # render json: user
        # else
        #     flash[:error] = "Your login attempt was invalid, Please retry!"
        #     render :json => {:responseText => "Your login attempt was invalid, Please retry!"}, :status => 403
        #     # render json: nil
            if request.format.json?
                data = {
                token: user.authentication_token,
                email: user.email
                }
                render json: data, status: 201 and return
                #redirect_to "/index" and return

            end
        else
            render json: {:msg => "Failed"}, status: 403 and return
        end
    end
    def destroy
        session[:current_user_id] = nil
        @current_user = nil
        render json: "Signed out"
    end
end