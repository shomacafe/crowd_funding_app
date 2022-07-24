class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @purchases = Purchase.all
    @purchases = current_user.purchases
  end

  def new
    @purchase = Purchase.new(purchase_params)
  end

  def confirm
    @purchase = Purchase.new(params.permit(:user_id, :project_id, :return_image, :return_price, :return_name, :return_introduction))
    @project = Project.find(@purchase.project_id)
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save!
      flash[:notice] = "応援購入が完了しました"
      redirect_to purchases_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
    flash[:notice] = "応援済みプロジェクトを削除しました"
    redirect_to purchases_path(@purchase)
  end

  def purchase_params
    params.require(:purchase).permit(:user_id, :project_id, :return_image, :return_price, :return_name, :return_introduction)
  end
end
