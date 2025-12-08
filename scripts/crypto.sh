#!/usr/bin/env zsh

set -e

usage() {
  echo "Usage: $0 -t <enc|dec|upd> <path>"
  exit 1
}

if [[ $# -lt 2 ]]; then
  usage
fi

# Parse args
while getopts "t:" opt; do
  case $opt in
    t) TYPE=$OPTARG ;;
    *) usage ;;
  esac
done
shift $((OPTIND - 1))

TARGET="$1"

if [[ "$TYPE" != "enc" && "$TYPE" != "dec" && "$TYPE" != "upd" ]]; then
  usage
fi

# only do ask passwor if there is no $CRP_PASSWORD set
if [[ -z "$CRP_PASSWORD" ]]; then
  read -s "CRP_PASSWORD?password: "
  echo ""
fi

encrypt_file() {
  local FILE=$1
  local OUTFILE="$FILE.enc"

  openssl enc -aes-256-cbc \
    -pbkdf2 -iter 100000 \
    -salt -a \
    -pass "pass:$CRP_PASSWORD" \
    -in "$FILE" -out "$OUTFILE"
}

decrypt_file() {
  local FILE="$1"
  local OUT="${FILE%.enc}"

  openssl enc -d -aes-256-cbc \
    -pbkdf2 -iter 100000 \
    -a -salt \
    -pass "pass:$CRP_PASSWORD" \
    -in "$FILE" -out "$OUT"
}

process() {
  local TARGET="$1"

  if [[ -d "$TARGET" ]]; then
    if [[ "$TYPE" == "enc" ]]; then
			echo "encrypting $TARGET"
      for f in "$TARGET"/*(.N); do
        [[ "$f" == *.enc ]] && continue
        encrypt_file "$f"
				rm "$f"
      done
    elif [[ "$TYPE" == "dec" ]]; then
			echo "decrypting $TARGET"
      for f in "$TARGET"/*.enc(.N); do
        decrypt_file "$f"
      done
    else # upd
			echo "updating $TARGET"
      for f in "$TARGET"/*(.N); do
        [[ "$f" == *.enc ]] && continue
				encrypt_file "$f"
				rm "$f"
        decrypt_file "$f.enc"
      done
    fi
  else
    echo "error: $TARGET is not a directory"
    exit 1
  fi
}

TARGET_PATH=$(realpath "$TARGET")
process "$TARGET_PATH"
