class CommentsController < ApplicationController
	before_action :authenticate_user!

    def create
      comment = current_user.comments.build(comment_params)
      if comment.save
        redirect_back(fallback_location: root_path)
      else
        flash_blok('Вибачте, ваш коментар не збережено(', 'error')
        redirect_back(fallback_location: root_path)
      end
    end

    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_back(fallback_location: root_path)
    end

    private

    def comment_params
      params.require(:comment).permit(:user_id, :object_id, :object_type, :text)
    end
end
