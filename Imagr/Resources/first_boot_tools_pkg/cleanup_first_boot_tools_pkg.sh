#!/bin/sh

pkgname="firstboottools"
version="1.0"
identifier="com.grahamgilbert.imagr.${pkgname}"
install_location="/"
distpkgname="999_first_boot_tools"

PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin export PATH

projectfolder=$(dirname "$0")

distpkg_path="${projectfolder}/${distpkgname}.pkg"

if [[ -e "${distpkg_path}" ]] ; then
echo "Removing built dist pkg..."
/bin/rm "${distpkg_path}"
fi
