class Admin::EmailDigetsController < Admin::AdminController
  before_action :set_email_diget, only: [:show, :edit, :update, :destroy]

  def index
    @email_digets = EmailDiget.all
  end

  def show
  end

  def new
    @email_diget = EmailDiget.new
  end

  def edit
  end

  # POST /email_digets
  # POST /email_digets.json
  def create
    @email_diget = EmailDiget.new(email_diget_params)

    respond_to do |format|
      if @email_diget.save
        format.html { redirect_to @email_diget, notice: 'Email diget was successfully created.' }
        format.json { render :show, status: :created, location: @email_diget }
      else
        format.html { render :new }
        format.json { render json: @email_diget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_digets/1
  # PATCH/PUT /email_digets/1.json
  def update
    respond_to do |format|
      if @email_diget.update(email_diget_params)
        format.html { redirect_to @email_diget, notice: 'Email diget was successfully updated.' }
        format.json { render :show, status: :ok, location: @email_diget }
      else
        format.html { render :edit }
        format.json { render json: @email_diget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_digets/1
  # DELETE /email_digets/1.json
  def destroy
    @email_diget.destroy
    respond_to do |format|
      format.html { redirect_to email_digets_url, notice: 'Email diget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_diget
      @email_diget = EmailDiget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_diget_params
      params.require(:email_diget).permit(:email)
    end
end
