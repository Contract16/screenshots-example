> screenshots/app_screenshots.md

kGoldenRegex='test(\/|\\).*(\/|\\)goldens(\/|\\).*.png'

function traverse {
    local a file
    for a; do
        for file in "$a"/*; do
            if [[ -d $file ]]; then
                traverse "$file"
            else
                if [[ $file =~ $kGoldenRegex ]]; then
                    echo "Deleting: $file"
                    rm "$file"
                fi
            fi
        done
    done
}

traverse "test"
echo "All screenshots deleted."