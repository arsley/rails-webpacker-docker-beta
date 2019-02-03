#! /bin/bash

echo 'Running potential asset precompile'

if [[ $# -eq 0 ]]; then
  RAILS_ENV=production rails assets:precompile
else
  if [[ $1 == "not" ]]; then
    echo 'argument == not, not running precompile'
  else
    RAILS_ENV=production rails assets:precompile
  fi
fi
