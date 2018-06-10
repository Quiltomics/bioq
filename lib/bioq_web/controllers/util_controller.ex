defmodule BioqWeb.UtilController do
  use BioqWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def rgen(conn, %{"rgen_params" => rgen_params}) do
    text conn, ~s[distribution: #{Map.get(rgen_params,"distribution")}
  size: #{Map.get(rgen_params,"size")}]
  end
  def rgen(conn, _params) do
    render conn, "rgen.html"
  end

end
