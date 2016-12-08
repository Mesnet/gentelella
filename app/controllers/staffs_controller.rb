class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]

  # GET /ranches
  # GET /ranches.json
  def index
    @staffs = current_user.staffs
  end

  # GET /ranches/1
  # GET /ranches/1.json
  def show
    
  end

  # GET /ranches/new
  def new
    @staff = Staff.new
    @all_ranch = current_user.ranches
    @staff_ranch = @staff.ranchstaffs.build
  end

  # GET /ranches/1/edit
  def edit
  end

  # POST /ranches
  # POST /ranches.json
  def create
    @staff = Staff.new(staff_params)

    @staff.update(user_id: current_user.id)
    respond_to do |format|
      if @staff.save
        format.html { redirect_to @staff, notice: 'Staff was successfully created.' }
        format.json { render :show, status: :created, location: @staff }
      else
        format.html { render :new }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ranches/1
  # PATCH/PUT /ranches/1.json
  def update
    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to @staff, notice: 'Staff was successfully updated.' }
        format.json { render :show, status: :ok, location: @staff }
      else
        format.html { render :edit }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ranches/1
  # DELETE /ranches/1.json
  def destroy
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to staffs_url, notice: 'Ranch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_params
      params.require(:staff).permit(:name, :user_id, :cat, :ranch_id)
    end
end
