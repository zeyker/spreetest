require 'savon'

class NormalordersController < ActionController::Base
  extend WebpayRails
  def index
    
  end 
  before_action :find_order, only: [:return, :final]
  before_action :verify_order, only: :return


  def new
    @order = Order::Normal.new
  end

  def create
    @order = Order::Normal.new(create_params)

    if @order.save
      if init_transaction

        render :gateway
      else
        @order.update(status: :failed)
        render :failed
      end
    else
      render action: :new
    end
  end

  def return
    if transaction_result && @order.update(update_params)#&& @result.approved?
      @method = :get
      @url = @result.url_redirection
      @token = params[:token_ws]
      @corroborador= @result.response_code
      #@order.update(update_params)
      @order.update(status: :approved)
      @de=@order.approve!
      render :gateway
      puts "entre true"
      puts @de
      
    else

      @order.update(status: :failed)
      puts "entre falese"
      #puts @result.approved
      render :failed
      #render :failed
    end
  end

  def final
    puts "entre final"

    if @order.approved?
      render :success
    else
      render :failed
    end
  end
  

  private

  def find_order
    @order = Order::Normal.find(params[:id])
  end

  def create_params
    params.require(:order_normal).permit(:amount)
  end

  def update_params
    {
      tbk_token_ws: params[:token_ws],
      tbk_accounting_date: @result.accounting_date,
      tbk_buy_order: @result.buy_order,
      tbk_card_number: @result.card_number,
      tbk_commerce_code: @result.commerce_code,
      tbk_authorization_code: @result.authorization_code,
      tbk_payment_type_code: @result.payment_type_code,
      tbk_response_code: @result.response_code,
      tbk_transaction_date: @result.transaction_date,
      tbk_vci: @result.vci,
      tbk_session_id: "2",#no lo rescata
      tbk_card_expiration_date: "2",#no lo rescata
      tbk_shares_number: "2",#no lo rescata
      amount: @result.amount
    }
  end

  def verify_order
    render :failed if @order.approved?
  end


  def transaction_result
    puts 'Hola hola'
    puts  params[:token_ws]
    puts 'chao'

    @result = Order::Normal.transaction_result(params[:token_ws])
    
    puts @result.inspect

    true
  #rescue WebpayR|ails::SoapError
    
  end

  def init_transaction_params
    {
      amount: @order.amount,
      buy_order: @order.buy_order_for_transbank_normal,
      session_id: session.id,
      return_url: url_for(action: :return, id: @order.id),
      final_url: url_for(action: :final, id: @order.id)
    }
  end
end