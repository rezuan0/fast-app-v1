
# shellcheck disable=SC2046
kill $(lsof -t -i :8000)
