#!/bin/sh

echo " $(playerctl -p playerctld metadata --format "{{ artist }} - {{ title }}")"

