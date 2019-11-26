#!/usr/bin/env zsh
isOS()
{
    if [[ "$OSTYPE:l" == *"$1:l"* ]]
    then
        return 0;
    fi

    return 1;
}
currentBranch=$(basename $(git symbolic-ref HEAD))
cmd=$(isOS linux && echo "xdg-open" || echo "open")
remote=$(git remote get-url origin)
empty=""
# for https
# TODO
#repoName=$(basename -s .git $remote)
#repoAndOrgName=${dirname -s .git $(git remote get-url origin))
# for ssh
orgAndRepo=${remote##*:}
orgAndRepo=${orgAndRepo/.git/$nop}
