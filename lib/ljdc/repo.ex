defmodule LJDC.Repo do
  use Ecto.Repo,
    otp_app: :ljdc,
    adapter: Ecto.Adapters.MyXQL
end
