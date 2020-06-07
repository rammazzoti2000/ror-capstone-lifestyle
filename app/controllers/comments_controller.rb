class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    return unless @comment.save

    respond_to do |format|
      format.html { redirect_to(request.referer) }
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :body, :article_id)
  end
end
