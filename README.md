# Deprecated

Find the more advanced project at [RSully/RSColorPicker](https://github.com/RSully/RSColorPicker). This project (ANColorPicker) uses images and requires a specific size for the color picker views, whereas RSColorPicker is dynamic in both size and generation. 

# About ANColorPicker

"Use this simple color picker to get colors that a user picks.  The color picker must be a certain size, and requires several images files in the bundles package contents.  The picker is very easy to use with code and to the user.  Enjoy :)!"

## Usage (Code samples n' stuff)

Very basic example:

    ANColorPickerViewController *colorPick = [[ANColorPickerViewController alloc] init];
	UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:colorPick];
	[self.window addSubview:nav.view];

Actual example: See ANColorPickerViewController.m (-viewDidLoad)
    
