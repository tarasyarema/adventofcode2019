# Day 5: **Perl**

## Notes

Well... *it was interesting*. 

What I learned so far today:

- The variable syntax is shitty *af* (as in Bash or PHP), i.e. the `$var`, `@list`, `<$file>` syntax...
- General conditional and loop functions (`if`, `for`, `while`,...) are C-like. It's fast to implement imperative code with. Note that there's no `switch` by default, you have to download some lib or package. That's why the conditionals are `if`, `elsif`.
- No break keyword in a loop: you have to use `last if (...)`. I prefer a `break`. Was not a inconvinience in this case tho.
- Native ternary operators, same as in C. Good.
- Python2 like printing with Bash-like string interpolation (but better). Has support for C `printf` functions too.

In general terms, now I understand why it's used as a scripting language. In the future maybe I will try substitute Bash when writing unix scripts, and see how it goes.

## Run

Easy and simple: `perl main.pl`.
