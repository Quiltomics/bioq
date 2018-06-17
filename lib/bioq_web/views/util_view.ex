defmodule BioqWeb.UtilView do
  use BioqWeb, :view

  # def render_rgen_output(%{"distribution" => distribution, "size" => size}) do
  #   paramText = "Distribution: #{distribution}, size: #{size}"
  #   output = [3,2,1,4,5,6,6,3,3,2]
  #   outputText = "(No, it's not real.) " <> Enum.join(output, ", ")
  #   # render "rgen-output.html", %{"output": outputText , "params": paramText}
  # end
  def rgen_params([:param = %{"distribution" => distribution, "size" => size}]) do
    paramText = "Distribution: #{distribution}, size: #{size}"
    paramText
  end
  def rgen_params(%{:params => theParams}) do
    # Map.keys(theParams)
    # |> Enum.map(fn(x) -> ~s/#{x} = #{Map.get(theParams,x)}/ end)
    # |> Enum.join(" </br> ")
    theParams
  end

  def rgen_params(allAssigns) do
    "is_list = #{is_list(allAssigns)}" <> "\n" <> "is_map = #{is_map(allAssigns)}"
  end

  def rgen_output(%{:output => output}) do
    output
  end
end
