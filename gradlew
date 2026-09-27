#!/bin/sh
set -e
GRADLE_VERSION="8.7"
CACHE_DIR="${HOME}/.gradle-wrapper-cache"
DIST="${CACHE_DIR}/gradle-${GRADLE_VERSION}"
ZIP="${CACHE_DIR}/gradle-${GRADLE_VERSION}-bin.zip"

mkdir -p "${CACHE_DIR}"

if [ ! -x "${DIST}/bin/gradle" ]; then
  if [ ! -f "${ZIP}" ]; then
    echo "Downloading Gradle ${GRADLE_VERSION}..."
    curl -L --fail --retry 3 \
      "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" \
      -o "${ZIP}"
  fi
  rm -rf "${DIST}.tmp"
  mkdir -p "${DIST}.tmp"
  unzip -q "${ZIP}" -d "${DIST}.tmp"
  mv "${DIST}.tmp/gradle-${GRADLE_VERSION}" "${DIST}"
  rm -rf "${DIST}.tmp"
fi

exec "${DIST}/bin/gradle" "$@"
