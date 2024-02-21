#!/bin/sh
set -e

commit=${1:-upstream/llvm_release_180}
version=${2:-18}

stamp=$(git show -s --format="%ct" ${commit})
datestamp=$(date -d @${stamp} +"%Y%m%d")
prefix=spirv-llvm-translator-${version}.~~+git${datestamp}
tarxzball=${prefix}.tar.xz

git archive --format=tar --prefix=${prefix}/ ${commit} | xz -9 > ${tarxzball}
touch -d @${stamp} ${tarxzball}
