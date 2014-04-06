//
//  MainViewController.h
//  Victor Ilisei
//
//  Created by Victor Ilisei on 4/6/14.
//  Copyright (c) 2014 Tech Genius. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface MainViewController : UIViewController

@property (nonatomic, retain) UIColor *backgroundColor;
@property (nonatomic, getter=needsLightStatusBar) BOOL lightStatusBar;

- (UIColor *)lighterColorFor:(UIColor *)baseColor;
- (UIColor *)updateStatusBarForLighterColorWith:(UIColor *)baseColor;
- (UIColor *)darkerColorFor:(UIColor *)baseColor;
- (CAGradientLayer *)drawBackgroundGradient:(BOOL)animated with:(UIColor *)baseColor;

@end