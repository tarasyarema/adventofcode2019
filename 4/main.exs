defmodule Main do
    def main() do
        lower = "256310" |> Integer.parse |> elem(0) |> Integer.digits     
        upper = "732736" |> Integer.parse |> elem(0) |> Integer.digits
        
        find(lower, [], lower, upper)
    end

    def rep(e, list) do
        (for n <- list, n == e, do: n) |> length
    end

    # Phase 1
    def check(list) do
        (for x <- (for y <- list, do: y |> rep(list)), x > 1, do: x) |> length
    end

    # Phase 2
    def check2(list) do
        (for x <- (for y <- list, do: y |> rep(list)), x > 1 and x < 3, do: x) |> length
    end

    def find(a, c, lower, upper) do
        if (c |> length) == (lower |> length) do
            if c > lower and c < upper and (c |> check2) > 0 do
                IO.puts c |> Integer.undigits
            end
        else
            y = if (c |> length) > 0, do: c |> List.last, else: a |> hd

            for n <- y..9 do
                find(a |> tl, c ++ [n], lower, upper)
            end
        end
    end
end

Main.main()