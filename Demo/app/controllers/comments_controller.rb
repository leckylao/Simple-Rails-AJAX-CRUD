class CommentsController < ApplicationController
  respond_to :html, :json

  before_filter :set_variables, :only => [:edit, :update, :destroy]

  def index
    @comments = Post.find(params[:post_id]).comments
    if request.xhr?
      render :partial => 'index', :locals => { :comments => @comments }
    else
      respond_with @comments
    end
  end

  def new
    @comment = Comment.new
    respond_with @comment
  end

  def create
    @comment = Comment.new(params[:comment])
    if @comment.save && request.xhr?
      render :partial => 'show', :locals => { :comment => @comment }
    else
      respond_with @comment
    end
  end

  def show
    @comment = Comment.find(params[:id])
    if request.xhr?
      render :partial => 'show', :locals => { :comment => @comment }
    else
      respond_with @comment
    end
  end

  def edit
    if request.xhr?
      render :partial => 'edit', :locals => { :comment => @comment }
    else
      respond_with @comment
    end
  end

  def update
    if @comment.update_attributes(params[:comment]) && request.xhr?
      render :partial => 'show', :locals => { :comment => @comment }
    else
      respond_with @comment
    end
  end

  def destroy
    @comment.destroy
    respond_with @comment
  end

  private
  def set_variables
    @comment = Comment.find(params[:id])
  end

end
