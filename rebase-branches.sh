#!/bin/sh

git checkout main     && git pull            && git push -f && \
git checkout v2.289.x && git rebase main     && git push -f && \
git checkout v2.303.x && git rebase v2.289.x && git push -f && \
git checkout v2.319.x && git rebase v2.303.x && git push -f && \
git checkout v2.332.x && git rebase v2.319.x && git push -f && \
git checkout v2.x     && git rebase v2.332.x && git push -f && \
git checkout v2.319.x ;
