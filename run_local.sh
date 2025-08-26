#!/bin/sh
cd $(dirname $0)
set -e
python -m venv ./venv
source ./venv/bin/activate
pip install mkdocs-material
pip install mkdocs-roamlinks-plugin
pip install mkdocs-rss-plugin
pip install mkdocs-pdf
pip install mkdocs-callouts
pip install -e ./mkdocs-section-index
mkdocs serve --dirty
# mkdocs gh-deploy
