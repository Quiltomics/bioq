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

    rCode = """
    x <- #{distribution}(n=#{size})
    y <- hist(x,plot=FALSE)
    """
    result = Relixir.runR(rCode, "y", %{"output" => "json"})
    output =
      case result do
        {:error, message} ->
          "ERROR: #{message}"
        data ->
         data
      end

    # render conn, "rgen.html", %{"params": paramText, "output": output}
    render conn, "rgen.html", %{"params": paramText, "json": output}
  end

  def rgen(conn, _ ) do
    render conn, "rgen.html"
  end

  def dxplorer(conn, %{"dxplorer_params" => dxplorer_params}) do
    # TODO: assign a session id, then redirect to that
    # Use session id to create a tmp storage
    # Download the file to tmp/storage/sessionId
    # return the file path
    csvFileUrl = Map.get(dxplorer_params, "csvFilePath")
    redirect(conn, to: util_path(conn, :dxplorer, csvFilePath: csvFileUrl, sessionId: "123abc456"))
  end
  def dxplorer(conn, %{"sessionId" => sessionId, "csvFilePath" => csvFilePath}) do
    cnames = Relixir.runR("""
    X <-read.csv("#{csvFilePath}")
    cnames <- colnames(X)
    ""","cnames")
    render conn, "dxplorer.html", %{"sessionId": sessionId, "colNames": cnames}
  end
  def dxplorer( conn, _ ) do
    render conn, "dxplorer.html"
  end
end
