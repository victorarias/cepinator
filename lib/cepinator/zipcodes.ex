defmodule Cepinator.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def url do
    "ecto://cepinator_user:cepinator@localhost/cepinator"
  end
end

defmodule Cepinator.Address do
  use Ecto.Model
  import Ecto.Query

  queryable "tend_endereco" do
    field :cep,        :string
    field :endereco,   :string
    field :id_bairro,  :integer

    belongs_to :city, Cepinator.City, foreign_key: :"id_cidade", primary_key: :"id_cidade"
  end

  def find_by_cep(cep) do
    query = from a in Cepinator.Address,
      where: a.cep == ^cep,
      preload: :city

    [ address ] = Cepinator.Repo.all(query)
    address
  end
end

defmodule Cepinator.City do
  use Ecto.Model

  queryable "tend_cidade", primary_key: { :id_cidade, :integer } do
    field :cidade,  :string
    field :uf,      :string

    has_many :addresses, Cepinator.Address, foreign_key: :"id_cidade"
  end
end
