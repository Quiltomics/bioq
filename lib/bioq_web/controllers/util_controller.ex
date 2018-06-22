defmodule BioqWeb.UtilController do
  use BioqWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def rgen(conn, %{"rgen_params" => rgen_params}) do
    # text conn, ~s[distribution: #{Map.get(rgen_params,"distribution")}
    #      size: #{Map.get(rgen_params,"size")}]
    # run the function
    # send the result back for rendering
    # paramUrl =  Enum.map(Map.keys(rgen_params),fn(x) -> ~s/#{x}=#{Map.get(rgen_params,x)}/ end)
    #   |> Enum.join("&")
    redirect(conn, to: util_path(conn, :rgen, distribution: Map.get(rgen_params,"distribution"), size: Map.get(rgen_params,"size")))
  end

  def rgen(conn, %{"distribution" => distribution, "size" => size}) do
    paramText = "Distribution: #{distribution}, size: #{size}"
    result = Relixir.runR("#{distribution}(n=#{size})")
    outputText =
    case result do
      {:error, message} ->
        "ERROR: #{message}"
      data ->
        "(It is real, just looks weird.)" <> Enum.join([data], ", ")
    end
    # outputJSON = Relixir.runR("x <- #{distribution}(n=#{size})","x", %{"output" => "json"})
    # UtilView.render_rgen_output(%{"output": outputText , "params": paramText})
    render conn, "rgen.html", %{"output": outputText , "params": paramText}
  end
  def rgen(conn, _params) do
    render conn, "rgen.html"
  end

end
