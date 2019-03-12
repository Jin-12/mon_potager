class UsersController < ApplicationController
    def show
        @userid = current_session.id
    end
    
    def create
    end

    def edit
    end

    def destroy
    end

    private

    def correct_user
        @user = User.find(params[:id].to_i)
        if current_user != @user
          flash[:alert] = "This profile is not accessible"
          redirect_to root_path
        end
    end 
end
