class ProductionsController < ApplicationController
  wrap_parameters format: []
  
  def index
    render json: Production.all, status: :ok
  end
  
  def show
    production = Production.find_by(id: params[:id])
    if production
      render json: production, status: :ok
    else 
      render json: { error: "Production not found" }, status: :not_found
    end
  end
  
  def create
    production = Production.create(production_params)
    if production.valid?
      render json: production, status: :created
    else
      render json: { error: production.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def update
    production = Production.find_by(id: params[:id])
    if production
      production.update(production_params)
      render json: production, status: :accepted
    else
      render json: { error: "Production not found" }, status: :not_found
    end
  end
  
  private
  
  def production_params
    params.permit(:title, :genre, :budget, :image, :director, :ongoing, :description)
  end
end
