//
//  ViewController.h
//  UIPickerActionSheetExample
//
//  Created by Jose Enrique on 1/17/13.
//  Copyright (c) 2013 Jose E. Bolanos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIPickerActionSheet.h"

@interface ViewController : UIViewController<UIPickerActionSheetDelegate>

@property (nonatomic, strong) UIPickerActionSheet *pickerActionSheet;
@property (nonatomic, strong) IBOutlet UILabel *lblResult;

- (IBAction)selectFruit:(id)aSender;

@end
