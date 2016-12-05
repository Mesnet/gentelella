class RanchesController < ApplicationController
  before_action :set_ranch, only: [:show, :edit, :update, :destroy]

  # GET /ranches
  # GET /ranches.json
  def index
    @ranches = Ranch.all
  end

  # GET /ranches/1
  # GET /ranches/1.json
  def show
    @tasks = @ranch.tasks.all
  end

  # GET /ranches/new
  def new
    @ranch = Ranch.new
  end

  # GET /ranches/1/edit
  def edit
  end

  # POST /ranches
  # POST /ranches.json
  def create
    @ranch = Ranch.new(ranch_params)

    respond_to do |format|
      if @ranch.save
        format.html { redirect_to @ranch, notice: 'Ranch was successfully created.' }
        format.json { render :show, status: :created, location: @ranch }
      else
        format.html { render :new }
        format.json { render json: @ranch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ranches/1
  # PATCH/PUT /ranches/1.json
  def update
    respond_to do |format|
      if @ranch.update(ranch_params)
        format.html { redirect_to @ranch, notice: 'Ranch was successfully updated.' }
        format.json { render :show, status: :ok, location: @ranch }
      else
        format.html { render :edit }
        format.json { render json: @ranch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ranches/1
  # DELETE /ranches/1.json
  def destroy
    @ranch.destroy
    respond_to do |format|
      format.html { redirect_to ranches_url, notice: 'Ranch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ranch
      @ranch = Ranch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ranch_params
      params.require(:ranch).permit(:name)
    end
end
