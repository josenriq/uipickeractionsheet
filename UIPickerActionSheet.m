//
// UIPickerActionSheet.m
// Version 0.1
//
// This code is distributed under the terms and conditions of the MIT license.
//
// Copyright (c) 2013 José Enrique Bolaños Gudiño
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import "UIPickerActionSheet.h"

@interface UIPickerActionSheet ()

- (void)initSheetWithWidth:(CGFloat)aWidth;

@end

@implementation UIPickerActionSheet

- (id)initForView:(UIView*)aView
{
    if (self = [super init])
    {
        self.containerView = aView;
        [self initSheetWithWidth:aView.bounds.size.width];
    }
    return self;
}

- (void)initSheetWithWidth:(CGFloat)aWidth
{
    UIActionSheet *sheet = [[UIActionSheet alloc] init];
    
    UIToolbar *toolbar = [[UIToolbar alloc]
                          initWithFrame:CGRectMake(0, 0, aWidth, 0)];
    toolbar.barStyle = UIBarStyleBlackOpaque;
    [toolbar sizeToFit];
    
    [toolbar setItems:@[
     [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(pickerSheetCancel)],
     [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
     [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerSheetDone)]
     ]];
    
    UIPickerView *picker = [[UIPickerView alloc]
                            initWithFrame:CGRectMake(0, toolbar.bounds.size.height, aWidth, 0)];
    picker.showsSelectionIndicator = YES;
    picker.delegate = self;
    
    [sheet addSubview:toolbar];
    [sheet addSubview:picker];
    
    self.sheet = sheet;
    self.picker = picker;
}

- (void)show:(NSArray*)aItems
{
    self.items = aItems;
    
    // Do not show if items are invalid...
    if (!self.items || self.items.count <= 0)
        return;
    
    [self.sheet showInView:self.containerView];
    
    // XXX: Kinda hacky, but seems to be the only way to make it display correctly.
    [self.sheet
     setBounds:CGRectMake(0, 0,
                          self.containerView.frame.size.width,
                          self.sheet.frame.size.height + 478.0)];
    
    // Reload and select first item
    [self.picker reloadComponent:0];
    [self.picker selectRow:0 inComponent:0 animated:NO];
    [self.picker.delegate pickerView:self.picker didSelectRow:0 inComponent:0];
}

- (int)numberOfComponentsInPickerView:(UIPickerView*)aPickerView
{
    return 1;
}

- (int)pickerView:(UIPickerView*)aPickerView numberOfRowsInComponent:(NSInteger)aComponent
{
    return self.items.count;
}

- (NSString*)pickerView:(UIPickerView*)aPickerView titleForRow:(NSInteger)aRow forComponent:(NSInteger)aComponent
{
    id item = [self.items objectAtIndex:aRow];
    return [item description];
}

- (void)pickerView:(UIPickerView*)aPickerView didSelectRow:(NSInteger)aRow inComponent:(NSInteger)aComponent
{
    self.selectedItem = [self.items objectAtIndex:aRow];
}

- (void)pickerSheetCancel
{
    [self.sheet dismissWithClickedButtonIndex:0 animated:YES];
    if (self.delegate && [self.delegate respondsToSelector:@selector(pickerActionSheetDidCancel:)])
        [self.delegate pickerActionSheetDidCancel:self];
}

- (void)pickerSheetDone
{
    [self.sheet dismissWithClickedButtonIndex:0 animated:YES];
    if (self.delegate && [self.delegate respondsToSelector:@selector(pickerActionSheet:didSelectItem:)])
        [self.delegate pickerActionSheet:self didSelectItem:self.selectedItem];
}

@end
