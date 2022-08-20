set -e

git add .

git commit -m"update docs"

git push -f origin gh-pages

git remote set-url origin git@github.com:lhncxf/pages.git

git push -f origin gh-pages

git remote set-url origin git@gitee.com:lhncxf/Notes.git
