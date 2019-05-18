class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update]

  def index
    @admin = Admin.all 
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params_admin)
    if @admin.save
      redirect_to backoffice_admins_path, notice: "O administrador (#{@admin.email}) foi salvo com sucesso"
    else
      render :new
    end
  end

  def edit    
  end

  def update
    pwd = params[:admin][:password]
    pwd_confirmation = params[:admin][:password_confirmation]

    if pwd.blank? && pwd_confirmation.blank?
      params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)
    end      

    if @admin.update(params_admin)
      redirect_to backoffice_admins_path, notice: "O administrador (#{@admin.email}) foi atualizado com sucesso"
    else
      render :edit
    end
  end

  def destroy
  end

  private
    def set_admin
      @admin = Admin.find(params[:id])      
    end

    def params_admin
      params.require(:admin).permit(:id, :email, :password, :password_confirmation)
    end

end