
remove dups
-----------
``` sh
$ tac ~/.bash_history | awk '!a[$0]++' | tac > t; mv t ~/.bash_history
```
`$ tac ~/.bash_history | awk '!a[$0]++' | tac > t; mv t ~/.bash_history`
