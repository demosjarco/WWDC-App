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
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Backgorund
    self.view.backgroundColor = [UIColor blackColor];
    @autoreleasepool {
        UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width+30, self.view.frame.size.height)];
        background.image = [UIImage imageNamed:@"BottomBackground"];
        background.contentMode = UIViewContentModeCenter;
        [self.view addSubview:background];
    }
    @autoreleasepool {
        UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width+30, self.view.frame.size.height)];
        background.image = [UIImage imageNamed:@"MiddleBackground"];
        background.contentMode = UIViewContentModeCenter;
        [self.view addSubview:background];
    }
    @autoreleasepool {
        UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width+30, self.view.frame.size.height)];
        background.image = [UIImage imageNamed:@"TopBackground"];
        background.contentMode = UIViewContentModeCenter;
        [self.view addSubview:background];
    }
}

@end