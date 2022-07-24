module ApplicationHelper
  def total_price
    @project.purchases.all.sum(:return_price).to_s(:delimited)
  end
  
  def success_rate
    (@project.purchases.all.sum(:return_price).to_f / @project.target_amount.to_int * 100).floor(0).round(0)
  end
end
