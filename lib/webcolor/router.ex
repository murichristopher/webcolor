defmodule Webcolor.Router do
  use Plug.Router
  require EEx

  EEx.function_from_file(:defp, :render_template, "lib/webcolor/templates/index.html.eex", [:assigns])

  plug(:match)
  plug(:dispatch)

  get "/" do
    {:ok, hostname} = :inet.gethostname()
    hostname_string = List.to_string(hostname)

    html_content = render_template(%{hostname: hostname_string})

    conn
      |> put_resp_content_type("text/html")
      |> send_resp(200, html_content)
    end

  match _ do
    send_resp(conn, 404, "Not found")
  end
end
