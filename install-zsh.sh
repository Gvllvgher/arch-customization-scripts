#! /bin/bash

# Parameters
while getopts ':u:' opt; do
    case $opt in
        u)
            LOCAL_USER=${OPTARG}
            echo "install-zsh.sh: LOCAL_USER set to: ${OPTARG}"
            ;;
        \?)
            echo "Invalid option: -$OPTARG"
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument."
            exit 1
            ;;
    esac
done

if [[ -z "$LOCAL_USER" ]]; then
    echo "install-zsh.sh: Use paramter -u to specify a username."
    exit 1
fi

pacman -Sy zsh zsh-syntax-highlighting zsh-autosuggestions --noconfirm > /dev/null
chsh -s $(which zsh) $LOCAL_USER
