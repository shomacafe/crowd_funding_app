class HomesController < ApplicationController
  def index
    @slider_projects = Project.limit(5).order("RAND()").where("start_date <= ?", Date.today).where.not("end_date < ?", Date.today)
    @latest_projects = Project.limit(4).order("created_at DESC").where("start_date <= ?", Date.today).where.not("end_date < ?", Date.today)
    @start_projects = Project.limit(4).order("created_at DESC").where("start_date > ?", Date.today)
    @end_projects = Project.limit(4).order("created_at DESC").where("end_date < ?", Date.today)
  end
end
