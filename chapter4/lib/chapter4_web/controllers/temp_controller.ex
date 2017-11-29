defmodule Chapter4Web.TempController do
  use Chapter4Web, :controller

  def calc_temp(conn, params) do
    temp = params["temp"]
    scale = ("from_" <> params["scale"] |> String.to_atom)
    scale_to = Temp.result_scales(params["scale"])
    val = Temp.convert(temp, scale, :to_kelvin)
    json conn |> put_status(:ok), %{"kelvin" => val}

  end
end
