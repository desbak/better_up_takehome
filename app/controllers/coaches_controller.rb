class CoachesController < ApplicationController
  before_action :set_coach, only: [:show, :edit, :update, :destroy]

  # GET /coaches
  # GET /coaches.json
  def index
    @coaches = Coach.all
  end

  # GET /coaches/1
  # GET /coaches/1.json
  def show
    all_availabilities = @coach.availability_blocks
                               .select(:id, :day, :start_time, :end_time)
                               .order(:start_time)
    @availabilities = []
    (Date.today+1..Date.today+7).map do |d|
      day = d.strftime('%A')

      appointments = Appointment.where(coach: @coach, date: d).collect(&:availability_block_id)
      blocks = all_availabilities.select { |a| a.day == day && (not appointments.include? a.id) }      

      @availabilities << { date: d,
                           day: day,
                           availability: blocks.map { |b| { id: b.id,
                                                            start_time: b.start_time.strftime("%I:%M %p"),
                                                            end_time: b.end_time.strftime("%I:%M %p")
                                                          }
                                                    }
                          }

    end
  end

  # # GET /coaches/new
  # def new
  #   @coach = Coach.new
  # end

  # # GET /coaches/1/edit
  # def edit
  # end

  # # POST /coaches
  # # POST /coaches.json
  # def create
  #   @coach = Coach.new(coach_params)

  #   respond_to do |format|
  #     if @coach.save
  #       format.html { redirect_to @coach, notice: 'Coach was successfully created.' }
  #       format.json { render :show, status: :created, location: @coach }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @coach.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /coaches/1
  # # PATCH/PUT /coaches/1.json
  # def update
  #   respond_to do |format|
  #     if @coach.update(coach_params)
  #       format.html { redirect_to @coach, notice: 'Coach was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @coach }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @coach.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /coaches/1
  # # DELETE /coaches/1.json
  # def destroy
  #   @coach.destroy
  #   respond_to do |format|
  #     format.html { redirect_to coaches_url, notice: 'Coach was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coach
      @coach = Coach.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coach_params
      params.require(:coach).permit(:name, :time_zone)
    end
end
