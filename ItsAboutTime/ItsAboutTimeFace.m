#import "ItsAboutTimeFace.h"

/**
 * Have you checked the "Hello World" example already?
 * If not, you should check this one out first for the basics.
 */

@implementation ItsAboutTimeFace

+ (BOOL)acceptsDevice:(CLKDevice*)device {
	return YES;
}

+ (Class)faceViewClass {
	return NSClassFromString(@"ItsAboutTimeFaceView");
}

+ (NSUUID*)uuid {
    static NSUUID* uuid;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        uuid = [NSUUID UUID];
    });
    
    return uuid;
}

- (NSString*)author {
	return [[[NSBundle bundleForClass:self.class] infoDictionary] objectForKey:@"CFBundleCopyright"];
}

- (NSString*)faceDescription {
	return [[NSBundle bundleForClass:self.class] localizedStringForKey:@"DESCRIPTION" value:@"DESCRIPTION" table:@"ItsAboutTime"];
}

- (long long)faceStyle {
	return NTKFaceStyleCustom;
}

- (NSString*)name {
	return @"It's about time";
}

@end