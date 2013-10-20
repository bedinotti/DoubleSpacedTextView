//
//  CDDoubleSpacedTextViewController_Private.h
//  DoubleSpacedTextView
//
//  Created by Chris Downie on 10/19/13.
//  Copyright (c) 2013 Chris Downie. All rights reserved.
//
//
//  This is a private header intended for subclassing.
//

#import "CDDoubleSpacedTextViewController.h"

@interface CDDoubleSpacedTextViewController (Private)

// Called whenever the input in the text view changes. The base implementation simply calls -regenerateSpacingForTextView: with the view controller's textView. If you're doing anything where that base functionality isn't useful, override this function. Otherwise, be sure to call the super class's implementation as well as your own code.
- (void)regenerateSpacing;
// If you just want to change how the text view is layed out, then this is the override point. Note: If you just want to increase/decrease the line spacing, just use the lineSpaceMultiple property.
- (void)regenerateSpacingForTextView:(UITextView *)textView;

@end
