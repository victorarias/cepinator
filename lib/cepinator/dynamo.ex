defmodule Cepinator.Dynamo do
  use Dynamo

  config :dynamo,
    # The environment this Dynamo runs on
    env: Mix.env,

    # The OTP application associated with this Dynamo
    otp_app: :cepinator,

    # The endpoint to dispatch requests to
    endpoint: ApplicationRouter,

    # The route from which static assets are served
    # You can turn off static assets by setting it to false
    static_route: "/static"

  # Uncomment the lines below to enable the cookie session store
  # config :dynamo,
  #   session_store: Session.CookieStore,
  #   session_options:
  #     [ key: "_cepinator_session",
  #       secret: "b7I9o8SmtiyYp7+0m7ldZ19haK11Va7AJXT6aMImjsVDRv/30AqjDxO20RIpIIjj"]

  # Default functionality available in templates
  templates do
    use Dynamo.Helpers
  end
end
