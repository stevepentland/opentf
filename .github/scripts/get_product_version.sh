#!/usr/bin/env bash
# Copyright (c) The OpenTofu Authors
# SPDX-License-Identifier: MPL-2.0
# Copyright (c) 2023 HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

set -uo pipefail

# Trim the "v" prefix, if any.
VERSION="${RAW_VERSION#v}"

# Split off the build metadata part, if any
# (we won't actually include it in our final version, and handle it only for
# completeness against semver syntax.)
IFS='+' read -ra VERSION BUILD_META <<< "$VERSION"

# Separate out the prerelease part, if any
# (version.go expects it to be in a separate variable)
IFS='-' read -r BASE_VERSION PRERELEASE <<< "$VERSION"

EXPERIMENTS_ENABLED=0
if [[ "$PRERELEASE" == alpha* ]]; then
EXPERIMENTS_ENABLED=1
fi
if [[ "$PRERELEASE" == dev* ]]; then
EXPERIMENTS_ENABLED=1
fi

LDFLAGS="-w -s"
if [[ "$EXPERIMENTS_ENABLED" == 1 ]]; then
LDFLAGS="${LDFLAGS} -X 'main.experimentsAllowed=yes'"
fi
LDFLAGS="${LDFLAGS} -X 'github.com/opentofu/opentofu/version.dev=no'"

echo "Building OpenTofu CLI ${VERSION}"
if [[ "$EXPERIMENTS_ENABLED" == 1 ]]; then
echo "This build allows use of experimental features"
fi
echo "product-version=${VERSION}" | tee -a "${GITHUB_OUTPUT}"
echo "product-version-base=${BASE_VERSION}" | tee -a "${GITHUB_OUTPUT}"
echo "product-version-pre=${PRERELEASE}" | tee -a "${GITHUB_OUTPUT}"
echo "experiments=${EXPERIMENTS_ENABLED}" | tee -a "${GITHUB_OUTPUT}"
echo "go-ldflags=${LDFLAGS}" | tee -a "${GITHUB_OUTPUT}"
