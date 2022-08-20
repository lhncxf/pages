set -e

git add .

git commit -m"update docs"

git push -f origin gh-pages
