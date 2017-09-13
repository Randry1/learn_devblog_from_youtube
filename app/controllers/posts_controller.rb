class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :destroy, :update]

  def index
    @posts = Post.paginate(:page => params[:page], per_page: 10)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new( post_params )

    if @post.save
      redirect_to @post, success: 'Статья создана'
    else
      flash[:danger] = 'Статья не сохранена'
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update_attributes( post_params )
      redirect_to @post, info: 'Статья успешно обновлена'
    else
      flash[:danger] = 'Статься не обновлена'
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: 'Статья удалена'
  end

  def contacts

  end

  private

  def post_params
    params.require(:post).permit(:title, :summary, :body, :image, :all_tags)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
