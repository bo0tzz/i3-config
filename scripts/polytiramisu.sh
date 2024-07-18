#!/bin/sh
# Show tiramisu notifications in polybar.

# How many seconds notification is displayed:
display_duration=3.0

# Maximum number of characters:
char_limit=100

# Stop old tiramisu processes if any:
pgrep -x tiramisu >/dev/null && killall tiramisu

# Start a new tiramisu process:
tiramisu -j |
    while read -r json; do
        
	summary=$(echo "$json" | jq -r '.summary')
        body=$(echo "$json" | jq -r '.body')

	line="$summary: $body"
	line=${line//$'\n'/\\n}	
        # Cut notification by character limit:
        if [ "${#line}" -gt "$char_limit" ]; then
            line="$(echo "$line" | cut -c1-$((char_limit-1)))…"
        fi

        # Display notification for the duration time:
        echo "$line"
        sleep "$display_duration"
        echo " "
    done

