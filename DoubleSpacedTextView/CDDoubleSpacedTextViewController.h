//
//  CDDoubleSpacedTextViewController.h
//  DoubleSpacedInput
//
//  Created by Chris Downie on 10/17/13.
//  Copyright (c) 2013 Chris Downie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDDoubleSpacedTextViewController : UIViewController <UITextViewDelegate>

@property UITextView *textView;
@property CGFloat lineSpaceMultiple;

@end
