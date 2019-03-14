class CommentsController < ApplicationController
    def create
        Comment.create(commentable_type: Garden, commentable_id: params[:id], content: params[:content], user_id: current_user.id)
    end

    def show
        @comments = Comment.where(commentable_id: params[:id])
    end
end
