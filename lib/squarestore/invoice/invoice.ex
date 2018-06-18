defmodule Squarestore.Invoice do
#importing functions
	import Ecto.Query
	require Stripe
#Setting up aliases
	alias Squarestore.Repo
	alias Squarestore.Invoice
	alias Squarestore.Invoice.Invoices
	alias Squarestore.Invoice.Billing
	alias Squarestore.Identity.User
	alias Squarestore.Identity
	alias Ecto.Multi
	alias Stripe
	alias Stripe.Charge

	#Add a new payment card

	def add_card(card_details \\ %{}, id) do
		card = Map.merge(card_details, %{user_id: Kernel.elem(Integer.parse(id), 0)})
		%Billing{}
		|> Billing.changeset(card)
		|> Repo.insert()
	end

	def stripetest do
		 # obtained with Stripe.js
		Stripe.Charge.create(%{amount: 2000, currency: "nok", source: "tok_mastercard", description: "Charge for madison.anderson@example.com"})
	end



end
