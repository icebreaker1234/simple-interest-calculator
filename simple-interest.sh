#!/usr/bin/env bash
set -euo pipefail

is_non_negative_number() {
  [[ "$1" =~ ^[0-9]+([.][0-9]+)?$ ]]
}

read -r -p "Enter the principal amount: " principal
read -r -p "Enter the annual rate of interest (%): " rate
read -r -p "Enter the time period (years): " time

if ! is_non_negative_number "$principal" || ! is_non_negative_number "$rate" || ! is_non_negative_number "$time"; then
  echo "Please enter non-negative numbers for principal, rate, and time." >&2
  exit 1
fi

awk -v principal="$principal" -v rate="$rate" -v time="$time" 'BEGIN {
  interest = principal * rate * time / 100
  total = principal + interest
  printf "Simple interest: %.2f\nTotal amount: %.2f\n", interest, total
}'
