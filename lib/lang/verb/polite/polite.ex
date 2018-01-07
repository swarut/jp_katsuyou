defmodule JpKatsuyou.Verb.Polite do

  alias JpKatsuyou.Lang

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
        |> Lang.shift_suffix(:i)
        |> String.replace_suffix("", "ます")
      end
      def polite_present(%{kumi: "irregular", verb: verb}) do
        case verb do
          "する" -> "しる"
          "来る" -> "来ます"
        end
      end

      def polite_order(%{kumi: "ichidan", verb: verb}) do
        verb
        |> String.replace_suffix("る", "なさい")
      end
      def polite_order(%{kumi: "godan", verb: verb}) do
        verb
        |> Lang.shift_suffix(:i)
        |> String.replace_suffix("", "なさい")

      end
      def polite_order(%{kumi: "irregular", verb: verb}) do
        case verb do
          "する" -> "しなさい"
          "来る" -> "来なさい"
        end
      end
      defdelegate polite_imperative(map), to: __MODULE__, as: :polite_order

    end
  end

end
