#!/bin/bash
flameshot gui -r > /tmp/ss.png;if [ ! -s /tmp/ss.png ]; then
  exit 1
fi
token=$(cat $HOME/.config/i3/scripts/zipline-token)
curl -H "authorization: $token" https://bo0.tz/api/upload -F file=@/tmp/ss.png -H "Content-Type: multipart/form-data" -H "Format: random" | jq -r '.files[0]' | tr -d '\n' | xsel -ib;
