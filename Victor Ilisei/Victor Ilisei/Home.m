//
//  Home.m
//  Victor Ilisei
//
//  Created by Victor Ilisei on 4/4/14.
//  Copyright (c) 2014 Tech Genius. All rights reserved.
//

#import "Home.h"

@interface Home ()

@end

@implementation Home

- (id)initWithCollectionViewLayout:(UICollectionViewLayout *)layout {
    UICollectionViewFlowLayout *newlayout = (UICollectionViewFlowLayout *)layout;
    self = [super initWithCollectionViewLayout:newlayout];
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
    // Do any additional setup after loading the view.
}

@end