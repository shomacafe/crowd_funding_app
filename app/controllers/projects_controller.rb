class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    @project.returns.build
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      flash[:notice] = "新規プロジェクトが作成されました"
      redirect_to posts_projects_path
    else
      render projects_new_path
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.image.attach(params[:image]) if @project.image.blank?
    if @project.update(project_params)
     flash[:notice] = "プロジェクト内容を更新しました。"
     redirect_to posts_projects_path
    else
    flash[:notice] = "プロジェクト内容を更新できませんでした。"
     redirect_to root_path
    end
  end

  def show
    @project = Project.find(params[:id])
    @recommended_projects = Project.limit(4).order("RAND()").where.not(id: @project.id).where("start_date <= ?", Date.today).where.not("end_date < ?", Date.today)
  end


  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "プロジェクトを削除しました"
    redirect_to posts_projects_path
  end

  def posts
    @projects = current_user.projects
  end

  def project_params
    params.require(:project)
    .permit(:title, :target_amount, :start_date, :end_date, :catch_copy_1, :catch_copy_2, :catch_copy_3, :image, :user_id, :purchase_id, :return_id, :content, :total_price,
    returns_attributes: [:return_image, :return_price, :return_name, :return_introduction, :return_stock, :_destroy])
  end
end
