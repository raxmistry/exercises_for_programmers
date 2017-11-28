defmodule Chapter4Web.TempController do
  use Chapter4Web, :controller

  def calc_temp(conn, params) do
    temp = params["temp"]
    scale = ("from_" <> params["scale"] |> String.to_atom)
    val = Temp.convert(temp, scale, :to_kelvin)
    result = %{}
    Map.put(result, "kelvin", val)
    json conn |> put_status(:ok), %{"kelvin" => val}

  end
end
