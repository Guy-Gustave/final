class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]
  # before_action :authenticate_and_set_user

  # GET /projects
  def index
    # @projects = @current_user.projects
    @projects = Project.all
    json_response(@projects)
  end

  # POST /projects
  # def create
  #   @project = Project.create(project_params)
  #   json_response(@project, :created)
  # end
  def create
    project = Project.new(project_params)
    if project.save
      render json: project, status: 201, notice: 'Project was successfully created.'
    else
      render json: project.errors, status: :unprocessable_entity
    end
  end

  # GET /projects/:id
  def show  
    json_response(@project)
  end

  # PUT /projects/:id
  def update
    @project.update(project_params)
    head :no_content
  end

  # DELETE /projects/:id
  def destroy
    @project.destroy
    head :no_content
  end

  private

  def project_params
    # whitelist params
    params.require(:project).permit(:title, :description, :rates)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
