class StatusesController < ApplicationController
    def index
        @status = Status.all.sort_by { |status| status.created_at }
    end

    def show
    end
    
    def create
        Status.create(content: params[:content], user_id: current_user.id)
    end

    def edit
    end

    def destroy
    end
end
