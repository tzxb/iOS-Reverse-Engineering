#!/bin/bash

IFS=$'\n'

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
echo -e "DIR : ${DIR}"
start_date=$(date +"%s")

local_base_dir="${DIR}/../LocalLiveKit"

lock_file_path="${DIR}/LiveKit.lock"
local_lock_file_path="${local_base_dir}/LocalLiveKit.lock"

function cloneRepoAndCheckoutCommit() {
    local name="$1"
    local dir="${local_base_dir}/${name}"
    local repo="$(cat "${lock_file_path}" | grep -Eo "\"repo_${name}\"=\"(.*)\"\;" | sed "s/\"repo_${name}\"=\"\(.*\)\"\;/\1/g")"
    local commit="$(cat "${lock_file_path}" | grep -Eo "\"commit_${name}\"=\"(.*)\"\;" | sed "s/\"commit_${name}\"=\"\(.*\)\"\;/\1/g")"
    
    echo -e "name   : ${name}"
    echo -e "dir    : ${dir}"
    echo -e "repo   : ${repo}"
    echo -e "commit : ${commit} \n "

    if [[ -d "${dir}" ]]; then
        cd "${dir}"
        git stash
        git clean -d -fx
        git checkout -f .
    else
        git clone "${repo}" "${dir}"
    fi  

    cd "${dir}"
    git fetch
    git checkout -f "${commit}"
}

function mainFunction() {  
    mkdir -p "${local_base_dir}"
    cd "${local_base_dir}"    

    rm -f "${local_lock_file_path}"   

    cloneRepoAndCheckoutCommit "VlvBaseModule" 
    cloneRepoAndCheckoutCommit "KPLiveShowKit"

    cp -f "${lock_file_path}" "${local_lock_file_path}"
}

mainFunction "$@"

end_date=$(date +"%s")
time_diff=$(($end_date-$start_date))
echo -e " \n$(($time_diff / 60)) minutes and $(($time_diff % 60)) seconds to update LiveKit . \n"
    
