# lib/your_app_web/controllers/hello_controller.ex
defmodule  BackendpheonixWeb.HelloController do
  use  BackendpheonixWeb, :controller

  def index(conn, _params) do
    # Send a simple string as JSON response
    json(conn, %{
      labels: ["January", "February", "March", "April", "May", "June", "July"],
      datasets: [
        %{
          label: "Data two",
          backgroundColor: "red",
          data: [40, 39, 10, 40, 39, 80, 40],
        }
      ]
    })
  end
end
