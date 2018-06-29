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
    randName = Enum.random(1..1000)
      |> Integer.to_string
      |> String.pad_leading(4, "0")

    Phoenix.HTML.raw("""
<svg id="svg#{randName}" width="300px" height="300px"></svg>
""" <> vis_histogram(json, "#svg#{randName}"))
  end
  def rgen_output(%{:output => output}), do: output

  def rgen_output( _ ) do
    "Output not available."
  end

  #' Return the code to draw histogram from R `hist` object into the `parentSelector`
  defp vis_histogram(json, parentSvgSelector) do
    js = """
<script>
  let d3 = require('js/app').d3;
  let hist = #{json};
  let parentSvg = document.querySelector("#{parentSvgSelector}");
  let W = +parentSvg.scrollWidth;
  let H = +parentSvg.scrollHeight;
  console.log(W + " - " + H);
  let rects = d3.select("#{parentSvgSelector}").append("g")
    .attr("transform",`translate(25,${H-50}) scale(1,-1)`).selectAll("rect")
    .data(hist['density']);
  let yScale = d3.scaleLinear()
    .range([20, H - 30])
    .domain([0,1]);
  let xScale = d3.scaleBand()
    .domain(hist['mids'])
    .range([0, W - 50]);
  rects.enter().append("rect")
    .attr("x", (d,i) => {return xScale(hist['mids'][i])})
    .attr("y", (d,i) => {return 0})
    .attr("width", (d,i) => {return xScale.bandwidth()-2})
    .attr("height", (d,i) => {return yScale(hist['density'][i])})
    .attr("opacity", 0.5)
    .attr("stroke", 1);
  // console.log(#{json});
</script>
"""
    js
  end

  def dxplorer_colnames(%{:colNames => colNames}), do: colNames
  def dxplorer_output(%{:output => output}), do: output
  def dxplorer_output( _ ), do: "WHATEVER"
end
