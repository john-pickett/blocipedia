class ChargesController < ApplicationController

  def create
   # Creates a Stripe Customer object, for associating
   # with the charge
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )

   # Where the real magic happens
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: Amount.default,
     description: "BigMoney Membership - #{current_user.email}",
     currency: 'usd'
   )

   # Upgrade user goes here
    current_user.premium!

   flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
   redirect_to current_user # or wherever

   # Stripe will send back CardErrors, with friendly messages
   # when something goes wrong.
   # This `rescue block` catches and displays those errors.
   rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to new_charge_path
 end

 def new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "BigMoney Membership - #{current_user.name}",
     amount: Amount.default
   }
 end

 def downgrade
   @user = current_user
   @user.standard!

   if @user.save
     flash[:notice] = "Your account has been downgraded to Standard. /sad trombone sound =("
   else
     flash[:alert] = "An error occured. Please try again."
   end

   @user_wikis = @user.wikis.where(private: true)

   @user_wikis.each do |wiki|
     wiki.update_attributes(private: false)
   end

   redirect_to wikis_path
 end

end
