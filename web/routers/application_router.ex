defmodule ApplicationRouter do
  use Dynamo.Router
  import Ecto.Query

  prepare do
    # Pick which parts of the request you want to fetch
    # You can comment the line below if you don't need
    # any of them or move them to a forwarded router
    conn.fetch([:cookies, :params])
  end

  # It is common to break your Dynamo into many
  # routers, forwarding the requests between them:
  # forward "/posts", to: PostsRouter

  get "/" do
    conn = conn.assign(:title, "Welcome to Dynamo!")
    render conn, "index.html"
  end

  get "/cep/:cep" do
    street = lookup_cep(conn.params[:cep])
    conn.resp 200, street
  end

  def lookup_cep(cep) do
    query = from a in Cepinator.Address,
      where: a.cep == ^cep,
      select: { a.endereco, a.id_bairro }

     [ payload | _ ] = Cepinator.Repo.all(query)
     { street, bairro  } = payload
     IO.puts street
     street
  end
end
