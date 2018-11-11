class BranchdirectorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_branchdirector, only: [:show, :edit, :update, :destroy]

  # GET /branchdirectors
  # GET /branchdirectors.json
  def index
    @branchdirectors = Branchdirector.all
    respond_to do |format|
          format.json {
            users = User.where('email LIKE ?', "%#{params[:query]}%").limit(10).order('email')
            render :json => { :query => params[:query], :suggestions => users.map(&:email), :data => users.map(&:id) }
          }
        end

  end

  # GET /branchdirectors/1
  # GET /branchdirectors/1.json
  def show
  end

  # GET /branchdirectors/new
  def new
    @branchdirector = Branchdirector.new
  end

  # GET /branchdirectors/1/edit
  def edit
  end

  # POST /branchdirectors
  # POST /branchdirectors.json
  def create
    @branchdirector = Branchdirector.new(branchdirector_params)

    respond_to do |format|
      if @branchdirector.save
        format.html { redirect_to @branchdirector, notice: 'Администратор филиала назначен.' }
        format.json { render :show, status: :created, location: @branchdirector }
      else
        format.html { render :new }
        format.json { render json: @branchdirector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /branchdirectors/1
  # PATCH/PUT /branchdirectors/1.json
  def update
    respond_to do |format|
      if @branchdirector.update(branchdirector_params)
        format.html { redirect_to @branchdirector, notice: 'Администратор филиала изменен.' }
        format.json { render :show, status: :ok, location: @branchdirector }
      else
        format.html { render :edit }
        format.json { render json: @branchdirector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branchdirectors/1
  # DELETE /branchdirectors/1.json
  def destroy
    @branchdirector.destroy
    respond_to do |format|
      format.html { redirect_to branchdirectors_url, notice: 'Администратор филиала удален.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branchdirector
      @branchdirector = Branchdirector.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def branchdirector_params
      params.require(:branchdirector).permit(:branch_id, :user_id)
    end
end
