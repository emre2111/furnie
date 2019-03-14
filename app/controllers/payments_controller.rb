class PaymentsController < ApplicationController
  before_action :set_booking

  def new

     respond_to do |format|
      format.html { render 'payments/new' }
      format.js  # <-- will render `app/views/payments/new.js.erb`
    end
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,  # You should store this customer id and re-use it.
      amount:       @booking.total_amount_cents,
      description:  "Payment for #{@booking.product_sku} for order #{@booking.id}",
      currency:     @booking.amount_currency
    )

    @booking.update(payment: charge.to_json, state: 'paid', amount_cents: @booking.total_amount_cents)
    redirect_to confirmation_booking_path(@booking)

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      render :new
    end

  private

  def set_booking
    @booking = current_user.bookings.where(state: 'pending').find(params[:booking_id])
  end
end
