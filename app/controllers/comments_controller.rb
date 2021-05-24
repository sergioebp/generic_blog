class CommentsController < ApplicationController
  before_action :set_post, only: [:edit, :create, :update, :destroy, :rate]
  before_action :set_comment, only: [:edit, :update, :destroy, :rate]

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    @comment = @post.comments.create(comment_params)
    @comment.author = current_author

    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      redirect_to @post, notice: 'Comment was not successfully created.'
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def rate
    rate = @comment.rates.create(rate_params)
    rate.author = current_author
    rate.save!


  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    redirect_to @post, notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end

    def rate_params
      params.require(:rate).permit(:value)
    end
end
