# Day 7: **Bash** and **Python** (and *Perl*)

## Notes

I don't even want to talk about this one....

The first phase is OK. You just need to pass the output from one to the next one. 
So I just used my day 5 Perl program and ran it via a Bash script.

The second phase... WTF. 
You need to be running five amplifiers simultaniously, so you can pipe and the outputs from one as input to the next one, until the final one halts.
Felt too lazy to code, kudos to the subreddit: [solution from this comment](https://www.reddit.com/r/adventofcode/comments/e7a4nj/2019_day_7_solutions/fa22s5d?utm_source=share&utm_medium=web2x).
Thanks, fizbin.

## Run

First phase: `bash main1.sh`.

Second phase: `python3 main2.py`.
