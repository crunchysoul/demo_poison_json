defmodule DemoPoisonJson.ExtractMap do
  def extract_from_body(map) do
    {:ok, body} = map

    {_, extract_article_content} =
      body
      |> get_in(["query"])
      |> get_in(["pages"])
      |> Enum.find(fn {key, _value} ->
        case Integer.parse(key) do
          :error ->
            false

          _ ->
            key
        end
      end)

    Map.fetch!(extract_article_content, "extract")
  end
end
