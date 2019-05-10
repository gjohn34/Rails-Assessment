class PaymentsController < ApplicationController
  def new
    #new payment via stripe
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
      #success_url: "http://localhost:3000/success?key=#{@profile.randomkey}",

      #send params with success?
    end
  end

  def success
    #at the moment, after a user pays they are redirected to the success page
    #and their premium status is set to true, all it takes is for a user to
    #manually go the success url and they have skipped having to pay.

    #a solution to this is to generate a random key on user creation and in the
    #     Payments#New method pass that unique key with the success params and
    #only set status to true if that unique key is passed as well. that is a future
    #implementation

    @profile = current_user.profile
    @profile.premium = true
    @profile.save
    redirect_to profile_hookup_path(@profile)
  end

  def cancel
  end
end
