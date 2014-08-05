class NewSkillGetsController < ApplicationController
  before_action :set_new_skill_get, only: [:show, :edit, :update, :destroy]

  # GET /new_skill_gets
  # GET /new_skill_gets.json
  def index
    @new_skill_gets = NewSkillGet.all
  end

  # GET /new_skill_gets/1
  # GET /new_skill_gets/1.json
  def show
  end

  # GET /new_skill_gets/new
  def new
    @new_skill_get = NewSkillGet.new
  end

  # GET /new_skill_gets/1/edit
  def edit
  end

  # POST /new_skill_gets
  # POST /new_skill_gets.json
  def create
    @new_skill_get = NewSkillGet.new(new_skill_get_params)

    respond_to do |format|
      if @new_skill_get.save
        format.html { redirect_to @new_skill_get, notice: 'New skill get was successfully created.' }
        format.json { render action: 'show', status: :created, location: @new_skill_get }
      else
        format.html { render action: 'new' }
        format.json { render json: @new_skill_get.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /new_skill_gets/1
  # PATCH/PUT /new_skill_gets/1.json
  def update
    respond_to do |format|
      if @new_skill_get.update(new_skill_get_params)
        format.html { redirect_to @new_skill_get, notice: 'New skill get was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @new_skill_get.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /new_skill_gets/1
  # DELETE /new_skill_gets/1.json
  def destroy
    @new_skill_get.destroy
    respond_to do |format|
      format.html { redirect_to new_skill_gets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_skill_get
      @new_skill_get = NewSkillGet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def new_skill_get_params
      params.require(:new_skill_get).permit(:title, :content)
    end
end
