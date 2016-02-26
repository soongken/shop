//
//  DetailViewController.h
//  shop
//
//  Created by lanou on 16/1/23.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^myBlock)(NSString *);
@interface DetailViewController : UIViewController

@property (nonatomic,copy) myBlock block;


@end
