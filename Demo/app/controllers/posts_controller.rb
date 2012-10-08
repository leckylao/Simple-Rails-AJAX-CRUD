class PostsController < ApplicationController
  respond_to :html, :json

  before_filter :set_variables, :only => [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    respond_with @posts
  end

  def new
    @post = Post.new
    respond_with @post
  end

  def show
    @comments = @post.comments
    @comment = @post.comments.new
    respond_with @post
  end

  def create
    @post = Post.new(params[:post])
    @post.save
    respond_with @post
  end

  def edit
    respond_with @post
  end

  def update
    @post.update_attributes(params[:post])
    respond_with @post
  end

  def destroy
    @post.destroy
    respond_with @post
  end

  private
  def set_variables
    @post = Post.find(params[:id])
  end

end
