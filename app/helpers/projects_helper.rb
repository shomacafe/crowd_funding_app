module ProjectsHelper
  def success_icon(project)
    if (@project.purchases.all.sum(:return_price).to_f / @project.target_amount.to_int * 100).round(0) >= 100 
      "Success!"
    end 
  end
end
