defmodule DemoPoisonJson.Cli do
  def main(args) do
    args
    |> parse_args
    |> process
  end

  def parse_args(args) do
    parse = OptionParser.parse(args, switches: [help: :boolean], aliases: [h: :help])

    case parse do
      {[help: true], _, _} ->
        :help

      {_, [search_term], _} ->
        {search_term}
    end
  end

  def process({search_term}) do
    search_term
    |> DemoPoisonJson.FetchJson.fetch()
    |> DemoPoisonJson.ExtractMap.extract_from_body()
    |> string_format
  end

  def process(:help) do
    IO.puts("""
    Demo JSON Parser from Wilipedia API
    — — — — — 
    usage: demo_poison_json <search_term>
    example: demo_poison_json lion
    """)
  end

  def string_format(string) do
    string
    |> String.replace(". ", ". \n")
    |> IO.puts()
  end
end
