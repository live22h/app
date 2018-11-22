class StoragesController < ApplicationController
  before_action :set_storage, only: [:show, :edit, :update, :destroy]

  # GET /storages
  # GET /storages.json
  def index
    @storages = Storage.all
  end

  # GET /storages/1
  # GET /storages/1.json
  def show
    b = Branch.find(@storage.branch_id)
    @title = "Филиал #{b.name}"
  end

  # GET /storages/new
  def new
    @storage = Storage.new
    @title = 'Добавить терминал'
  end

  # GET /storages/1/edit
  def edit
    @title = 'Изменить адрес терминала'
  end

  # POST /storages
  # POST /storages.json
  def create
    @storage = Storage.new(storage_params)
    @title = 'Добавить терминал'

    respond_to do |format|
      if @storage.save
        format.html { redirect_to @storage, notice: 'Адрес склада успешно добавлен' }
        format.json { render :show, status: :created, location: @storage }
      else
        format.html { render :new }
        format.json { render json: @storage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /storages/1
  # PATCH/PUT /storages/1.json
  def update
    respond_to do |format|
      if @storage.update(storage_params)
        format.html { redirect_to @storage, notice: 'Информация о складе изменена' }
        format.json { render :show, status: :ok, location: @storage }
      else
        format.html { render :edit }
        format.json { render json: @storage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storages/1
  # DELETE /storages/1.json
  def destroy
    @storage.destroy
    respond_to do |format|
      format.html { redirect_to storages_url, notice: 'Сведения о складе удалены' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_storage
      @storage = Storage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def storage_params
      params.require(:storage).permit(:branch_id, :address, :latitude, :longitude)
    end
end
