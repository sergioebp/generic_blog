  class PostsController < ApplicationController
    before_action :set_post, only: [:edit, :update, :destroy, :rate]
    before_action :authenticate_author!

    # GET /posts
    def index
      @posts = Post.all
    end

    # GET /posts/new
    def new
      @post = current_author.posts.build
    end

    def show
      @post = Post.find(params[:id])
      @author = @post.author
    end

    # GET /posts/1/edit
    def edit
      @element = @post.elements.build
    end

    # POST /posts
    def create
      @post = current_author.posts.build(post_params)

      if @post.save
        redirect_to edit_post_path(@post)
      else
        render :new
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @post.update(post_params)
        redirect_to edit_post_path(@post)
      else
        render :edit
      end
    end

    def rate
      rate = @post.rates.create(rate_params)
      rate.author = current_author
      rate.save!
    end

    # DELETE /posts/1
    def destroy
      @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = current_author.posts.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def post_params
        params.require(:post).permit(:title, :description, :header_image)
      end

      def rate_params
        params.require(:rate).permit(:value)
      end
  end
