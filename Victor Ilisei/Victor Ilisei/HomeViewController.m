//
//  HomeViewController.m
//  Victor Ilisei
//
//  Created by Victor Ilisei on 4/6/14.
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
        self.backgroundColor = [UIColor colorWithRed:arc4random() % 11 * 0.1 green:arc4random() % 11 * 0.1 blue:arc4random() % 11 * 0.1 alpha:1.0f];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

@end