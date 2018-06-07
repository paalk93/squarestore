defmodule Squarestore.Invoice do
#importing functions
	import Ecto.Query
#Setting up aliases
	alias Squarestore.Invoice
	alias Squarestore.Invoice.Invoices
	alias Squarestore.Invoice.Billing
	alias Squarestore.Identity.User
	alias Squarestore.Identity
	alias Ecto.Multi

	#Add a new payment card

	def add_card (id, card_details \\ %{}) do
		%Billing{}
		|> Map.merge(card_details, %{user_id: Kernel.elem(id, 1).id})
		|> Billing.changeset()
		|> Repo.insert()
	end
end
