//
//  Sigleton.h
//  WTDemo
//
//  Created by Duomai on 15/5/27.
//  Copyright (c) 2015年 zpf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sigleton : NSObject
@property(nonatomic,copy)NSString * city;
+(Sigleton*)shareData;
@end
