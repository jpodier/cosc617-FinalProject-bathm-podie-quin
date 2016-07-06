class WallPostsController < ApplicationController
  before_action :set_wall_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_person!

  # GET /wall_posts
  # GET /wall_posts.json
  def index
    @wall_posts = WallPost.all
  end

  # GET /wall_posts/1
  # GET /wall_posts/1.json
  def show
  end

  # GET /wall_posts/new
  def new
    @wall_post = WallPost.new
  end

  # GET /wall_posts/1/edit
  def edit
  end

  # POST /wall_posts
  # POST /wall_posts.json
  def create
    @wall_post = WallPost.new(wall_post_params)

    respond_to do |format|
      if @wall_post.save
        format.html { redirect_to @wall_post, notice: 'Wall post was successfully created.' }
        format.json { render :show, status: :created, location: @wall_post }
      else
        format.html { render :new }
        format.json { render json: @wall_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wall_posts/1
  # PATCH/PUT /wall_posts/1.json
  def update
    respond_to do |format|
      if @wall_post.update(wall_post_params)
        format.html { redirect_to @wall_post, notice: 'Wall post was successfully updated.' }
        format.json { render :show, status: :ok, location: @wall_post }
      else
        format.html { render :edit }
        format.json { render json: @wall_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wall_posts/1
  # DELETE /wall_posts/1.json
  def destroy
    @wall_post.destroy
    respond_to do |format|
      format.html { redirect_to wall_posts_url, notice: 'Wall post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wall_post
      @wall_post = WallPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wall_post_params
      params.require(:wall_post).permit(:text, :date, :person)
    end
end
