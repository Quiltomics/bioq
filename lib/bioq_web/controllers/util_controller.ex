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
    paramText = Enum.map(Map.keys(rgen_params),fn(x) -> ~s/#{x}: #{Map.get(rgen_params,x)}/ end)
      |> Enum.join(", ")
    output = [3,2,1,4,5,6,6,3,3,2]
    outputText = Enum.join(output, ", ")
    render conn, "rgen-output.html", %{"output": outputText , "params": paramText}
  end

  def rgen(conn, _params) do
    render conn, "rgen.html"
  end

end
