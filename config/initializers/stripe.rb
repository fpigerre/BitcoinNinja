# TODO: Store key info in an ENV variable
# TODO: Re-create new API keys when key info is stored in an ENV variable

Rails.configuration.stripe = {
    :publishable_key => ENV['PUBLISHABLE_KEY'],
    :secret_key => ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]