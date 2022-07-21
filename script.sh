#!/usr/bin/env bash

if ! command -v yq > /dev/null 2>&1; then
    echo "Please install yq to run the pre-commit hook! https://github.com/mikefarah/yq"
    exit 1
fi

for lb_config in `find environments/ -name 'backend_lb_config.yaml'`
do 

    for app_configuration_number in $(yq eval '.gateways.[].app_configuration | length' $lb_config); do

        if [ "$app_configuration_number" -gt "2" ]
        then
            echo "change your application to use the next gateway that is not full" && exit 1
        fi

    done

done 