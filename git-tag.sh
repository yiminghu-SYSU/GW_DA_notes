#!/bin/bash
gitLOG=`git log -1`;
commitID=`echo "$gitLOG" | grep "^commit " | sed -e"s/commit //g"`;
commitDate=`echo "$gitLOG" | grep "^Date" | sed -e"s/Date:[ ]*"//g`;

echo "\\def\\commitID{commitID: $commitID}" > __tmp
echo "\\def\\commitDATE{$commitDate}" >> __tmp

if diff __tmp tex/tag.tex  >/dev/null 2>&1; then
    ## files are identical, no update required
    exit 0;
else
    ## files diff: update
    cp __tmp tex/tag.tex;
fi

