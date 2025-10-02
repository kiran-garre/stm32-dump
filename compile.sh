set -e

FOLDER_PATH=$1

if [[ $# -ne 1 ]]; then
    echo "Expected exactly 1 argument"
    exit 1
fi

cd $FOLDER_PATH
bash "compile_script.sh"