//
//  PrescriptionViewController.m
//  HOM
//
//  Created by AppsbeeTechnology on 29/09/16.
//  Copyright © 2016 Sourav. All rights reserved.
//

#import "PrescriptionViewController.h"
#import "PrescriptionCollectionViewCell.h"
@interface PrescriptionViewController ()
{
    IBOutlet UICollectionView *colPrescription;
}
@end

@implementation PrescriptionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

#pragma mark
#pragma mark collection view delegate
#pragma mark

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;
{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *identifier = @"Cell";
    
    [collectionView registerClass:[PrescriptionCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    //here we load xib. to our collection view
    [collectionView registerNib:[UINib nibWithNibName:@"PrescriptionCollectionViewCell" bundle:[NSBundle mainBundle]]  forCellWithReuseIdentifier:identifier];
    PrescriptionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    return cell;
}

#pragma mark Collection view layout things
// Layout: Set cell size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"SETTING SIZE FOR ITEM AT INDEX %ld", (long)indexPath.row);
    CGSize mElementSize = CGSizeMake(85, 85);
    return mElementSize;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 2.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 2.0;
}

- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0,0,0,0);  // top, left, bottom, right
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
