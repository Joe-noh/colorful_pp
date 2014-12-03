defmodule ColorfulPP.Colorizer do
  def atom(str),      do: Colorful.string(str, :magenta)
  def bitstring(str), do: Colorful.string(str, :green)
  def integer(str),   do: Colorful.string(str, :red)
  def float(str),     do: Colorful.string(str, :red)
  def range(str),     do: Colorful.string(str, :yellow)
  def regex(str),     do: Colorful.string(str, :cyan)
  def function(str),  do: Colorful.string(str, :blue)
  def pid(str),       do: Colorful.string(str, :yellow)
  def reference(str), do: Colorful.string(str, :cyan)
end
