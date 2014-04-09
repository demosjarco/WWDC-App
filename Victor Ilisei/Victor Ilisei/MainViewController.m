//
//  MainViewController.m
//  Victor Ilisei
//
//  Created by Victor Ilisei on 4/6/14.
//  Copyright (c) 2014 Tech Genius. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewWillAppear:(BOOL)animated {
    self.view.backgroundColor = self.backgroundColor;
}

- (void)viewDidAppear:(BOOL)animated {
    // Animate gradient
    [self.view.layer addSublayer:[self drawBackgroundGradient:animated with:self.backgroundColor]];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    if ([self needsLightStatusBar]) {
        return UIStatusBarStyleLightContent;
    } else {
        return UIStatusBarStyleDefault;
    }
}

- (UIColor *)lighterColorFor:(UIColor *)baseColor {
    @autoreleasepool {
        CGFloat h, s, b, a;
        [baseColor getHue:&h saturation:&s brightness:&b alpha:&a];
        return [UIColor colorWithHue:h saturation:s brightness:MIN(b * (4/3.0f), 1.0f) alpha:a];
    }
}

- (UIColor *)updateStatusBarForLighterColorWith:(UIColor *)baseColor {
    @autoreleasepool {
        UIColor *lighterColor = [self lighterColorFor:baseColor];
        CGFloat r, g, b, a;
        [lighterColor getRed:&r green:&g blue:&b alpha:&a];
        if (r > 0.6*(4/3) || g > 0.6*(4/3) || b > 0.6*(4/3)) {
            self.lightStatusBar = NO;
        } else {
            self.lightStatusBar = YES;
        }
        [self setNeedsStatusBarAppearanceUpdate];
        return lighterColor;
    }
}

- (UIColor *)darkerColorFor:(UIColor *)baseColor {
    @autoreleasepool {
        CGFloat h, s, b, a;
        [baseColor getHue:&h saturation:&s brightness:&b alpha:&a];
        return [UIColor colorWithHue:h saturation:s brightness:b * (2/3.0f) alpha:a];
    }
}

- (CAGradientLayer *)drawBackgroundGradient:(BOOL)animated with:(UIColor *)baseColor {
    @autoreleasepool {
        // Draw Gradient
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = self.view.bounds;
        gradient.locations = @[@0, @0.5, @1.0];
        gradient.colors = @[(id)[self updateStatusBarForLighterColorWith:baseColor].CGColor, (id)baseColor.CGColor, (id)[self darkerColorFor:baseColor].CGColor];
        // Animate gradient
        if (animated) {
            CABasicAnimation *flash = [CABasicAnimation animationWithKeyPath:@"opacity"];
            flash.fromValue = [NSNumber numberWithFloat:0.0];
            flash.toValue = [NSNumber numberWithFloat:1.0];
            flash.duration = 1.0;
            flash.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            
            [gradient addAnimation:flash forKey:@"gradientOn"];
        }
        
        return gradient;
        // Update Status Bar
        [self setNeedsStatusBarAppearanceUpdate];
    }
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    CAGradientLayer *gradient = (CAGradientLayer *)[self.view.layer.sublayers lastObject];
    CABasicAnimation *flash = [CABasicAnimation animationWithKeyPath:@"opacity"];
    flash.delegate = self;
    flash.fromValue = [NSNumber numberWithFloat:1.0];
    flash.toValue = [NSNumber numberWithFloat:0.0];
    flash.duration = duration/2;
    flash.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    [gradient addAnimation:flash forKey:@"gradientOff"];
    [gradient removeFromSuperlayer];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    CAGradientLayer *gradient = (CAGradientLayer *)[self.view.layer.sublayers lastObject];
    [gradient removeFromSuperlayer];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [self.view.layer addSublayer:[self drawBackgroundGradient:YES with:self.backgroundColor]];
}

@end