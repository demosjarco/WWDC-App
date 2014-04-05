//
//  AppDelegate.h
//  Victor Ilisei
//
//  Created by Victor Ilisei on 4/4/14.
//  Copyright (c) 2014 Tech Genius. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Home.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) Home *homeController;

@end