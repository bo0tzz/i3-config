#!/bin/bash
pulseaudio-control --node-nicknames-from "device.description" --node-nickname "*analog-stereo*:Speakers" listen | while read line; do
      # Get the MAC address of the current output device
      mac=$(pulseaudio-control --node-nicknames-from "api.bluez5.address" output | awk '{print $2}')

      # If MAC exists, get battery percentage
      if [ -n "$mac" ]; then
          battery=$(bluetoothctl info "$mac" | grep "Battery Percentage" | awk '{print $NF}' | tr -d '()')
          if [ -n "$battery" ]; then
              echo "$line %{T1}%{T-}$battery%"
          else
              echo "$line"
          fi
      else
          echo "$line"
      fi
  done
