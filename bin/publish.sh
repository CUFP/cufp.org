#! /bin/sh

make clean-site
make PRODUCTION=true || exit 1

find _build/site -type d -exec chmod 755 {} \;
find _build/site -type f -exec chmod 644 {} \;

rsync -av --exclude .DS_Store --delete --delete-excluded \
  _build/site/ \
  cufp:~/cufp.org/

# Make sure you don't accidentally keep working with PRODUCTION files.
make clean-site
