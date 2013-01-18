//
//  ViewController.m
//  UIPickerActionSheetExample
//
//  Created by Jose Enrique on 1/17/13.
//  Copyright (c) 2013 Jose E. Bolanos. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.pickerActionSheet = [[UIPickerActionSheet alloc] initForView:self.view];
    self.pickerActionSheet.delegate = self;
}

- (IBAction)selectFruit:(id)aSender
{
    [self.pickerActionSheet show:@[@"Apple", @"Orange", @"Pear", @"Pineapple", @"Mango"]];
}

- (void)pickerActionSheetDidCancel:(UIPickerActionSheet*)aPickerActionSheet
{
    self.lblResult.text = @"You cancelled";
}

- (void)pickerActionSheet:(UIPickerActionSheet*)aPickerActionSheet didSelectItem:(id)aItem
{
    self.lblResult.text = [NSString stringWithFormat:@"You selected: %@", aItem];
}

@end
