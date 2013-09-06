Dynamo.under_test(Cepinator.Dynamo)
Dynamo.Loader.enable
ExUnit.start

defmodule Cepinator.TestCase do
  use ExUnit.CaseTemplate

  # Enable code reloading on test cases
  setup do
    Dynamo.Loader.enable
    :ok
  end
end
