#import "HelloWorldFaceView.h"

@implementation HelloWorldFaceView

- (instancetype)initWithFaceStyle:(long long)faceStyle forDevice:(id)device clientIdentifier:(id)clientIdentifier {
	if (self = [super initWithFaceStyle:faceStyle forDevice:device clientIdentifier:clientIdentifier]) {
		UILabel* helloWorldLabel = [UILabel new];
		[helloWorldLabel setText:@"Hello, world!"];
		[helloWorldLabel setTextColor:[UIColor whiteColor]];
		[helloWorldLabel setTextAlignment:NSTextAlignmentCenter];
		[helloWorldLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
		
		[self addSubview:helloWorldLabel];
		
		// Constraints must be added AFTER a view has been added to the view hierarchy!
		[NSLayoutConstraint activateConstraints:@[
			[helloWorldLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
			[helloWorldLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor]
		]];		
	}
	
	return self;
}

@end