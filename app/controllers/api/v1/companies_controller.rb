class Api::V1::CompaniesController < ApplicationController
  include Pagy::Backend

  def index
    companies = Company.all
    @pagy, @companies = pagy(companies, items: 2)
    render json: @companies, status: 200
  end

  def show
    company = Company.find_by(id: params[:id])
    if company
      render json: company, status: 200
    else
      render json: {
        error: "company with given id not found"
      }
    end    
  end

  def create
    company = Company.new(
      name:company_params[:name],
      email:company_params[:email],
      code:company_params[:code],
      strength:company_params[:strength],
      website:company_params[:website]
    )
    if company.save
      render json: company, status: 200
    else
      render json: {
        error: "company not created"
      }
    end
  end

  def update
    company = Company.find_by(id: params[:id])
    if company
      company.update(name:params[:name],email:params[:email],code:params[:code],strength:params[:strength],website:params[:website])
      render json: {
          text:"company updated successfully"
      }
    else
      render json: {
        error: "company not found"
      }
    end    
  end

  def destroy
    company = Company.find_by(id: params[:id])
    if company
      company.destroy
      render json: {
          text:"company deleted successfully"
      }
    else
      render json: {
        error: "company not found"
      }
    end  
  end
  private
  def company_params
    params.require(:company).permit(:name,:email,:code,:strength,:website)
  end
end
