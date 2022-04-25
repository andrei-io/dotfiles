
#!/bin/sh

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd "$parent_path"

while read EXTENSION
do
    echo "Installing ${EXTENSION}. .."
    code --install-extension ${EXTENSION}
done < "$parent_path/extensions.txt"