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
echo "Removing old dist pkg..."
/bin/rm "${distpkg_path}"
fi

# build the component package
pkgbuild --root "${projectfolder}/payload" \
		 --identifier "${identifier}" \
		 --version "${version}" \
		 --scripts "${projectfolder}/scripts" \
		 --install-location "${install_location}" \
		 "${projectfolder}/${pkgname}.pkg"

# build the distribution package
productbuild --identifier "${identifier}-dist" \
             --version "${version}" \
             --package "${projectfolder}/${pkgname}.pkg" \
             "${distpkg_path}"

# remove temporary component package file
rm "${projectfolder}/${pkgname}.pkg"
