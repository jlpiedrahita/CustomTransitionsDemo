//
//  CustomViewController.m
//  CustomTransitionsDemo
//
//  Created by Jose Luis Piedrahita on 15/09/14.
//  Copyright (c) 2014 Parallel Mobile. All rights reserved.
//

#import "JLDatePickerViewController.h"
#import "JLSpringTransitionAnimator.h"
#import "JLDropTransitionAnimator.h"

@interface JLDatePickerViewController ()
@property (strong, readwrite, nonatomic) NSDate *minimumDate;
@property (strong, readwrite, nonatomic) NSDate *maximumDate;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@end

@implementation JLDatePickerViewController

- (instancetype)init
{
    return [self initWithMinimumDate:nil maximumDate:nil];
}

- (instancetype)initWithMinimumDate:(NSDate*) minimumDate maximumDate:(NSDate*) maximumDate
{
    self = [super initWithNibName:@"JLDatePickerViewController" bundle:nil];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        _maximumDate = minimumDate;
        _maximumDate = maximumDate;
    }
    return self;
}

#pragma mark - UIViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.datePicker.backgroundColor = [UIColor whiteColor];
    self.datePicker.minimumDate = self.minimumDate;
    self.datePicker.maximumDate = self.maximumDate;
}

#pragma mark - IBAction

- (IBAction)done:(id)sender
{    
    if (self.didSelectDateBlock) {
        self.didSelectDateBlock(self.datePicker.date);
        self.didSelectDateBlock = nil;
    }
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)cancel:(id)sender
{
    if (self.didCancelSelectionBlock) {
        self.didCancelSelectionBlock();
        self.didCancelSelectionBlock = nil;
    }
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
}

@end
