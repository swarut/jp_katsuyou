defmodule JpKatsuyou.Verb.Dict do

  defmacro __using__(_) do
    quote do

      def dic_past(%{kumi: "ichidan", verb: verb}) do
        IO.puts("dic past #{verb}")
      end
      def dic_past(%{kumi: "godan", verb: verb}) do
        IO.puts("dic past #{verb}")
      end
      def dic_past(%{kumi: "irregular", verb: verb}) do
        IO.puts("dic past #{verb}")
      end

      def dic_present(%{kumi: "ichidan", verb: verb}) do
        verb
      end
      def dic_present(%{kumi: "godan", verb: verb}) do
        verb
      end
      def dic_present(%{kumi: "irregular", verb: verb}) do
        verb
      end

      def dic_order(%{kumi: "ichidan", verb: verb}) do
        verb
        |> JpKatsuyou.Lang.shift_suffix(:o)
      end
      def dic_order(%{kumi: "godan", verb: verb}) do
        verb
        |> JpKatsuyou.Lang.shift_suffix(:e)
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
