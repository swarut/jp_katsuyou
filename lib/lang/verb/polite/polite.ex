defmodule JpKatsuyou.Verb.Polite do

  defmacro __using__(_) do
    quote do

      def polite_past(%{kumi: "ichidan", verb: verb}) do
        IO.puts("polite past #{verb}")
      end
      def polite_past(%{kumi: "godan", verb: verb}) do
        IO.puts("polite past #{verb}")
      end
      def polite_past(%{kumi: "irregular", verb: verb}) do
        IO.puts("polite past #{verb}")
      end

      def polite_present(%{kumi: "ichidan", verb: verb}) do
        verb
        |> String.replace_suffix("る", "ます")
      end
      def polite_present(%{kumi: "godan", verb: verb}) do
        verb
        |> JpKatsuyou.Lang.shift_suffix(:i)
        |> String.replace_suffix("", "ます")
      end
      def polite_present(%{kumi: "irregular", verb: verb}) do
        case verb do
          "する" -> "しる"
          "来る" -> "来ます"
        end
      end

    end
  end

end
