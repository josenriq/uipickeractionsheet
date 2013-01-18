//
// UIPickerActionSheet.h
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

#import <Foundation/Foundation.h>

@protocol UIPickerActionSheetDelegate;

@interface UIPickerActionSheet : NSObject<UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, assign) id<UIPickerActionSheetDelegate> delegate;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIActionSheet *sheet;
@property (nonatomic, strong) UIPickerView *picker;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) id selectedItem;

- (id)initForView:(UIView*)aView;
- (void)show:(NSArray*)aItems;

@end

@protocol UIPickerActionSheetDelegate <NSObject>
@optional
- (void)pickerActionSheet:(UIPickerActionSheet*)aPickerActionSheet didSelectItem:(id)aItem;
- (void)pickerActionSheetDidCancel:(UIPickerActionSheet*)aPickerActionSheet;
@end