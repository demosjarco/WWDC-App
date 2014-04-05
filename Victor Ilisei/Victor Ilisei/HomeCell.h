//
//  HomeCell.h
//  Victor Ilisei
//
//  Created by Victor Ilisei on 4/4/14.
//  Copyright (c) 2014 Tech Genius. All rights reserved.
//

@interface HomeCell : UICollectionViewCell

@property (nonatomic, getter=isSelectable) BOOL canBeSelected;

@property (strong, nonatomic) UIView *highlight;

- (void)setSelectable:(BOOL)selectable;

- (void)colorize;

- (void)highlightCell;
- (void)unHighlightCell;

@end