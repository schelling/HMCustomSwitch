#import <UIKit/UIKit.h>
#import "HMCustomSwitch.h"

@interface TestBedController : UIViewController
@end

@implementation TestBedController

- (void)loadView
{
	UIView *contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	self.view = contentView;
	contentView.backgroundColor = [UIColor whiteColor];
	
	// Standard ON/OFF
	HMCustomSwitch *switchView = [[HMCustomSwitch alloc] initWithFrame:CGRectZero];
	switchView.center = CGPointMake(160.0f, 20.0f);
	switchView.on = YES;
	[contentView addSubview:switchView];
	[switchView release];
	
	// Custom YES/NO
	switchView = [HMCustomSwitch switchWithLeftText:@"YES" andRight:@"NO"];
	switchView.center = CGPointMake(160.0f, 60.0f);
	switchView.on = YES;
	[contentView addSubview:switchView];
	
	// Custom font and color
	switchView = [HMCustomSwitch switchWithLeftText:@"Hello " andRight:@"ABC "];
	switchView.center = CGPointMake(160.0f, 100.0f);
	switchView.on = YES;
	[switchView.leftLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
	[switchView.rightLabel setFont:[UIFont italicSystemFontOfSize:15.0f]];
	[switchView.rightLabel setTextColor:[UIColor blueColor]];
	[contentView addSubview:switchView];
	
	// Multiple lines
	switchView = [HMCustomSwitch switchWithLeftText:@"Hello\nWorld" andRight:@"Bye\nWorld"];
	switchView.center = CGPointMake(160.0f, 140.0f);
	switchView.on = YES;
	switchView.tintColor = [UIColor orangeColor];
	switchView.leftLabel.font = [UIFont boldSystemFontOfSize:9.0f];
	switchView.rightLabel.font = [UIFont boldSystemFontOfSize:9.0f];
	switchView.leftLabel.numberOfLines = 2;
	switchView.rightLabel.numberOfLines = 2;
	switchView.leftLabel.lineBreakMode = NSLineBreakByWordWrapping;
	switchView.rightLabel.lineBreakMode = NSLineBreakByWordWrapping;
	[contentView addSubview:switchView];
	
	switchView = [[HMCustomSwitch alloc] init];
	switchView.center = CGPointMake(160.0f, 180.0f);
	switchView.on = YES;
	switchView.tintColor = [UIColor purpleColor];
	[contentView addSubview:switchView];
	[switchView release];
	
	switchView = [HMCustomSwitch switchWithLeftText:@"l" andRight:@"O"];
	switchView.center = CGPointMake(160.0f, 220.0f);
//	customSwitch.tintColor = [UIColor colorWithRed:125.f/255.f green:157.f/255.f blue:93.f/255.f alpha:1.0];
//	customSwitch.tintColor = [UIColor colorWithRed:125.f/255.f green:157.f/255.f blue:93.f/255.f alpha:1.0];
	[contentView addSubview:switchView];

	// Standard ON/OFF
	switchView = [[HMCustomSwitch alloc] init];
	switchView.center = CGPointMake(160.0f, 260.0f);
	switchView.tintColor = [UIColor colorWithRed:125.f/255.f green:157.f/255.f blue:93.f/255.f alpha:1.0];
	[switchView addTarget:self action:@selector(switchFlipped:) forControlEvents:UIControlEventValueChanged];
	[contentView addSubview:switchView];
	[switchView release];
	
	
	
	UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 420, 320, 40)];
	toolbar.tintColor = [UIColor colorWithRed:125.f/255.f green:157.f/255.f blue:93.f/255.f alpha:1.0];
	[contentView addSubview:toolbar];
	
	[contentView release];
}

-(void)switchFlipped:(HMCustomSwitch*)switchView
{
	NSLog(@"switchFlipped=%f  on:%@",switchView.value, (switchView.on?@"Y":@"N"));
	
}

@end


@interface TestBedAppDelegate : NSObject <UIApplicationDelegate>
@end

@implementation TestBedAppDelegate
- (void)applicationDidFinishLaunching:(UIApplication *)application {	
	UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	TestBedController *tbc = [[TestBedController alloc] init];
	[window addSubview:tbc.view];
	[window makeKeyAndVisible];
}
@end

int main(int argc, char *argv[])
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	int retVal = UIApplicationMain(argc, argv, nil, @"TestBedAppDelegate");
	[pool release];
	return retVal;
}
