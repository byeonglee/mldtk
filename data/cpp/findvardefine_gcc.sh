while read macro
do
  find systems/redhat/usr/lib/gcc/x86_64-redhat-linux/4.4.4/include/ -name "*.[c|h]" | xargs grep "$macro" | egrep ":# *define *$macro([^_a-zA-Z0-9]|$)" >&2
  if [ $? -eq 1 ]
  then
    echo $macro
  fi
done
