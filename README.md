UIPickerActionSheet
===
---

UIPickerActionSheet is a class that displays (you guessed it) a UIPickerView inside a UIActionSheet. It can be used as a single selection widget for users to select one value. It includes a "Cancel" and a "Done" button, Safari-style.

![](http://i.imgur.com/BVnJ8.png)

---
Requirements
===

For now, UIActionPickerSheet is compatible with iOS ARC projects. No specific frameworks are required other than UIKit.

---
Adding UIPickerActionSheet to your project
===

Simply add the source files inside your project,  `UIPickerActionSheet.h` and `UIPickerActionSheet.m`. Then include the class where needed using `#import "UIPickerActionSheet.h"`.

---
Usage
===
Inside your view controller, you would instantiate your UIPickerActionSheet passing the view which will contain it, set itself as its delegate, and then call `show:` passing an `NSArray` of items to be displayed. If you pass an array of custom objects, simply override the `description` method of those custom objects and return an appropriate label. Example:

```objective-c
self.pickerActionSheet = [[UIPickerActionSheet alloc] initForView:self.view];
self.pickerActionSheet.delegate = self;

NSArray *items = @[@"Apple", @"Orange", @"Pear"];
[self.pickerActionSheet show:items];
```

Then, implement a couple of delegate methods: `pickerActionSheetDidCancel:` and `pickerActionSheet:didSelectItem:`. No need to dismiss the action sheet; it will be dismissed automatically. Example:

```objective-c
- (void)pickerActionSheetDidCancel:(UIPickerActionSheet*)aPickerActionSheet
{
    // User cancelled
}

- (void)pickerActionSheet:(UIPickerActionSheet*)aPickerActionSheet didSelectItem:(id)aItem
{
    // User selected aItem
}
```

**NOTE:** For now, keep a strong reference of the picker action sheet, otherwise you'll get an invalid reference crash. I'll fix this later :)

---
To-do's
===

- For now it's tested only on iPhone/iPod in portrait mode. Make sure it works in landscape mode.
- Avoid having to keep a strong reference of the UIPickerActionSheet.
- Support multiple components in the picker.
- Support date pickers.

---
License
===

This code is distributed under the terms and conditions of the MIT license. 

---
Change-log
===

**Version 0.1** @ 2013.01.17

- First version. Tested only on Portrait mode.