class ProductionsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  wrap_parameters format: []
  
  def index
    render json: Production.all, status: :ok
  end
  
  def show
    production = Production.find_by(id: params[:id])
    if production
      render json: production,except: [:id, :created_at, :updated_at], methods: [:title_director], status: :ok
    else 
      render json: { error: "Production not found" }, status: :not_found
    end
  end
  def create
    production = Production.create!(production_params)
      render json: production, status: :created
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
  
    def destroy
        production = Production.find_by(id:params[:id])
        if production
        production.destroy
        head :no_content
        else
            render jason: {error: "production not found"}, status: :not_found
        end
    end
  
  private
  
  def render_unprocessable_entity(invalid)
            render json: {error: invalid.record.errors}, status: :unprocessable_entity 
  end
  
  def production_params
    params.permit(:title, :genre, :budget, :image, :director, :ongoing, :description)
  end
end
