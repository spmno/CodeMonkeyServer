class NewSkillGetKindsController < ApplicationController
  before_action :set_new_skill_get_kind, only: [:show, :edit, :update, :destroy]

  # GET /new_skill_get_kinds
  # GET /new_skill_get_kinds.json
  def index
    @new_skill_get_kinds = NewSkillGetKind.all
  end

  # GET /new_skill_get_kinds/1
  # GET /new_skill_get_kinds/1.json
  def show
  end

  # GET /new_skill_get_kinds/new
  def new
    @new_skill_get_kind = NewSkillGetKind.new
  end

  # GET /new_skill_get_kinds/1/edit
  def edit
  end

  # POST /new_skill_get_kinds
  # POST /new_skill_get_kinds.json
  def create
    @new_skill_get_kind = NewSkillGetKind.new(new_skill_get_kind_params)

    respond_to do |format|
      if @new_skill_get_kind.save
        format.html { redirect_to @new_skill_get_kind, notice: 'New skill get kind was successfully created.' }
        format.json { render action: 'show', status: :created, location: @new_skill_get_kind }
      else
        format.html { render action: 'new' }
        format.json { render json: @new_skill_get_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /new_skill_get_kinds/1
  # PATCH/PUT /new_skill_get_kinds/1.json
  def update
    respond_to do |format|
      if @new_skill_get_kind.update(new_skill_get_kind_params)
        format.html { redirect_to @new_skill_get_kind, notice: 'New skill get kind was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @new_skill_get_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /new_skill_get_kinds/1
  # DELETE /new_skill_get_kinds/1.json
  def destroy
    @new_skill_get_kind.destroy
    respond_to do |format|
      format.html { redirect_to new_skill_get_kinds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_skill_get_kind
      @new_skill_get_kind = NewSkillGetKind.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def new_skill_get_kind_params
      params.require(:new_skill_get_kind).permit(:title)
    end
end
