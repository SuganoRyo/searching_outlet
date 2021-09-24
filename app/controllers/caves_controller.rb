class CavesController < ApplicationController
  before_action :set_cafe, only: %i[show edit update destroy]

  # GET /caves or /caves.json
  def index
    @q = Cafe.ransack(params[:q])
    @caves = @q.result(distinct: true)
  end

  # GET /caves/1 or /caves/1.json
  def show
  end

  # GET /caves/new
  def new
    @cafe = Cafe.new
  end

  # GET /caves/1/edit
  def edit
  end

  # POST /caves or /caves.json
  def create
    @cafe = Cafe.new(cafe_params)
    @cafe.user_id = current_user.id
    respond_to do |format|
      if @cafe.save
        format.html { redirect_to @cafe, notice: "登録しました" }
        format.json { render :show, status: :created, location: @cafe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caves/1 or /caves/1.json
  def update
    respond_to do |format|
      if @cafe.update(cafe_params)
        format.html { redirect_to @cafe, notice: "更新しました" }
        format.json { render :show, status: :ok, location: @cafe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caves/1 or /caves/1.json
  def destroy
    @cafe.destroy
    respond_to do |format|
      format.html { redirect_to caves_url, notice: "削除しました" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cafe
      @cafe = Cafe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cafe_params
      params.require(:cafe).permit(:image, :name, :address, :business_hours, :end_business_hours, :number_seats, :wifi, :user_id)
    end
  end
end
