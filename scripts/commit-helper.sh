#!/bin/bash
echo "Select commit type:"
select TYPE in feat fix docs style refactor test chore; do
  [ -n "$TYPE" ] && break
done

read -p "Scope (e.g., api, build, readme): " SCOPE
read -p "Short description: " DESC

echo
echo "Resulting commit message:"
echo "$TYPE($SCOPE): $DESC"

read -p "Proceed with commit? (y/n): " CONFIRM
[ "$CONFIRM" == "y" ] && git commit -m "$TYPE($SCOPE): $DESC"
