class AvailabilityBlocksController < ApplicationController
  before_action :set_availability_block, only: [:show, :edit, :update, :destroy]

  # GET /availability_blocks
  # GET /availability_blocks.json
  def index
    @availability_blocks = AvailabilityBlock.all
  end

  # GET /availability_blocks/1
  # GET /availability_blocks/1.json
  def show
  end

  # GET /availability_blocks/new
  def new
    @availability_block = AvailabilityBlock.new
  end

  # GET /availability_blocks/1/edit
  def edit
  end

  # POST /availability_blocks
  # POST /availability_blocks.json
  def create
    @availability_block = AvailabilityBlock.new(availability_block_params)

    respond_to do |format|
      if @availability_block.save
        format.html { redirect_to @availability_block, notice: 'Availability block was successfully created.' }
        format.json { render :show, status: :created, location: @availability_block }
      else
        format.html { render :new }
        format.json { render json: @availability_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /availability_blocks/1
  # PATCH/PUT /availability_blocks/1.json
  def update
    respond_to do |format|
      if @availability_block.update(availability_block_params)
        format.html { redirect_to @availability_block, notice: 'Availability block was successfully updated.' }
        format.json { render :show, status: :ok, location: @availability_block }
      else
        format.html { render :edit }
        format.json { render json: @availability_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /availability_blocks/1
  # DELETE /availability_blocks/1.json
  def destroy
    @availability_block.destroy
    respond_to do |format|
      format.html { redirect_to availability_blocks_url, notice: 'Availability block was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_availability_block
      @availability_block = AvailabilityBlock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def availability_block_params
      params.require(:availability_block).permit(:coach_id, :day, :start_time, :end_time)
    end
end
