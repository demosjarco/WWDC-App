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
    CGFloat cellHeight = 232;
    // 16:10 aspect ratio
    newlayout.itemSize = CGSizeMake(cellHeight*1.6, cellHeight);
    newlayout.sectionInset = UIEdgeInsetsMake(30, 10, 20, 10);
    newlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self = [super initWithCollectionViewLayout:newlayout];
    if (self) {
        self.collectionView.alwaysBounceHorizontal = YES;
        self.collectionView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    }
    return self;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // Update status bar
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @autoreleasepool {
        self.content = [[NSMutableArray alloc] initWithObjects:@"<#string#>", @"<#string#>", @"<#string#>", @"<#string#>", @"<#string#>", @"<#string#>", @"<#string#>", @"<#string#>", @"<#string#>", nil];
    }
    
    @autoreleasepool {
        NSMutableArray *arrayToInsert = [[NSMutableArray alloc] initWithObjects:@"Projects", @"Educational Background", @"Professional Background", @"Technical Skills", @"Interests", nil];
        while ([arrayToInsert count] > 0) {
            @autoreleasepool {
                for (int i = 0; i < [arrayToInsert count]; i++) {
                    @autoreleasepool {
                        int index = arc4random() %[self.content count];
                        if ([[self.content objectAtIndex:index] isEqualToString:@"<#string#>"]) {
                            [self.content replaceObjectAtIndex:index withObject:[arrayToInsert firstObject]];
                            [arrayToInsert removeObject:[arrayToInsert firstObject]];
                        }
                    }
                }
            }
        }
    }
}

#pragma mark - Collection view data source

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.content count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    [collectionView registerClass:[HomeCell class] forCellWithReuseIdentifier:CellIdentifier];
    HomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    // Configure the cell...
    if ([[self.content objectAtIndex:indexPath.row] isEqualToString:@"<#string#>"]) {
        [cell setSelectable:NO];
    } else {
        [cell setSelectable:YES];
    }
    
    return  cell;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell *cell = (HomeCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if (cell.isSelectable) {
        return YES;
    } else {
        return NO;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell *cell = (HomeCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell highlightCell];
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell *cell = (HomeCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell unHighlightCell];
}

@end