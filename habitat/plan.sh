pkg_name=packer-resource
pkg_origin=thelunaticscripter
pkg_version="0.1.1"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("Apache-2.0")
pkg_deps=( core/packer )
pkg_bin_dirs=(bin)
pkg_description="Packer resource for Concourse CI."
pkg_upstream_url="https://github.com/TheLunaticScripter/packer-resource"


do_download() {
 return 0
}

do_build() {
  return 0
}

do_install() {
 cp /src/bin -r /opt/resource
}
