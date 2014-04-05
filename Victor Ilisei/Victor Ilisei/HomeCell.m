//
//  HomeCell.m
//  Victor Ilisei
//
//  Created by Victor Ilisei on 4/4/14.
//  Copyright (c) 2014 Tech Genius. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIInterpolatingMotionEffect *xTilt = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        xTilt.minimumRelativeValue = [NSNumber numberWithFloat: -10];
        xTilt.maximumRelativeValue = [NSNumber numberWithFloat: 10];
        
        UIInterpolatingMotionEffect *yTilt = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        yTilt.minimumRelativeValue = [NSNumber numberWithFloat: -10];
        yTilt.maximumRelativeValue = [NSNumber numberWithFloat: 10];
        
        UIMotionEffectGroup *group = [[UIMotionEffectGroup alloc] init];
        group.motionEffects = @[xTilt, yTilt];
        [self addMotionEffect:group];
    }
    return self;
}

- (void)setSelectable:(BOOL)selectable {
    self.canBeSelected = selectable;
    
    [self colorize];
}

- (void)colorize {
    if (self.canBeSelected) {
        self.contentView.backgroundColor = [UIColor colorWithRed:arc4random() % 11 * 0.1 green:arc4random() % 11 * 0.1 blue:arc4random() % 11 * 0.1 alpha:1.0f];
    } else {
        self.contentView.backgroundColor = [UIColor blackColor];
    }
}

- (void)highlightCell {
    if (self.highlight == nil) {
        self.highlight = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        self.highlight.backgroundColor = [UIColor lightTextColor];
    }
    [self addSubview:self.highlight];
}

- (void)unHighlightCell {
    [self.highlight removeFromSuperview];
    self.highlight = nil;
}

@end