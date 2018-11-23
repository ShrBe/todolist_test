class TodoListAsController < ApplicationController
  def index
    @todo_lists = TodoListA.all
  end

  def show
    @todo_list = TodoListA.find(params[:id])
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
    @todo_list = TodoListA.find(params[:id])
  end

  def update
    @todo_list = TodoListA.find(params[:id])
    
    if @todo_list.update(todo_list_params)
      flash[:success] = '正常更新！'
      redirect_to @todo_list
    else
      flash.now[:danger] = '更新失敗した！'
      render :edit
    end
  end

  def destroy
    @todo_list = TodoListA.find(params[:id])
    @todo_list.destroy
    
    flash[:success] = 'タスクは正常に削除されました'
    redirect_to todo_list_as_url
  end
  
  private
  def todo_list_params
    params.require(:todo_list_a).permit(:content)
  end
end
