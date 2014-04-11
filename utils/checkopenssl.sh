#!/bin/bash
for _STATUS in RUNNING
do

        for _CONTAINER in $(lxc-ls)
        do
                if      lxc-info -n ${_CONTAINER} 2>&1 |grep -qs "${_STATUS}"
                then
			echo "===============${_CONTAINER}==================="
			lxc-attach -n $_CONTAINER -e -- dpkg -l |grep openssl
			lxc-attach -n $_CONTAINER -e -- dpkg -l |grep libssl
                fi
        done
done

