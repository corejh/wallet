# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Wallet::Application.config.secret_key_base = 'a85fa435ba2d11b2593fec3b4319ada2168df8f7add731759e3b39187cbdc43c3a613faca6155908c4753ab40009a07f852e3689bc3d85c93703e4bf5f6b2cd8'
