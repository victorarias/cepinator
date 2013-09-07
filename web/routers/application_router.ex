defmodule ApplicationRouter do
  use Dynamo.Router
  import Ecto.Query

  prepare do
    # Pick which parts of the request you want to fetch
    # You can comment the line below if you don't need
    # any of them or move them to a forwarded router
    conn.fetch([:cookies, :params])
  end

  get "/cep/:cep" do
    address = conn.params[:cep] |> lookup_cep |> format_json
    conn = conn.resp_charset("iso-8859-1")
    conn = conn.resp_content_type("application/json")
    conn.resp 200, address
  end

  defp lookup_cep(cep) do
    Cepinator.Address.find_by_cep(cep)
  end

  defp format_json(address) do
    city = address.city.get
    { :ok, encoded } = JSON.encode street: address.endereco, city: city.cidade, uf: city.uf
    encoded
  end
end
