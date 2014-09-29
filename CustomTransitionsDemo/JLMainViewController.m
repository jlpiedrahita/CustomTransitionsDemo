//
//  ViewController.m
//  CustomTransitionsDemo
//
//  Created by Jose Luis Piedrahita on 15/09/14.
//  Copyright (c) 2014 Parallel Mobile. All rights reserved.
//

#import "JLMainViewController.h"
#import "JLBaseTransitionAnimator.h"
#import "JLDropTransitionAnimator.h"
#import "JLZoomTransitionAnimator.h"
#import "JLSpringTransitionAnimator.h"
#import "JLDatePickerViewController.h"

@interface JLMainViewController () <UIViewControllerTransitioningDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *transitionTypeSegmentedControl;
@property (weak, nonatomic) IBOutlet UIButton *dateButton;
@property (strong, nonatomic) NSDateFormatter *selectedDateFormatter;
@end

@implementation JLMainViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _selectedDateFormatter = [[NSDateFormatter alloc] init];
        _selectedDateFormatter.dateStyle = NSDateFormatterMediumStyle;
    }
    return self;
}

#pragma mark - IBAction

- (IBAction)show:(id)sender
{
    JLDatePickerViewController *datePickerViewController = [JLDatePickerViewController new];
    datePickerViewController.transitioningDelegate = self;
    datePickerViewController.didSelectDateBlock = ^(NSDate* selectedDate){
        NSString *selectedDateString = [self.selectedDateFormatter stringFromDate:selectedDate];
        [self.dateButton setTitle:[NSString stringWithFormat:@"Selected date: %@", selectedDateString] forState:UIControlStateNormal];
    };
    [self presentViewController:datePickerViewController animated:YES completion:NULL];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    JLBaseTransitionAnimator *transitionAnimator = [self transitionAnimatorForSelectedType];
    transitionAnimator.presenting = YES;
    return transitionAnimator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [self transitionAnimatorForSelectedType];
}

-(JLBaseTransitionAnimator*) transitionAnimatorForSelectedType
{
    switch (self.transitionTypeSegmentedControl.selectedSegmentIndex) {
        case 0:
            return [JLSpringTransitionAnimator new];
        case 1:
            return [JLZoomTransitionAnimator new];
        case 2:
            return [JLDropTransitionAnimator new];
        default:
            return nil;
    }
}

@end
