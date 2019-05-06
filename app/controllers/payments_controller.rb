class PaymentsController < ApplicationController
  def new
    if current_user.profile.premium?
      redirect_to profile_hookup_path
    else
      Stripe.api_key = "#{ENV['STRIPE_API']}"

      @stripe_checkout_session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: 'One off lifetime payment to Root Path',
          description: "Best decision you've ever made",
          amount: 9999,
          currency: 'aud',
          quantity: 1,
        }],
        success_url: "http://localhost:3000/success",
        cancel_url: 'http://localhost:3000/cancel',
      )
      #send params with success?
    end
  end

  def success
    @profile = current_user.profile
    #params?
    @profile.premium = true
    @profile.save
    redirect_to profile_hookup_path(@profile)
  end

  def cancel
  end
end
