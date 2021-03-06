defmodule Cepinator.Mixfile do
  use Mix.Project

  def project do
    [ app: :cepinator,
      version: "0.0.1",
      dynamos: [Cepinator.Dynamo],
      compilers: [:elixir, :dynamo, :app],
      env: [prod: [compile_path: "ebin"]],
      compile_path: "tmp/#{Mix.env}/cepinator/ebin",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo],
      mod: { Cepinator, [] } ]
  end

  defp deps do
    [ { :cowboy, github: "extend/cowboy" },
      { :dynamo, "0.1.0-dev", github: "elixir-lang/dynamo" },
      { :ecto, github: "elixir-lang/ecto" },
      { :pgsql, github: "ericmj/pgsql", branch: "elixir" },
      { :json, github: "cblage/elixir-json"} ]
  end
end
