class SubsController < ApplicationController
  before_action :set_sub, only: [:show, :edit, :update, :destroy]
  before_action :ensure_logged_in, only: [:create, :new, :destroy]
  before_action :ensure_moderator, only: [:edit, :update]

  # GET /subs
  # GET /subs.json
  def index
    @subs = Sub.all
  end

  # GET /subs/1
  # GET /subs/1.json
  def show
  end

  # GET /subs/new
  def new
    @sub = Sub.new
  end

  # GET /subs/1/edit
  def edit
  end

  # POST /subs
  # POST /subs.json
  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save
      render :show
    else
      flash_errors(@sub)
      render :new
    end
  end

  # PATCH/PUT /subs/1
  # PATCH/PUT /subs/1.json
  def update
    @sub = current_user.subs.find(params[:id])
    if @sub.update(sub_params)
      render :show
    else
      flash_errors(@sub)
      render :new
    end
  end

  # DELETE /subs/1
  # DELETE /subs/1.json
  def destroy
    @sub.destroy
    respond_to do |format|
      format.html { redirect_to subs_url, notice: 'Sub was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def ensure_moderator
    redirect_to subs_url unless current_user.id == @sub.user_id
  end

    # Use callbacks to share common setup or constraints between actions.
  def set_sub
    @sub = Sub.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def sub_params
    params.require(:sub).permit(:title, :description, :user_id)
  end
end
