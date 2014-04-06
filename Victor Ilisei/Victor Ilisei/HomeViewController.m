//
//  HomeViewController.m
//  Victor Ilisei
//
//  Created by Victor Ilisei on 4/5/14.
//  Copyright (c) 2014 Tech Genius. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // Update Status Bar
    [self setNeedsStatusBarAppearanceUpdate];
    // Create background
    self.view.backgroundColor = [UIColor blackColor];
    @autoreleasepool {
        UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width+20, self.view.frame.size.height+20)];
        background.image = [UIImage imageNamed:@"BottomBackground"];
        background.contentMode = UIViewContentModeCenter;
        background.backgroundColor = [UIColor clearColor];
        // Paralax
        UIInterpolatingMotionEffect *xTilt = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        xTilt.minimumRelativeValue = [NSNumber numberWithFloat: -10];
        xTilt.maximumRelativeValue = [NSNumber numberWithFloat: 10];
        
        UIInterpolatingMotionEffect *yTilt = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        yTilt.minimumRelativeValue = [NSNumber numberWithFloat: -10];
        yTilt.maximumRelativeValue = [NSNumber numberWithFloat: 10];
        
        UIMotionEffectGroup *group = [[UIMotionEffectGroup alloc] init];
        group.motionEffects = @[xTilt, yTilt];
        [background addMotionEffect:group];
        
        [self.view addSubview:background];
    }
    @autoreleasepool {
        UIImageView *background = [[UIImageView alloc] initWithFrame:self.view.frame];
        background.image = [UIImage imageNamed:@"MiddleBackground"];
        background.contentMode = UIViewContentModeCenter;
        background.backgroundColor = [UIColor clearColor];
        [self.view addSubview:background];
    }
    @autoreleasepool {
        UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width+10, self.view.frame.size.height+10)];
        background.image = [UIImage imageNamed:@"TopBackground"];
        background.contentMode = UIViewContentModeCenter;
        background.backgroundColor = [UIColor clearColor];
        // Paralax
        UIInterpolatingMotionEffect *xTilt = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        xTilt.minimumRelativeValue = [NSNumber numberWithFloat: -5];
        xTilt.maximumRelativeValue = [NSNumber numberWithFloat: 5];
        
        UIInterpolatingMotionEffect *yTilt = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        yTilt.minimumRelativeValue = [NSNumber numberWithFloat: -5];
        yTilt.maximumRelativeValue = [NSNumber numberWithFloat: 5];
        
        UIMotionEffectGroup *group = [[UIMotionEffectGroup alloc] init];
        group.motionEffects = @[xTilt, yTilt];
        [background addMotionEffect:group];
        
        [self.view addSubview:background];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end