#import "ItsAboutTimeFaceView.h"

/**
 * Have you checked the "Hello World" example already?
 * If not, you should check this one out first for the basics.
 */

@interface ItsAboutTimeFaceView () {
	UILabel* _timeLabel;
	
	// Use this token to start and stop the clock timer
	NSNumber* _clockTimerToken;
}
@end

@implementation ItsAboutTimeFaceView

- (instancetype)initWithFaceStyle:(long long)faceStyle forDevice:(id)device clientIdentifier:(id)clientIdentifier {
	if (self = [super initWithFaceStyle:faceStyle forDevice:device clientIdentifier:clientIdentifier]) {
		// Just some basic label setup
		_timeLabel = [UILabel new];
		[_timeLabel setTextColor:[UIColor whiteColor]];
		[_timeLabel setTextAlignment:NSTextAlignmentCenter];
		[_timeLabel setNumberOfLines:2];
		[_timeLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
		
		[self addSubview:_timeLabel];
		
		[NSLayoutConstraint activateConstraints:@[
			[_timeLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
			[_timeLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor]
		]];		
	}
	
	return self;
}

#pragma mark - Instance Methods

/**
 * This method is called by NanoTimeKit when this watch face is selected or LockWatch unfreezes it
 */
- (void)_becameActiveFace {
	// In this example, we create a clock update timer ticking every second.
	// A clock timer can also tick every "subsecond", minute, 30 fps or native (60/120) fps
	
	// 	_clockTimerToken = [[CLKClockTimer sharedInstance] startSubsecondUpdatesWithHandler:^(NSDate* date) {}];
	// 	_clockTimerToken = [[CLKClockTimer sharedInstance] startMinuteUpdatesWithHandler:^(NSDate* date) {}];
	// 	_clockTimerToken = [[CLKClockTimer sharedInstance] start30fpsUpdatesWithHandler:^(NSDate* date) {} identificationLog:nil];
	// 	_clockTimerToken = [[CLKClockTimer sharedInstance] startDisplayNativeUpdatesWithHandler:^(NSDate* date) {} identificationLog:nil];
	 
	_clockTimerToken = [[CLKClockTimer sharedInstance] startSecondUpdatesWithHandler:^(NSDate* date) {
		// You can specify anything you want in the update handler.
		// For convenience, we'll call another method that handles any kind of time update.
		[self timeDidUpdate:[[NTKTimeOffsetManager sharedManager] faceDisplayTime]];
	} identificationLog:nil];
}

- (void)_becameInactiveFace {
	// The clock timer MUST be stopped the same way it was started.
	// If you start minute updates, you must stop minute updates.
	
	// 	[[CLKClockTimer sharedInstance] stopSubsecondUpdatesForToken:_clockTimerToken];
	// 	[[CLKClockTimer sharedInstance] stopMinuteUpdatesForToken:_clockTimerToken];
	// 	[[CLKClockTimer sharedInstance] stop30fpsUpdatesForToken:_clockTimerToken];
	// 	[[CLKClockTimer sharedInstance] stopDisplayNativeUpdatesForToken:_clockTimerToken];
	
	if (_clockTimerToken) {
		[[CLKClockTimer sharedInstance] stopSecondUpdatesForToken:_clockTimerToken];
		_clockTimerToken = nil;
	}
}

/**
 * This method gets called whenever the time is set to default when you enter the watch face switcher,
 * or when there's a preview of your watch face.
 */
- (void)setOverrideDate:(NSDate*)date duration:(CGFloat)duration {
	[super setOverrideDate:date duration:duration];
	
	// We'll just call our time update method here
	if (date) {
		[self timeDidUpdate:date];
	}
}



/**
 * This is the method we specified for applying time updates.
 * You can do anything you want, but it shouldn't take too long.
 */
- (void)timeDidUpdate:(NSDate*)time {
	// Format the time into a usable string. This example uses HH:mm:ss as its format (eg. 10:09:30)
	NSDateFormatter* dateFormatter = [NSDateFormatter new];
	[dateFormatter setDateFormat:@"HH:mm:ss"];
	NSString* timeString = [dateFormatter stringFromDate:time];
	
	// Now apply the formatted string to our label
	[_timeLabel setText:[NSString stringWithFormat:@"Hello, world!\n%@", timeString]];
}

@end