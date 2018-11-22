class NewslinesController < ApplicationController
  before_action :set_newsline, only: [:show, :edit, :update, :destroy]

  # GET /newslines
  # GET /newslines.json
  def index
    @newslines = Newsline.all
  end

  # GET /newslines/1
  # GET /newslines/1.json
  def show
  end

  # GET /newslines/new
  def new
    @newsline = Newsline.new
  end

  # GET /newslines/1/edit
  def edit
  end

  # POST /newslines
  # POST /newslines.json
  def create
    @newsline = Newsline.new(newsline_params)

    respond_to do |format|
      if @newsline.save
        format.html { redirect_to @newsline, notice: 'Newsline was successfully created.' }
        format.json { render :show, status: :created, location: @newsline }
      else
        format.html { render :new }
        format.json { render json: @newsline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newslines/1
  # PATCH/PUT /newslines/1.json
  def update
    respond_to do |format|
      if @newsline.update(newsline_params)
        format.html { redirect_to @newsline, notice: 'Newsline was successfully updated.' }
        format.json { render :show, status: :ok, location: @newsline }
      else
        format.html { render :edit }
        format.json { render json: @newsline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newslines/1
  # DELETE /newslines/1.json
  def destroy
    @newsline.destroy
    respond_to do |format|
      format.html { redirect_to newslines_url, notice: 'Newsline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsline
      @newsline = Newsline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newsline_params
      params.fetch(:newsline, {})
    end
end
