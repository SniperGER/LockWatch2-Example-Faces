# LockWatch 2 Example Watch Faces - Hello World

This is a very basic watch face that displays "Hello World" in the center.

### How to create this watch face?
Watch faces consist of two parts: The "core" class and the view class. The "core" class defines the environment of a watch face, mainly the name, if it supports a certain device type and how it can be customized. The view class tells LockWatch 2 how a face looks.

`HelloWorldFace`  
This class conforms to a protocol defined in LockWatch 2 called `LWCustomFaceInterface`. It defines the name, description, author, which view class to use and the face style. For custom faces, this is _ALWAYS_ NTKFaceStyleCustom (`0x100`). Every text can also be localized, as seen in the example description.

`HelloWorldFaceView`  
This class defines the look of your watch face. In this example, it creates a simple UILabel with white text color in the center of the face, and uses constraints to keep it there.

Please make sure to customize `Resources/Info.plist` to your liking.  
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleCopyright</key>
	<string>YOUR NAME HERE</string>
	<key>CFBundleDevelopmentRegion</key>
	<string>English</string>
	<key>CFBundleExecutable</key>
	<string>PROJECT NAME HERE</string>
	<key>CFBundleIdentifier</key>
	<string>PROJECT BUNDLE IDENTIFIER HERE</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>
	<key>CFBundlePackageType</key>
	<string>BNDL</string>
	<key>CFBundleShortVersionString</key>
	<string>1.0</string>
	<key>CFBundleSignature</key>
	<string>????</string>
	<key>CFBundleVersion</key>
	<string>1</string>
</dict>
</plist>
```