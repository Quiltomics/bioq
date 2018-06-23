defmodule BioqWeb.UtilView do
  use BioqWeb, :view

  def rgen_params(%{:params => theParams}) do
    # Map.keys(theParams)
    # |> Enum.map(fn(x) -> ~s/#{x} = #{Map.get(theParams,x)}/ end)
    # |> Enum.join(" </br> ")
    theParams
  end

  def rgen_params(_) do
    "Parameters not available."
    # "is_list = #{is_list(allAssigns)}" <> "\n" <> "is_map = #{is_map(allAssigns)}"
  end

  def rgen_output(%{:json => json}) do
    Phoenix.HTML.raw("""
<svg><circle cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red" /></svg>
""" <> vis_histogram(json))
  end
  def rgen_output(%{:output => output}), do: output

  def rgen_output( _ ) do
    "Output not available."
  end

  defp vis_histogram(json) do
    js = """
<script>
  let d3 = require('js/app').d3;
  console.log(#{json});
</script>
    """
  end
end
