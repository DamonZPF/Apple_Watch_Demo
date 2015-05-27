//
//  CityInterfaceController.m
//  WTDemo
//
//  Created by Duomai on 15/5/27.
//  Copyright (c) 2015年 zpf. All rights reserved.
//

#import "CityInterfaceController.h"
#import "CityRowCell.h"
#import "Sigleton.h"
@interface CityInterfaceController ()
@property (weak, nonatomic) IBOutlet WKInterfaceTable *tableView;
@property(nonatomic,strong)NSArray * data;
@end

@implementation CityInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    NSArray * citys = @[@"北京",@"上海",@"深圳",@"杭州"];
    self.data = citys;
    [self.tableView setNumberOfRows:citys.count withRowType:@"CellRowType"];
    
    for (int index = 0 ; index < self.data.count; index++) {
        CityRowCell * cell = [self.tableView rowControllerAtIndex:index];
        [cell.city  setText: self.data[index]];
    }
}

-(void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex{
    NSString * city = self.data[rowIndex];
    [Sigleton shareData].city = city;
    [WKInterfaceController reloadRootControllersWithNames:@[@"weather",@"City"] contexts:nil];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



