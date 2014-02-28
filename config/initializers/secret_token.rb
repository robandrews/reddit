# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Reddit::Application.config.secret_key_base = '1f1366b4c6ac65a7996d3c7307bf72537e4ee59d804b30f954ae4c8d5139c5ac38e965b5db50e010fdb1f21893ea978ce325d085ba26fd1bfea7c915748dfd73'
