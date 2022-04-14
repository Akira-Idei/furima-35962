class PurchaseRecordsController < ApplicationController
  def index
    @purchase_record_address = PurchaseRecordAddress.new
  end

  def create
    @purchase_record_address = PurchaseRecordAddress.new
    if @purchase_record_address.valid?
      @purchase_record_address.save
    else
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_record_address).permit(:postal_code, :prefecture_id, :city, :street_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id]])
  end

end
