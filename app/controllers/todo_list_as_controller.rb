class TodoListAsController < ApplicationController
  def index
    @todo_lists = TodoListA.all
  end

  def show
    @todo_lists = TodoListA.find(params[:id])
  end

  def new
    @todo_list = TodoListA.new
  end

  def create
    @todo_list = TodoListA.new(todo_list_params)
    
    if @todo_list.save
      flash[:success] = 'タスク正常登録'
      redirect_to @todo_list
    else
      flash[:danger] = 'タスク登録なし'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  def todo_list_params
    params.require(:todo_list_a).permit(:content)
  end
end
