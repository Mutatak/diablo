# Controller for the Article model.
# Contains the CRUD operations for the Articles model.
class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  # Shows all articles
  def index
    @articles = Article.all
  end

  # Shows a single article
  def show
    @article = Article.find(params[:id])
  end

  # Creates a new article
  def new
    @article = Article.new
  end

  # Creates an article with the current user as the author
  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Edits an article
  def edit
    @article = Article.find(params[:id])
  end

  # Updates an article
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Destroys an article
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :status)
  end
end
