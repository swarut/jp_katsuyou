defmodule JpKatsuyou.Verb.Dict do

  alias JpKatsuyou.Lang

  defmacro __using__(_) do
    quote do

      def dic_present(%{kumi: "ichidan", verb: verb}) do
        verb
      end
      def dic_present(%{kumi: "godan", verb: verb}) do
        verb
      end
      def dic_present(%{kumi: "irregular", verb: verb}) do
        verb
      end

      def dic_present_negative(%{kumi: "ichidan", verb: verb}) do
        verb
        |> String.replace_suffix("る", "ない")
      end
      def dic_present_negative(%{kumi: "godan", verb: verb}) do
        verb
        |> Lang.shift_suffix(:a)
        |> String.replace_suffix("", "ない")
      end
      def dic_present_negative(%{kumi: "irregular", verb: verb}) do
        case verb do
          "する" -> "しない"
          "来る" -> "来ない"
        end
      end

      def dic_past(%{kumi: "ichidan", verb: verb}) do
        IO.puts("dic past #{verb}")
      end
      def dic_past(%{kumi: "godan", verb: verb}) do
        IO.puts("dic past #{verb}")
      end
      def dic_past(%{kumi: "irregular", verb: verb}) do
        IO.puts("dic past #{verb}")
      end

      def dic_order(%{kumi: "ichidan", verb: verb}) do
        verb
        |> Lang.shift_suffix(:o)
      end
      def dic_order(%{kumi: "godan", verb: verb}) do
        verb
        |> Lang.shift_suffix(:e)
      end
      def dic_order(%{kumi: "irregular", verb: verb}) do
        case verb do
          "する" -> "しろ"
          "来る" -> "来い"
        end
      end
      defdelegate dic_imperative(map), to: __MODULE__, as: :dic_order

    end
  end
end
