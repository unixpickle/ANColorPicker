//
//  ANColorPickerAppDelegate.h
//  ANColorPicker
//
//  Created by Alex Nichol on 11/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ANColorPickerViewController;

@interface ANColorPickerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow * window;
    ANColorPickerViewController * viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ANColorPickerViewController *viewController;

@end

