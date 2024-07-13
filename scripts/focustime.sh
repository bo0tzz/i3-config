#!/bin/bash
i3-msg -m -t subscribe '["window"]' | jq -r --unbuffered 'select(.change=="focus") | .container.window_properties.title' | sed -u 's/"//g' | sed -u "s/'//g" |
	while read -r title; do 
		timew start "$title";
	done
