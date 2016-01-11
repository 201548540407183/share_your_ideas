class ArticlesController < ApplicationController
  before_action :set_article, only: [:show ,:edit, :update, :destroy]
  before_action :require_user,only: [:new, :list, :create, :edit, :destroy]
  before_action :user_right,only: [:edit,:destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  def list
    @user = User.find_by(id: session[:user_id])
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "Article has been successfully created."
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    if @article.update(article_params)
      flash[:success] = "Article has been successfully updated."
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    flash[:success] = "Article has been successfully deleted."
    redirect_to articles_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :description, :bootsy_image_gallery_id)
    end
end
