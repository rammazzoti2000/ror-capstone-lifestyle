class ArticlesController < ApplicationController
  before_action :logged_in_user_for_bookmark, only: [:bookmarks]
  before_action :logged_in_user, except: %i[show bookmarks search]
  before_action :non_editing_published_articles, only: %i[edit update]
  before_action :redirect_index_page, only: [:index]

  def index; end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
    @articles = Article.all_published_articles
    @comment = Comment.new
    @categories = Category.all
    @most_popular_articles = Article.most_popular_articles
    @all_suggested_articles = Article.all_suggested_article(@article.category.id, @article)
    @pageview = Article.where(author_id: current_user,
                              id: params[:id]).first_or_create
    @pageview.increment!(:views)
  end

  # rubocop:disable Metrics/PerceivedComplexity
  def create
    @article = current_user.articles.build(article_params)
    if params[:save_button]
      @article.status = 'saved'
      if @article.save
        flash['alert-success'] = 'Article saved successfully!'
        render :edit
      else
        render :new
      end
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
  # rubocop:enable Metrics/PerceivedComplexity

  def destroy
    @delete_article = Article.find(params[:id])
    @delete_article.destroy
    flash['alert-warning'] = 'Your article has been succesfully deleted!'
    redirect_to saved_articles_path
  end

  def published_articles
    @published_articles = Article.user_pub_articles(current_user)
  end

  def saved_articles
    @saved_articles = Article.user_save_articles(current_user)
  end

  def bookmarks
    @bookmarked_articles = Article.user_bookmarks(current_user)
  end

  def search
    @search_param = params[:q]
    @search_articles = Article.search_article(params[:q])
  end

  private

  def article_params
    params.required(:article).permit(:title, :text, :featured_image, :tag_list,
                                     :category_id, :author_id, :status)
  end

  def logged_in_user_for_bookmark
    return if logged_in?

    flash['alert-danger'] = 'You must be logged in to bookmark an article!'
    redirect_to(request.referer)
  end

  def redirect_index_page
    redirect_to(request.referer)
  end

  def non_editing_published_articles
    @article = Article.find(params[:id])
    return if @article.status != 'published'

    flash['alert-danger'] = 'You cannnot edit a published article!'
    redirect_to article_path(@article)
  end
end
