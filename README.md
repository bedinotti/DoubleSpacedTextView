DoubleSpacedTextView
====================

An iOS7 view controller that uses Text Kit to make a double-spaced input text field.

Motivation
----------
I was learning TextKit and found it *incredibly hard* to create a double-spaced text 
field that looked good for inputting text. The simplest implementation is to use
NSLayoutManagerDelegate's -layoutManager:lineSpacingAfterGlyphAtIndex:withProposedLineFragmentRect: 
method, but then the input caret and highlight regions are too tall. 

After a week of fiddling with it, this was the solution I landed on. I figured it might
be useful to others, or they might see something clever that I don't and help me make this better.


How It Works
------------
Whenever new text appears in the text field, the DoubleSpacedTextViewController loops
over all the line fragments and moves them down to the appropriate location. Simple as that.


Things To Improve
-----------------
* *Performance* - There's a huge opportunity to improve perf. Most times, a single keystroke won't
  add or remove a line fragment, so it's doing all this extra computation for the sake of a simpler
  implementation.
* *TextView's Delegate* - Because I rely on the UITextView's -textViewDidChange delegate call, the
  delegate needs to stay attached to the controller. If there's another mechanism I could use to 
  re-layout the line fragments, then I wouldn't have this constraint.
* *Anything else* - If there's something I haven't thought of, I'd love to hear it.

