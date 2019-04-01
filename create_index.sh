#!/bin/bash
if [[ -z $1 ]]
	then
	cat << EOF
	$0 [branch]

	will generate a index.html page from fragments for gh-pages.

	Requires: multimarkdown

	Only runs on gh-pages branch. Does not run on other branches
EOF
exit 0
fi

wd=$(dirname $0)
echo $wd

case $1 in
   gh-pages)
	cat $wd/header.frag > $wd/index.html
	multimarkdown $wd/README.md >> $wd/index.html
	cat $wd/footer.frag >> $wd/index.html
	;;
   *)
   echo "does not run for branch $1"
   ;;
esac
