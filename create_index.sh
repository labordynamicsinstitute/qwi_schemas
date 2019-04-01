#!/bin/bash
if [[ -z $1 ]]
	then
	cat << EOF
	$0 [branch]

	will generate a index.html page from fragments for gh-pages.

	Requires: multimarkdown

	Does not run on lehd-related  branches. 
EOF
exit 0
fi

wd=$(dirname $0)
echo $wd

case $1 in
   lehd*)
   echo "does not run for branch $1"
   ;;
   *)
	cat $wd/header.frag | sed "s/BUILDDATE/$(date)/" | sed "s/BUILDINFO/$1/"> $wd/index.html
	multimarkdown $wd/README.md >> $wd/index.html
	cat $wd/footer.frag >> $wd/index.html
	;;
esac
