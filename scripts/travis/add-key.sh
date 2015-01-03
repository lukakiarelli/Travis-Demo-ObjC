security create-keychain -p travis ios-build.keychain
security default-keychain -s ios-build.keychain
security unlock-keychain -p travis ios-build.keychain
security -v set-keychain-settings -lut 86400 ios-build.keychain
security import ./scripts/travis/apple.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
security import ./scripts/travis/dist.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
security import ./scripts/travis/dist.p12 -k ~/Library/Keychains/ios-build.keychain -P "testpassword" -T /usr/bin/codesign
mkdir -vp ~/Library/MobileDevice/Provisioning\ Profiles/
cp -v ./scripts/travis/mobileprofile/* ~/Library/MobileDevice/Provisioning\ Profiles/