#!/usr/bin/env bash
echo "This is a bash shell"
echo "Link $1"
export LOG=log.txt
export URL=$1
wget --no-directories --mirror --spider "$URL" 2>&1 | tee "$LOG";
crawled_links=(`grep -P -o -e '(?<=^--....-..-.. ..:..:..--  )(.*)' "$LOG"`);
echo "::set-output name=orphan-pages::$crawled_links"
        # echo "::set-output name=orphan-pages::$(`grep -P -o -e '(?<=^--....-..-.. ..:..:..--  )(.*)' "$LOG"`)"

        # wget --no-directories --mirror --spider "$URL" 2>&1 | tee "$LOG";
        # grep -P -o -e '(?<=^--....-..-.. ..:..:..--  )(.*)' "$LOG";
        # echo "::set-output name=orphan-pages::$(`grep -P -o -e '(?<=^--....-..-.. ..:..:..--  )(.*)' "$LOG"`)"