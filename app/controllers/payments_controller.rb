class PaymentsController < ApplicationController
  before_action :set_booking

  def new
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,  # You should store this customer id and re-use it.
      amount:       @booking.amount_cents,
      description:  "Payment for #{@booking.product_sku} for order #{@booking.id}",
      currency:     @booking.amount_currency
    )

    @booking.update(payment: charge.to_json, state: 'paid')
    redirect_to #boooking confirmation path(@booking)

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to #payment new path
  end

  private

  def set_booking
    @booking = current_user.bookings.where(state: 'pending').find(params[:booking_id])
  end
end
