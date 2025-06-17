#!/usr/bin/env bash
> screenshots/app_screenshots.md

echo "# Screenshots" >> screenshots/app_screenshots.md
echo "This file contains all the screenshots that are generated during the tests." >> screenshots/app_screenshots.md

kGoldenRegex='test(\/|\\).*(\/|\\)goldens(\/|\\).*.png'

function traverse {
    local a file
    sectionTitle=""
    sectionSubtitle=""
    for a; do
        for file in "$a"/*; do
            if [[ -d $file ]]; then
                traverse "$file"
            else
                if [[ $file =~ $kGoldenRegex ]]; then
                    title=$(echo $file | sed -E 's/.*\/(.*)_golden_.*/\1/g')
                    subtitle=$(echo $file | sed -E 's/.*\/.*_golden_(.*)_.*/\1/g')
                    
                    if [[ $title != $sectionTitle ]]; then
                        sectionTitle=$title
                        echo "## $title" >> screenshots/app_screenshots.md
                    fi
                    
                    if [[ $subtitle != $sectionSubtitle ]]; then
                        sectionSubtitle=$subtitle
                        echo "### $subtitle" >> screenshots/app_screenshots.md
                    fi
                    
                    name=$(echo $file | sed -E 's/.*\/.*_golden_.*_(.*)\.png/\1/g')
                    echo "#### $name" >> screenshots/app_screenshots.md
                    echo "![${file##*/}](../$file)" >> screenshots/app_screenshots.md
                    echo "" >> screenshots/app_screenshots.md
                fi
            fi
        done
    done
}

traverse "test"
echo "Screenshots added to document."
