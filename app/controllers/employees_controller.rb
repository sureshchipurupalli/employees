class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employee = Employee.all
    @employee = Employee.order(:name)
    respond_to do |format|
      format.html
      format.csv { send_data @employee.to_csv }
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
    end
  end
  def show
    @employee = Employee.find(params[:id])
  end
  def new
     @employee = Employee.new
  end
  def edit

  end
  def create

    @employee = Employee.new(employee_params)
   if  @employee.save
     flash[:notice]="details saved successfully"
    redirect_to employee_path(@employee)
   else
     render 'new'
   end


  end





  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def employee_params
    params.require(:employee).permit( :name, :dateofbirth,:age,:gender, :designation,:salary,:bloodgroup, :mobile)
  end
  def set_employee
    @employee = Employee.find(params[:id])
  end


end
