//
//  CustomViewController.h
//  CustomTransitionsDemo
//
//  Created by Jose Luis Piedrahita on 15/09/14.
//  Copyright (c) 2014 Parallel Mobile. All rights reserved.
//

@import UIKit;

@interface JLDatePickerViewController : UIViewController

@property (strong, readonly, nonatomic) NSDate *minimumDate;
@property (strong, readonly, nonatomic) NSDate *maximumDate;
@property (copy, nonatomic) void (^didSelectDateBlock)(NSDate* selectedDate);
@property (copy, nonatomic) void (^didCancelSelectionBlock)(void);

- (instancetype)initWithMinimumDate:(NSDate*) minimumDate maximumDate:(NSDate*) maximumDate;

@end
