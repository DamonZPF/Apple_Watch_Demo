//
//  InterfaceController.m
//  WTDemo WatchKit Extension
//
//  Created by Duomai on 15/5/27.
//  Copyright (c) 2015年 zpf. All rights reserved.
//

#import "InterfaceController.h"
#import "Sigleton.h"

@interface InterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *titleLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceGroup *imageGroup;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    if ( [[Sigleton shareData].city length]  ==0) {
        return ;
    }
    [Sigleton shareData].city = [[Sigleton shareData].city stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.map.baidu.com/telematics/v3/weather?location=\(%@)&output=json&ak=rj6BcNFtduWkOqvLi8jQBFDs",[Sigleton shareData].city]];
    NSURLRequest * requeset = [NSURLRequest requestWithURL:url];
    
    NSOperationQueue * queue = [NSOperationQueue mainQueue];
    [NSURLConnection sendAsynchronousRequest:requeset queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        id json =   [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:NULL];
        
        id info  = json[@"results"];
        NSString * city = info[0][@"currentCity"];
        NSArray *  weather_data = info[0][@"weather_data"];
        NSString *  weather = weather_data[0][@"weather"];
        NSString *  temperature = weather_data[0][@"temperature"];
       
        [self.titleLabel setText:[NSString stringWithFormat:@"%@ %@ %@",city,weather,temperature]];
        [self.imageGroup setBackgroundImageNamed:weather];
    }];

}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



