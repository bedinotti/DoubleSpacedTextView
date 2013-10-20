//
//  CDDoubleSpacedTextViewController_Private.h
//  DoubleSpacedTextView
//
//  Created by Chris Downie on 10/19/13.
//  Copyright (c) 2013 Chris Downie. All rights reserved.
//

#import "CDDoubleSpacedTextViewController.h"

@interface CDDoubleSpacedTextViewController (Private)

- (void)regenerateSpacing;
- (void)regenerateSpacingForTextView:(UITextView *)textView;

@end
