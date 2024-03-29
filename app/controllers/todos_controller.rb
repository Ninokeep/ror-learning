class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo  = Todo.new
  end

  def create
    puts "ici"
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to @todo
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to root_path, status: :see_other
  end

  private
  def todo_params
    params.require(:todo).permit(:message,:done)
  end
end
