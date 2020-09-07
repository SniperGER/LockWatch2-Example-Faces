#import "HelloWorldFace.h"

@implementation HelloWorldFace

/**
 * This method controls if a watch face is available for a certain watch model.
 * You can check for Series 4 or later using [device isLuxo].
 */
+ (BOOL)acceptsDevice:(CLKDevice*)device {
	return YES;
}

/**
 * Specify your face view class
 */
+ (Class)faceViewClass {
	return NSClassFromString(@"HelloWorldFaceView");
}

/**
 * This method generates a UUID once and returns the same UUID every time the method is called.
 * The UUID is used for the persistence inside face collections.
 */
+ (NSUUID*)uuid {
    static NSUUID* uuid;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        uuid = [NSUUID UUID];
    });
    
    return uuid;
}

/**
 * Specify the author of this watch face.
 * In this example, the author is defined in Resources/Info.plist using CFBundleCopyright
 */
- (NSString*)author {
	return [[[NSBundle bundleForClass:self.class] infoDictionary] objectForKey:@"CFBundleCopyright"];
}

/**
 * This is the description of your face.
 * Here, the description is localized, returning a string defined in Resources/[language].lproj/HelloWorld.strings.
 */
- (NSString*)faceDescription {
	return [[NSBundle bundleForClass:self.class] localizedStringForKey:@"DESCRIPTION" value:@"DESCRIPTION" table:@"HelloWorld"];
}

/**
 * Returns the face style, which is always NTKFaceStyleCustom for custom faces
 */
- (long long)faceStyle {
	return NTKFaceStyleCustom;
}

/**
 * Specify the name of this watch face
 */
- (NSString*)name {
	return @"Hello World";
}

@end