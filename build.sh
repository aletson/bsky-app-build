#!/bin/bash -i
shopt -s expand_aliases
cd /path/to/social-app
git pull origin main
sed -Ei 's/(msgid ")(.*Post.*)("\r\nmsgstr\s")(")/\1\2\3\2\4/' src/locale/locales/en/messages.po # Add locale string
sed -Ei 's/(msgid ")(.*post.*)("\r\nmsgstr\s")(")/\1\2\3\2\4/' src/locale/locales/en/messages.po
sed -Ei 's/(msgid ".*post.*"\r\nmsgstr ".*)(post)(.*")/\1skeet\3/' src/locale/locales/en/messages.po # Substitute locale string with "skeet"
sed -Ei 's/(msgid ".*post.*"\r\nmsgstr ".*)(post)(.*")/\1skeet\3/' src/locale/locales/en/messages.po # Runs twice to catch second instance in one line
sed -Ei 's/(msgid ".*Post.*"\r\nmsgstr ".*)(Post)(.*")/\1Skeet\3/' src/locale/locales/en/messages.po # now with capital letters
sed -Ei 's/(msgid ".*Post.*"\r\nmsgstr ".*)(Post)(.*")/\1Skeet\3/' src/locale/locales/en/messages.po
yarn update
npx expo prebuild
yarn intl:build
cd android
./gradlew assembleRelease
aws s3api put-object --bucket your-bucket --key bsky.apk --body app/release/app-release.apk
aws cloudfront create-invalidation --distribution-id your-distribution --paths "/bsky.apk"
