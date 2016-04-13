#!/bin/bash
if [[ -z $1 ]]
	then
	cat << EOF
	$0 start

	will generate a index.html page from fragments for gh-pages.

	Requires: multimarkdown
EOF
exit 0
fi

cat header.frag > index.html
multimarkdown README.md >> index.html
cat footer.frag >> index.html
git add index.html
git status
