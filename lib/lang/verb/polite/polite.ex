defmodule JpKatsuyou.Verb.Polite do

  defmacro __using__(_) do
    quote do

      def polite_past do
        IO.puts("polite past")
      end

    end
  end

end
