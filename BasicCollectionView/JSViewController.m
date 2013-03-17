//
//  JSViewController.m
//  BasicCollectionView
//
//  Created by James Stewart on 3/17/13.
//  Copyright (c) 2013 Stewartstuff. All rights reserved.
//

#import "JSViewController.h"

static  NSString * const kCellIdentifier = @"Cell Identifier";

@interface JSViewController ()
@property (nonatomic, copy) NSArray *colorArray;
@end

@implementation JSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCellIdentifier];
    
    const NSInteger numberOfColors = 100;
    
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:numberOfColors];
    
    for (NSInteger i=0; i < numberOfColors; ++i) {
        CGFloat redValue = (arc4random() % 255) / 255.0f;
        CGFloat greenValue = (arc4random() % 255) / 255.0f;
        CGFloat blueValue = (arc4random() % 255) / 255.0f;
        
        [tempArray addObject:[UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0f]];
    }
    
    _colorArray = [NSArray arrayWithArray:tempArray];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.colorArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = self.colorArray[indexPath.item];
    return cell;
}

@end
