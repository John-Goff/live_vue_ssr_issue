defmodule LiveVueSsrIssue.Repo do
  use Ecto.Repo,
    otp_app: :live_vue_ssr_issue,
    adapter: Ecto.Adapters.Postgres
end
