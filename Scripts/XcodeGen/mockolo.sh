rm -f $SRCROOT/$TARGET_NAME/Generated/MockResults.swift
SDKROOT=$(xcrun --sdk macosx --show-sdk-path)
Tools/UhooiPicBookTools/.build/release/mockolo --sourcedirs $SRCROOT/$TARGET_NAME --sourcedirs $SRCROOT/Shared --destination $SRCROOT/$TARGET_NAME/Generated/MockResults.swift --mock-final

