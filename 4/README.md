# Day 4: **Elixir**

## Notes
*I liked this one*. 
This was my first program in Elixir and all the functional syntax and functions where pretty interesting and easy to use.

Some facts I learned today:
- I spent a lot of time debugging with `IO.inspect`, really useful.
- Still don't know how to change variables passed as arguments, that's why I could not get the number of possible passwords during the recursion.
- Coming from a Python intensive year of programming, the syntax and general environment was friendly.
- Lists (arrays) are of the type `[head, tail]`, where tail is basically the Python equivalent to `[1::]`. Was perfect to use in the recursive algorithm. I guess it's something about linked lists and all that shit, *xd*.
- Loved the existance of list comprehensions.

## Run

To run it just `elixir main.exs`. 

Take in mind that if does not give you the result directly, i.e. it gives you all the possible solutions. 
To get the number just pipe it to `wc`:
```bash
elixir main.exs | wc -l
```

