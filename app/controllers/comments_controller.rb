# Controller for Comment model.
# Contains the CRUD operations for the Comments model.
class CommentsController < ApplicationController
  before_action :authenticate_user!

  # Creates a new comment
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to article_path(@article)
  end

  # Destroys a comment
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commentor, :body, :status)
    end
end
