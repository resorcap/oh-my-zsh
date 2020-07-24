#!/usr/bin/env bash
# 2020-07-24 10:53 guozhenyuan <cyan.guo@nio.com>
pod=$1;shift;kubectl exec -i $pod -- "$@"

