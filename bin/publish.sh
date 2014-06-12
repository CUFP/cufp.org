#! /bin/sh

omake site-clean
omake PRODUCTION=true

find _build/site -type d -exec chmod 755 {} \;
find _build/site -type f -exec chmod 644 {} \;

rsync -av --exclude .DS_Store --delete --delete-excluded \
  _build/site/ \
  cufp:~/cufp.org/

# Make sure you don't accidentally keep working with PRODUCTION files.
omake site-clean
