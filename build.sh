#!/bin/zsh

poetry_env_cmd=$(poetry env info --path)/bin/activate
source $poetry_env_cmd
poetry install

DYLD_LIBRARY_PATH=/opt/homebrew/opt/libomp/lib:$DYLD_LIBRARY_PATH \
python -m nuitka \
  --standalone \
  --company-name=Mimoto \
  --file-version=0.1.0 \
  --product-version=0.1.0 \
  --noinclude-unittest-mode=nofollow \
  --noinclude-pytest-mode=nofollow \
  --noinclude-setuptools-mode=nofollow \
  --include-module=xgboost \
  --include-module=xgboost.core \
  --include-module=xgboost.sklearn \
  --include-package=xgboost \
  --include-package=xgboost.core \
  --include-package=xgboost.sklearn \
  --macos-create-app-bundle \
  --main=xgboost_macos_problem.py \
  --static-libpython=no \
  --show-progress \
  --lto=yes \
  --jobs=8
