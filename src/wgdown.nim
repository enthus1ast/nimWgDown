import os, strutils, osproc, strformat

let (outp, code) = execCmdEx("wg")


const matcher = "interface: "
for line in outp.splitLines():
  if line.startsWith(matcher):
    let inter = line[matcher.len .. ^1]
    let (outp, code) = execCmdEx(fmt"wg-quick down {inter}")
    echo fmt"{inter} down"
