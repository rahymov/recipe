class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
		@recipe = Recipe.find(params[:recipe_id])
		@comment = @recipe.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
		redirect_to recipe_path(@recipe)
	end

	def destroy
		@recipe = Recipe.find(params[:recipe_id])
		@comment = @recipe.comments.find(params[:id])

		@comment.destroy
		redirect_to recipe_path(@recipe)
	end
  private
  def comment_params
    params.require(:comment).permit(:title, :body, :user_id, :recipe_id)
  end
end
