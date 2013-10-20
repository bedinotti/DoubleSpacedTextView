//
//  CDDoubleSpacedTextViewController.m
//  DoubleSpacedInput
//
//  Created by Chris Downie on 10/17/13.
//  Copyright (c) 2013 Chris Downie. All rights reserved.
//

#import "CDDoubleSpacedTextViewController.h"


@implementation CDDoubleSpacedTextViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _lineSpaceMultiple = 2;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    CGFloat statusBarHeight = 20;
    CGRect textViewRect = CGRectMake(CGRectGetMinX(self.view.bounds),
                                     CGRectGetMinY(self.view.bounds) + statusBarHeight,
                                     CGRectGetWidth(self.view.bounds),
                                     CGRectGetHeight(self.view.bounds) - statusBarHeight);

    UITextView *doubleSpacedTextView = [[UITextView alloc] initWithFrame:textViewRect];
    doubleSpacedTextView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    doubleSpacedTextView.backgroundColor = [UIColor clearColor];
    doubleSpacedTextView.delegate = self;
    doubleSpacedTextView.font = [UIFont fontWithName:@"Courier" size:[UIFont preferredFontForTextStyle:UIFontTextStyleBody].pointSize];;
    [self.view addSubview:doubleSpacedTextView];
    self.textView = doubleSpacedTextView;
}

- (void)textViewDidChange:(UITextView *)textView
{
    [self regenerateSpacing];
}

#pragma mark - Regenerate Layout
- (void)regenerateSpacing
{
    [self regenerateSpacingForTextView:self.textView];
}

- (void)regenerateSpacingForTextView:(UITextView *)textView
{
    CGFloat fontHeight = textView.font.lineHeight;
    __block CGFloat topOffset = 0;
    
    NSRange lineGlyphRange = [textView.layoutManager glyphRangeForTextContainer:textView.textContainer];
    
    [textView.layoutManager enumerateLineFragmentsForGlyphRange:lineGlyphRange usingBlock:^(CGRect rect, CGRect usedRect, NSTextContainer *textContainer, NSRange glyphRange, BOOL *stop) {
        CGRect adjustedRect = rect;
        CGRect adjustedUsedRect = usedRect;
        adjustedRect.origin.y = topOffset;
        adjustedUsedRect.origin.y = topOffset;
        
        [textView.layoutManager setLineFragmentRect:adjustedRect forGlyphRange:glyphRange usedRect:adjustedUsedRect];
        
        topOffset += self.lineSpaceMultiple * fontHeight;
    }];
    
    CGRect adjustedExtraLineFragmentRect = textView.layoutManager.extraLineFragmentRect;
    CGRect adjustedExtraLineFragmentUsedRect = textView.layoutManager.extraLineFragmentUsedRect;
    adjustedExtraLineFragmentRect.origin.y = topOffset;
    adjustedExtraLineFragmentUsedRect.origin.y = topOffset;
    [textView.layoutManager setExtraLineFragmentRect:adjustedExtraLineFragmentRect usedRect:adjustedExtraLineFragmentUsedRect textContainer:textView.textContainer];
}


@end
