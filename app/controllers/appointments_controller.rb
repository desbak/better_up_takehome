class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # # GET /appointments
  # # GET /appointments.json
  # def index
  #   @appointments = Appointment.all
  # end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
    @coach = Coach.find(params[:coach_id])
    @availability_block = AvailabilityBlock.find(params[:availability_block_id])
    @date = params[:date]
  end

  # # GET /appointments/1/edit
  # def edit
  # end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appt_params)
    @coach = Coach.find(appt_params[:coach_id])
    @availability_block = AvailabilityBlock.find(appt_params[:availability_block_id])
    @date = appt_params[:date]

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # # PATCH/PUT /appointments/1
  # # PATCH/PUT /appointments/1.json
  # def update
  #   respond_to do |format|
  #     if @appointment.update(appt_params)
  #       format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @appointment }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @appointment.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /appointments/1
  # # DELETE /appointments/1.json
  # def destroy
  #   @appointment.destroy
  #   respond_to do |format|
  #     format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appt_params
      params.require(:appointment).permit(:coach_id, :availability_block_id, :date, :client_name)
    end
end
