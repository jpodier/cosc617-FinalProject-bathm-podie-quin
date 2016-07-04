class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :update, :edit, :destroy]
  before_action :authenticate_person!

  # GET /friendships
  # GET /friendships.json
  def index
    @friendships = Friendship.all
  end

  # GET /friendships/1
  # GET /friendships/1.json
  def show
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit
  end

  # POST /friendships
  # POST /friendships.json
  def create
    @friendship = current_person.friendships.build(:granter_id => params[:granter_id], :accepted => params[:accepted])

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to people_url, notice: 'A friend request has been sent to ' + Person.find(params[:granter_id]).name }
        format.json { render :show, status: :created, location: @friendship }
      else
        format.html { render :new }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friendships/1
  # PATCH/PUT /friendships/1.json
  def update

    respond_to do |format|
      if @friendship.update(params.permit(:id, :accepted))
        # now build a friendship in the opposite direction
        @other_friendship = current_person.friendships.build(:granter_id => @friendship.requester_id, :accepted => true)
        @other_friendship.save

        format.html { redirect_to people_url, notice: 'You and ' + Person.find(@friendship.requester_id).name + ' are now friends!' }
        format.json { render :show, status: :ok, location: @friendship }
      else
        format.html { render :edit }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    if @friendship.accepted
      @other_friendship = Friendship.find_by :requester_id => @friendship.granter_id, :granter_id => @friendship.requester_id
      @other_friendship.destroy
      notice = 'You and ' + Person.find(@friendship.granter_id).name + ' are no longer friends!'
    else
      notice = 'You have cancelled your friend request to ' + Person.find(@friendship.granter_id).name
    end
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: notice }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friendship_params
      params.require(:friendship).permit(:requester_id, :granter_id, :accepted)
    end
end
