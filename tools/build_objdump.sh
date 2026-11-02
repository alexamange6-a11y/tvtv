#!/usr/bin/env bash
# Linux host tool only. Requires git, gcc/g++, make, standard C development headers.
set -euo pipefail
task_source_dir="${CSKY_SOURCE_DIR:-/workspace/csky-binutils-src}"
task_build_dir="${CSKY_BUILD_DIR:-/workspace/csky-binutils-build}"
task_commit=2409f5af709d5fef4f41cbeb30ef59bc1046b252
if [ ! -e "$task_source_dir" ]; then
  git init "$task_source_dir"
  git -C "$task_source_dir" remote add origin https://github.com/c-sky/binutils-gdb.git
  git -C "$task_source_dir" fetch --depth 1 origin "$task_commit"
  git -C "$task_source_dir" checkout --detach FETCH_HEAD
fi
test "$(git -C "$task_source_dir" rev-parse HEAD)" = "$task_commit"
mkdir -p "$task_build_dir"
cd "$task_build_dir"
if [ ! -f Makefile ]; then
  "$task_source_dir/configure" --target=csky-elf --disable-gdb --disable-gdbserver \
    --disable-gas --disable-ld --disable-sim --disable-nls --disable-werror \
    --without-zstd --without-debuginfod
fi
# Modern GCC reports a legacy upstream pointer-type issue as an error. Keep
# diagnostics while allowing this host-tool build; no artifact verification is disabled.
task_cflags='-O2 -Wno-error=incompatible-pointer-types -Wno-error=int-conversion'
make -j2 MAKEINFO=true CFLAGS="$task_cflags" configure-binutils all-bfd all-opcodes all-libiberty
make -C binutils -j2 MAKEINFO=true CFLAGS="$task_cflags" objdump
./binutils/objdump --version
