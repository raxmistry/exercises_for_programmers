defmodule Chapter4Web.TempController do
  use Chapter4Web, :controller

  def calc_temp(conn, params) do
    temp = params["temp"]
    scale = (params["scale"] |> String.to_atom)
    scale_to = Temp.result_scales(params["scale"] |> String.to_atom)
    IO.inspect scale_to
    val = Temp.convert_all_service(scale, scale_to, temp)
    json conn |> put_status(:ok), val
  end
end
