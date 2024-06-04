# bsky-app-build

bash script. replaces "post" with "skeet" in the bluesky app and then builds the apk and uploads it to an s3 bucket.

tested on windows but you dont need windows that's just what was handy for me

prereqs: npm, yarn, expo-cli (via yarn), aws cli (if on Windows, add to ~/.bashrc, e.g. `alias aws="winpty /C/Program\ Files/Amazon/AWSCLI/bin/aws.cmd` - remember to configure in `~/.aws/config` and `~/.aws/credentials` before running the script)

following the build guide for the Bluesky app will get you 90% of the way here, just gotta do the aws cli stuff by hand tbh

make sure your `android/app/build.gradle` contains the configuration for your keystore and is set up to apply the signing config when running `gradlew assembleRelease`

