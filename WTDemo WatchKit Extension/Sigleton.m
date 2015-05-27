//
//  Sigleton.m
//  WTDemo
//
//  Created by Duomai on 15/5/27.
//  Copyright (c) 2015年 zpf. All rights reserved.
//

#import "Sigleton.h"
static Sigleton *  sigleton = nil;
@implementation Sigleton

+(Sigleton*)shareData{
    if (sigleton == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sigleton = [[self alloc]init];

        });
    }
    return sigleton;
}

@end
