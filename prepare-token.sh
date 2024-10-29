#!/bin/bash
source .env
cd local
envsubst < mkdocs-material > mkdocs-material-key.scm
