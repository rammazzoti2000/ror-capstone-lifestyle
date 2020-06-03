class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
    @articles = Article.all
    @comment = Comment.new
    @categories = Category.all

    @pageview = Article.where(author_id: current_user,
                              id: params[:id]).first_or_create
    @pageview.increment!(:views)
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
        redirect_to article_path(@article)
      else
        render :new
      end
    end
  end

   def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if params[:save_button]
      @article.status = 'saved'
      if @article.update(article_params)
        redirect_to(request.referer)
        flash['alert-success'] = 'Article saved successfully!'
      else
        render :edit
      end
    elsif params[:publish_button]
      @article.status = 'published'
      if @article.update(article_params)
        flash['alert-success'] = 'Article published successfully!'
        redirect_to article_path(@article)
      else
        render :edit
      end
    end
  end

  def published_articles
  end

  def saved_articles
  end

  def bookmarks
  end

  def search
    @search_articles = Article.search_article(params[:q])
  end

  def increment
    @pageview = Article.where(author_id: current_user, id: params[:id]).first_or_create
    @pageview.increment!(:views)
  end

  private

    def article_params
      params.required(:article).permit(:title, :text, :tag,
                                       :featured_image, :tag_list,
                                       :category_id, :author_id, :status)
    end
end
