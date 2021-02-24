class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_address_params
    params.require(:purchase_address).permit(:zipcode, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_address_params[:token],
      currency: 'jpy'
    )
  end

end
