class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    # @article = Article.new
    @article = current_user.articles.build(article_params)
    if params[:save_button]
      @article.status = 'saved'
      if @article.save
        flash['alert-success'] = 'Article saved successfully!'
      end
      render :new
    elsif params[:publish_button]
      @article.status = 'published'
      if @article.save
        flash['alert-success'] = 'Article published successfully!'
        redirect_to article_path(1)
      else
        render :new
      end
    end

  end

  private

  def article_params
    params.required(:article).permit(:title, :text, :tag, :featured_image,
                                     :category_id, :author_id, :status)
  end
end
