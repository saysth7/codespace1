#!/bin/sh

[ $# -ne 2 ] && echo 'usage: sh this.sh <name> <sha256:...>  >a.tgz
  May recurse, find the layer with "mediaType: ...tar+gzip..." or like.
  Can without info.sh: hub.docker layers page, sha256 to get layers info, then...' && exit 1
name=$1
[ $1 = ${1%/*} ] && name="library/$1"
tok=$(curl -s "https://auth.docker.io/token?service=registry.docker.io&scope=repository:$name:pull" |
  jq -r .token)
curl -fsSL -H "Authorization: Bearer $tok" "https://registry-1.docker.io/v2/$name/blobs/$2"

