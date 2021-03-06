#!/bin/bash

set -e # exit when error

mkdir -p ./netlify-dist/examples

# build community website
(cd community-website && yarn)
(cd community-website && ROOT_PATH=$ROOT_PATH yarn docs:build)
mv ./community-website/docs/* ./netlify-dist/

# build examples
yarn examples:ecommerce:build
yarn examples:router:build
yarn examples:media:build
yarn examples:storybook:build

mv ./examples/e-commerce/dist ./netlify-dist/examples/e-commerce
mv ./examples/angular-router/dist ./netlify-dist/examples/angular-router
mv ./examples/media/dist ./netlify-dist/examples/media
mv ./examples/storybook/dist ./netlify-dist/examples/storybook
