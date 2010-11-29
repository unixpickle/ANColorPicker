//
//  ANColorPicker.m
//  ANColorPicker
//
//  Created by Alex Nichol on 11/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ANColorPicker.h"


@implementation ANColorPicker

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame {
    frame.size.width = 231;
	frame.size.height = 190;
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		
		self.backgroundColor = [UIColor clearColor];
		brightness = [[UIImage imageNamed:@"brightness.png"] retain];
		wheel = [[UIImage imageNamed:@"wheel.png"] retain];
		colorFrame.origin.x = self.frame.size.width - (brightness.size.width / 2.0);
		colorFrame.origin.y = 0;
		colorFrame.size.width = brightness.size.width / 2.0;
		colorFrame.size.height = brightness.size.height / 2.0;
		circleFrame.origin.x = 0;
		circleFrame.origin.y = (self.frame.size.height - (wheel.size.height / 2)) / 2.0;
		circleFrame.size.width = wheel.size.width / 2.0;
		circleFrame.size.height = wheel.size.height / 2.0;
		wheelAdjusted = [[wheel imageBitmapRep] retain];
		selectedPoint.x = circleFrame.size.width;
		selectedPoint.y = circleFrame.size.height;
    }
    return self;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	CGPoint p = [[touches anyObject] locationInView:self];
	if (CGRectContainsPoint(colorFrame, p)) {
		CGPoint colorP = p;
		colorP.x -= colorFrame.origin.x;
		colorP.y -= colorFrame.origin.y;
		[wheelAdjusted release];
		ANImageBitmapRep * newImage = [[wheel imageBitmapRep] retain];
		brightnessPCT = colorFrame.size.height - colorP.y;
		brightnessPCT /= colorFrame.size.height;
		[newImage setBrightness:brightnessPCT];
		wheelAdjusted = newImage;
		
		CGFloat color[4];
		[wheelAdjusted getPixel:color atX:selectedPoint.x y:selectedPoint.y];
		NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
		if (color[3] > 0.5) {
			color[3] = 1;
			UIColor * newColor = [UIColor colorWithRed:color[0]
												 green:color[1] 
												  blue:color[2] alpha:color[3]];
			[delegate colorChanged:newColor];
		}
		[pool drain];
		
		[self setNeedsDisplay];
	} else if (CGRectContainsPoint(circleFrame, p)) {
		CGPoint colorP = p;
		colorP.x -= circleFrame.origin.x;
		colorP.y -= circleFrame.origin.y;
		colorP.x *= 2;
		colorP.y *= 2;
		
		
		CGFloat color[4];
		[wheelAdjusted getPixel:color atX:colorP.x y:colorP.y];
		NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
		if (color[3] > 0.5) {
			color[3] = 1;
			selectedPoint.x = colorP.x;
			selectedPoint.y = colorP.y;
			UIColor * newColor = [UIColor colorWithRed:color[0]
											 green:color[1] 
											  blue:color[2] alpha:color[3]];
			[delegate colorChanged:newColor];
		}
		[pool drain];
	}
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
	[brightness drawInRect:colorFrame];
	[wheelAdjusted drawInRect:circleFrame];
}


- (void)dealloc {
	[wheel release];
	[brightness release];
	[wheelAdjusted release];
    [super dealloc];
}


@end
