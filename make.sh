#!/usr/bin/env bash

set -x

htmlize() {
    pandoc --verbose --standalone --css=style.css --from markdown+pandoc_title_block $1 -o $(sed "s/\.md/.html/" <<< $1)
}

htmlize_session() {
    pandoc --verbose --standalone --css=../style.css $1 -o $(sed "s/\.md/.html/" <<< $1) --include-before-body=header.html
        # --include-in-header= \
        # --include-before-body= \
        # --include-after-body= \
}

htmlize index.md

for session in sessions/*.md
do htmlize_session $session;
done

# |-- sessions
# |---- session-0.md
# |---- session-0.html
# |---- session-1.md
# |---- session-1.html
# |-- world
# |---- world.md
# |---- world.html
# | index.md
# | index.html
# | header.html
# | footer.html
# | style.css
# | script.js
# | README.md
# |-- img
# |---- s0.png
# |---- s1.png
