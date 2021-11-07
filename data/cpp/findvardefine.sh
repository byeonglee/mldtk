while read macro
do
  find linux-2.6.33.3 -name "*.[c|h]" | xargs grep "$macro" | egrep ":# *define *$macro([^_a-zA-Z0-9]|$)" >&2
  if [ $? -eq 1 ]
  then
    echo $macro
  fi
done
