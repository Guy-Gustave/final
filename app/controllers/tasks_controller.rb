class TasksController < ApplicationController
  def index
    tasks = Task.where(project_id: params[:project_id]).order("created_at DESC")
    render json: tasks
  end

  def create
    task = Task.create(task_param)
    render json: task
  end

  def update
    task = Task.find(params[:id])
    task.update_attributes(task_param)
    render json: task
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    head :no_content, status: :ok
  end

  private

  def task_param
    params.require(:task).permit(:title, :done, :project_id)
  end
end
