#!/bin/sh

[ $# -eq 0 -o $# -gt 2 ] && echo 'usage: sh this.sh <name> [tag]' && exit 1

tok=$(curl -s "https://auth.docker.io/token?service=registry.docker.io&scope=repository:library/$1:pull" |
  jq -r .token)

h1="Authorization: Bearer $tok"
h2a="Accept: application"
url="https://registry-1.docker.io/v2/library/$1/manifests/${2:-latest}"

# 2. 获取 manifest (Docker Image 的元数据)
#curl -s -H "$h1" -H "$h2a/vnd.docker.distribution.manifest.v2+json" $url

# 3. 获取 OCI manifest (更现代)
curl -s -H "$h1" -H "$h2a/vnd.oci.image.manifest.v1+json" $url

