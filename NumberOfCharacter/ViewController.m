//
//  ViewController.m
//  NumberOfCharacter
//
//  Created by Singh, Vikaskumar on 2/19/18.
//  Copyright © 2018 Singh, Vikaskumar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    NSString *string = @"vikassingh";
    for (NSUInteger i =0; i< string.length; i++) {
        char c = [string characterAtIndex:i];
        NSString *key = [NSString stringWithFormat:@"%c",c];
        if ([dict objectForKey:key] == nil) {
            [dict setObject:[NSNumber numberWithInteger:1] forKey:key];
        }
        else{
            NSInteger num = [[NSNumber numberWithInteger:1] integerValue];
            [dict setObject:[NSNumber numberWithInteger:++num] forKey:key];
        }
    }
    NSLog(@"%@",dict);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    UIView *view = (UIView *)[cell.contentView viewWithTag:1000];
    UILabel *textLabel = (UILabel *)[cell.contentView viewWithTag:1001];
    if (indexPath.row % 5 == 0) {
        CGRect frame = view.frame;
        frame.size.height = 50;
        view.frame = frame;
        
        CGRect frame1 = textLabel.frame;
        frame1.origin.y = view.frame.origin.y + view.frame.size.height;
        textLabel.frame = frame1;
        textLabel.text =  [NSString stringWithFormat:@"%ld",indexPath.row];
    }
    else{
        CGRect frame = view.frame;
        frame.size.height = 25;
        view.frame = frame;
        CGRect frame1 = textLabel.frame;
        frame1.origin.y = view.frame.origin.y + view.frame.size.height;
        textLabel.frame = frame1;
        textLabel.text =  [NSString stringWithFormat:@"%ld",indexPath.row % 5];
    }

    
    return cell;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    CGRect visibleRect = (CGRect){.origin = self.collectionView.contentOffset, .size = self.collectionView.bounds.size};
    CGPoint visiblePoint = CGPointMake(CGRectGetMidX(visibleRect), CGRectGetMidY(visibleRect));
    NSIndexPath *visibleIndexPath = [self.collectionView indexPathForItemAtPoint:visiblePoint];
    NSLog(@"%@",visibleIndexPath);
}


@end
