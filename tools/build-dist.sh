# This is not a ready-to-run script. It just shows the relevant command-line calls.

XC_WORKSPACE=path/to/MyApp.xcworkspace
XC_SCHEME=MyApp
XC_CONFIG=Release
ARCHIVE_PATH=dest/path/to/MyApp.xcarchive
EXPORT_PATH=dest/path/to/MyApp.ipa
DIST_PROFILE=NameOfDistributionProfile

# Build and archive. This can be done by regular developers, using their developer key/profile.
xcodebuild -workspace $XC_WORKSPACE -scheme $XC_SCHEME -sdk iphoneos -configuration $XC_CONFIG archive -archivePath $ARCHIVE_PATH

# Export to IPA: Takes the above archive an re-signs the app using the provided profile (xcode tries to find a matching key).
xcodebuild -exportArchive -exportFormat IPA -archivePath $ARCHIVE_PATH -exportPath $EXPORT_PATH -exportProvisioningProfile "$DIST_PROFILE"

