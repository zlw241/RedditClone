class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :ensure_logged_in, only: [:create, :new, :destroy]
  before_action :ensure_author, only: [:edit, :update]
  # GET /posts
  # GET /posts.json
  # def index
  #   @posts = Post.all
  # end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @sub = Sub.find(params[:sub_id])
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    #@post = Post.new(post_params)
    # @sub = Sub.find(params[:sub_id])
    # @post = @sub.posts.new(post_params)
    # @post.user_id = current_user.id
    # @post.subs.new(@post)
    # fail
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      render :show
    else

      flash_errors(@post)
      render :new
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      render :show
    else
      flash_errors(@post)
      render :edit
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  def ensure_author
    redirect_to post_url(@post) unless current_user.id == @post.user_id
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :url, :content, sub_ids: [])
    end
end
