set -e

git add .

git commit -m"update docs"

git push origin gh-pages

git remote set-url origin git@gitee.com:lhncxf/Notes.git

git push origin gh-pages

git remote set-url origin git@github.com:lhncxf/pages.git
