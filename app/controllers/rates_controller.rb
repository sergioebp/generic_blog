class RatesController < ApplicationController
  before_action :set_rate, only: [:edit, :update, :destroy]


  # GET /rates/new
  def new
    @rate = Rate.new
  end

  # GET /rates/1/edit
  def edit
  end

  # POST /rates
  def create
    binding.pry
    @rate = Rate.new(
      value: params[:rate][:value],
      rateable: params[:rate][:rateable],
      author: current_author
    )
    if @rate.save
      redirect_to post_path(@post), notice: 'Rate was successfully created.'
    else
      redirect_to post_path(@post), notice: 'Rate was not successfully created.'
    end
  end

  # PATCH/PUT /rates/1
  def update
    if @rate.update(rate_params)
      redirect_to @rate, notice: 'Rate was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /rates/1
  def destroy
    @rate.destroy
    redirect_to rates_url, notice: 'Rate was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_rate
    #  @rate = Rate.find(params[:id])
    #end
    def set_post
      if @rate.rateable_type == 'Post'
        @post = Post.find(@rate.rateable_id)
      end
    end

    # Only allow a list of trusted parameters through.
    def rate_params
      params.require(:rate).permit(:value, :rateable)
    end
end
