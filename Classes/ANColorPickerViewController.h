//
//  ANColorPickerViewController.h
//  ANColorPicker
//
//  Created by Alex Nichol on 11/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ANColorPicker.h"

@interface ANColorPickerViewController : UIViewController <ANColorPickerDelegate> {
	ANColorPicker * picker;
	UIView * colorView;
	IBOutlet UISlider * brightness;
}

- (IBAction)brightnessChange:(id)sender;

@end

