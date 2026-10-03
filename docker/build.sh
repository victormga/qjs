#!/usr/bin/env bash
# /src is a slow drvfs mount, so build from a copy on the container's own filesystem.
set -euo pipefail

work=/tmp/work

rm -rf "$work"
cp -r /src "$work"
make -C "$work" build
cp "$work/qjs.wasm" /dist/qjs.wasm
ls -l /dist/qjs.wasm
