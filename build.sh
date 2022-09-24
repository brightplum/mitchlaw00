git config --local user.email "action@github.com"
git config --local user.name "GitHub Actions"
git fetch origin gh-pages

if [ ! -d "dist" ]; then
  mkdir dist
fi;

cp -Rfv build/* ./dist/

git checkout gh-pages

for dir in ./*
do
  if [ "$dir" == "./dist" ]; then
    continue
  fi

  rm -rf "$dir"
done

cp -Rfv dist/* ./
rm -rf dist

echo "mitchlaw00.com" > CNAME

git add .
git branch -D gh-pages
git branch -m gh-pages
git commit -m "Update Website ($1)"
git push -f origin gh-pages
