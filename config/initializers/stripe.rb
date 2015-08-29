Rails.configuration.stripe = {
    :publishable_key => ENV['PUBLISHABLE_KEY'],
    :secret_key => ENV['SECRET_KEY']
}

# HTTP Basic authentication key
Rails.configuration.stripe_event = {:secret_key => ENV['STRIPE_WEBHOOK_SECRET']}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
StripeEvent.authentication_secret = Rails.configuration.stripe_event[:secret_key]


# TODO: Test StripeEvent hooks
StripeEvent.configure do |events|
  events.subscribe 'charge.failed' do |event|
    # Define subscriber behavior based on the event object
    event.class #=> Stripe::Event
    event.type #=> "charge.failed"
    event.data.object #=> #<Stripe::Charge:0x3fcb34c115f8>
  end

  events.all do |event|
    # Handle all event types - logging, etc.
  end
end