class Api::DoughnutsController < ApplicationController
  def index
    doughnuts = Doughnut.all
    render json: doughnuts
  end

  def show
    if doughnut
      render json: doughnut
    else
      render json: doughnut.errors
    end
  end

  def create
    doughnut = Doughnut.create(doughnut_params)
    if doughnut
      render json: doughnut
    else
      render json: doughnut.errors
    end
  end

  def update
    if doughnut
      doughnut.update_attributes(doughnut_params)
      render json: doughnut
    else
      render json: doughnut.errors
  end

  def destroy
    doughnut&.destroy
    render json: { message: 'Doughnut deleted!' }
  end

  private
    def doughnut_params
      params.require(:doughnut).permit(:name, :price, :quantity, :description)
    end

    def doughnut
      @doughnut ||= Doughnut.find(params[:id])
    end
  
end
