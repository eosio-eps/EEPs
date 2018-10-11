#!/bin/bash
set -e # halt script on error

HTMLPROOFER_OPTIONS="./_site --internal-domains=eose.app --check-html --check-opengraph --report-missing-names --log-level=:debug --assume-extension --empty-alt-ignore --timeframe=6w --url-ignore=/EEPS/eep-1,EEPS/eep-1,/EEPS/eep-107,/EEPS/eep-858"

if [[ $TASK = 'htmlproofer' ]]; then
  bundle exec jekyll doctor
  bundle exec jekyll build
  bundle exec htmlproofer $HTMLPROOFER_OPTIONS --disable-external

  # Validate GH Pages DNS setup
  bundle exec github-pages health-check
elif [[ $TASK = 'htmlproofer-external' ]]; then
  bundle exec jekyll doctor
  bundle exec jekyll build
  bundle exec htmlproofer $HTMLPROOFER_OPTIONS --external_only
elif [[ $TASK = 'eep-validator' ]]; then
  BAD_FILES="$(ls EEPS | egrep -v "eip-[0-9]+.md|eep-20-token-standard.md")" || true
  if [[ ! -z $BAD_FILES ]]; then
    echo "Files found with invalid names:"
    echo $BAD_FILES
    exit 1
  fi

  FILES="$(ls EEPS/*.md | egrep "eep-[0-9]+.md")"
  bundle exec eep_validator $FILES
fi
