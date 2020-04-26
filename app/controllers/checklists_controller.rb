class ChecklistsController < ApplicationController
  before_action :set_checklist, only: [:show, :edit, :update, :destroy]

  # GET /checklists
  def index
    @checklists = Checklist.all
  end

  # GET /checklists/1
  def show
  end

  # GET /checklists/new
  def new
    @checklist = Checklist.new
  end

  # GET /checklists/1/edit
  def edit
  end

  # POST /checklists
  def create
    @checklist = Checklist.new(checklist_params)
    @checklist.lastWatered = Date.today
    @checklist.nextWatered = Date.today + 3.days

    if @checklist.save
      redirect_to checklists_url, notice: 'Checklist was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /checklists/1
  def update
    if @checklist.update(checklist_params)
      redirect_to checklists_url, notice: 'Checklist was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /checklists/1
  def destroy
    @checklist.destroy
    redirect_to checklists_url, notice: 'Checklist was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checklist
      @checklist = Checklist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def checklist_params
      params.require(:checklist).permit(:memberID, :plantID, :plantName, :checklistFlag, :nextWatered, :lastWatered)
    end
end
