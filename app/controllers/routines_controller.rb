class RoutinesController < ApplicationController
  before_action :current_routine, only: [:show,:edit,:update,:destroy]
  def index
    @routines = Routine.all
  end

  def show
  end

  def new
    @routine = Routine.new
  end

  def create
    routine =Routine.create(routine_params)
    redirect_to routines_path,notice:"work created"
  end  

  def edit
  end

  def update
    @routine.update(routine_params)
    redirect_to routines_path,notice:"Work updated"
  end

  def destroy
    @routine.destroy
    redirect_to routines_path,notice:"Work deleted successfully"
  end

  private
  def routine_params
    params.require(:routine).permit(:title , :description)
  end
  def current_routine
    @routine = Routine.find(params[:id])
  end
end
