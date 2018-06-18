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

  def rgen_output(%{:output => output}) do
    output
  end
  def rgen_output( _ ) do
    "Output not available."
  end
end
