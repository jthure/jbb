defmodule JBB.Accounts.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :jbb,
    error_handler: JBB.Accounts.ErrorHandler,
    module: JBB.Accounts.Auth

  # If there is a session token, restrict it to an access token and validate it
  res = plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  IO.puts(res)

  # If there is an authorization header, restrict it to an access token and validate it
  res = plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  IO.puts(res)
  # Load the user if either of the verifications worked
  res = plug Guardian.Plug.LoadResource, allow_blank: true
  IO.puts(res)
  IO.puts("End of pipeline")
end
