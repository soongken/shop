//
//  List.h
//  shop
//
//  Created by lanou on 16/1/23.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface List : NSObject


@property (nonatomic,strong) NSString *category_name;
@property (nonatomic,strong) NSMutableArray *subcategories;

@end
