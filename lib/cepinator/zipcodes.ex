defmodule Cepinator.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def url do
    "ecto://cepinator_user:cepinator@localhost/cepinator"
  end
end

defmodule Cepinator.Address.Entity do
  use Ecto.Entity

  field :cep,        :string
  field :endereco,   :string
  field :id_bairro,  :integer

  belongs_to :city, Cepinator.City, foreign_key: "id_cidade"
end

defmodule Cepinator.City.Entity do
  use Ecto.Entity

  field :cidade,  :string
  field :uf,      :string

  has_many :addresses, Cepinator.Address, foreign_key: "id_cidade"
end

defmodule Cepinator.Address do
  use Ecto.Model

  queryable "tend_endereco" , Cepinator.Address.Entity
end

defmodule Cepinator.City do
  use Ecto.Model

  queryable "tend_cidade"   , Cepinator.City.Entity
end
