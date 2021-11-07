#!/bin/bash
#!/bin/bash -vxe

. linuxFileList.inc

filesToProcess|while read i; do
  if [ ! -f "$srcPath/$i.expressionvars" ]; then
    echo "Gathering expression vars for $srcPath/$i.c"
    allofc.sh -preprocess -cfg expressionvars $srcPath/$i.c 2> "$srcPath/$i.expressionvars" > /dev/null || true
  else
    echo "Skipping $srcPath/$i.c"
  fi
done

