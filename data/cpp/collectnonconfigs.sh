find linux-2.6.33.3/ -name "*.expressionvars"  | xargs cat | grep ".*,1,.*" | grep -v "^CONFIG_" | awk -F, '{print $1}' | sort | uniq
