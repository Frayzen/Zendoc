#!/bin/sh
cd $(dirname $0)
python -m venv ./venv
source ./venv/bin/activate
pip install mkdocs-material
pip install mkdocs-roamlinks-plugin
pip install mkdocs-rss-plugin
pip install mkdocs-awesome-pages-plugin
mkdocs serve
# mkdocs gh-deploy
