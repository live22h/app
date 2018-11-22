class BranchesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update]

  include ApplicationHelper
  include AdduserHelper
  # before_action :authenticate_user!

  before_action :set_branch, only: [:show, :edit, :update, :destroy]

  # GET /branches
  # GET /branches.json
  def index
    @branches = Branch.all
  end

  # GET /branches/1
  # GET /branches/1.json
  def show
    @title = @branch.name
    respond_to do |format|
      format.html
      format.pdf do
        pdf = BranchPdf.new(@branch)
        send_data pdf.render, filename: "Карточка филиала ТК БСД #{@branch.name}.pdf"
      end
    end
  end

  def list
    @branches = Branch.all
    @title = 'Филиалы'
  end

  # GET /branches/new
  def new
    @branch = Branch.new
    @title = 'Добавить филиал БСД'
  end

  # GET /branches/1/edit
  def edit
    @title = 'Изменить данные о филиале'
  end

  # POST /branches
  # POST /branches.json
  def create
    @branch = Branch.new(branch_params)

    new_user_password = add_user_by_email(@branch.email)
    user = User.where(email: @branch.email).first

    respond_to do |format|
      if @branch.save
        user.roles << Role.find_by_id(2) # назначить директором
        user.branches << @branch
        format.html { redirect_to persons_profile_url, notice: 'Филиал успешно добавлен' }
        format.json { render :show, status: :created, location: @branch }
        ApplicationMailer.new_branch_admin(@branch, new_user_password).deliver
      else
        format.html { render :new }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /branches/1
  # PATCH/PUT /branches/1.json
  def update
    respond_to do |format|
      if @branch.update(branch_params)
        format.html { redirect_to @branch, notice: 'Сведения о филиале обновлены.' }
        format.json { render :show, status: :ok, location: @branch }
      else
        format.html { render :edit }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branches/1
  # DELETE /branches/1.json
  def destroy
    @branch.destroy
    respond_to do |format|
      format.html { redirect_to persons_profile_url(anchor: 'panel1c'), notice: 'Сведения о филиале удалены.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch
      @branch = Branch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def branch_params
      params.require(:branch).permit(:name, :email, :phone, :description, :background, :organization, :inn, :director, :address, :ogrn, :kpp, :region_kladr_id, :bank, :bik, :rs, :ks)
    end
end
