//
//  HintView.m
//  Slate
//
//  Created by Jigish Patel on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HintView.h"
#import "Constants.h"
#import "NSColor+Conversions.h"
#import "SlateConfig.h"

@implementation HintView

@synthesize text;

- (id)initWithFrame:(NSRect)frame {
  self = [super initWithFrame:frame];
  if (self) [self setWantsLayer:YES];
  return self;
}

- (void)drawCenteredText:(NSString *)string bounds:(NSRect)rect attributes:(NSDictionary *)attributes {
  NSSize size = [string sizeWithAttributes:attributes];
  NSPoint origin = NSMakePoint(rect.origin.x + (rect.size.width - size.width) / 2,
                               rect.origin.y + (rect.size.height - size.height) / 2);
  [string drawAtPoint:origin withAttributes:attributes];
}

- (void)drawRect:(NSRect)dirtyRect {
  NSArray *bgColorArr = [[SlateConfig getInstance] getArrayConfig:WINDOW_HINTS_BACKGROUND_COLOR];
  NSArray *fColorArr = [[SlateConfig getInstance] getArrayConfig:WINDOW_HINTS_FONT_COLOR];
  if ([bgColorArr count] < 4) bgColorArr = [WINDOW_HINTS_BACKGROUND_COLOR_DEFAULT componentsSeparatedByString:COMMA];
  if ([fColorArr count] < 4) fColorArr = [WINDOW_HINTS_FONT_COLOR_DEFAULT componentsSeparatedByString:COMMA];
  NSColor *backgroundColor = [NSColor colorWithCalibratedRed:[[bgColorArr objectAtIndex:0] floatValue]/255.0
                                                       green:[[bgColorArr objectAtIndex:1] floatValue]/255.0
                                                        blue:[[bgColorArr objectAtIndex:2] floatValue]/255.0
                                                       alpha:[[bgColorArr objectAtIndex:3] floatValue]];
  NSColor *fontColor = [NSColor colorWithCalibratedRed:[[fColorArr objectAtIndex:0] floatValue]/255.0
                                                 green:[[fColorArr objectAtIndex:1] floatValue]/255.0
                                                  blue:[[fColorArr objectAtIndex:2] floatValue]/255.0
                                                 alpha:[[fColorArr objectAtIndex:3] floatValue]];
  [backgroundColor set];
  NSRect backgoundRect = NSMakeRect(self.bounds.origin.x + HINT_CORNER_RADIUS,
                                    self.bounds.origin.y + HINT_CORNER_RADIUS,
                                    self.bounds.size.width - 2 * HINT_CORNER_RADIUS,
                                    self.bounds.size.height - 2 * HINT_CORNER_RADIUS);
  [NSBezierPath fillRect:backgoundRect];
  [[self layer] setBackgroundColor:[backgroundColor cgColor]];
  [[self layer] setBorderColor:[backgroundColor cgColor]];
  [[self layer] setCornerRadius:HINT_CORNER_RADIUS];
  [[self layer] setBorderWidth:HINT_CORNER_RADIUS];
  [self drawCenteredText:text
                  bounds:self.bounds
              attributes:[NSDictionary dictionaryWithObjectsAndKeys:[NSFont fontWithName:[[SlateConfig getInstance] getConfig:WINDOW_HINTS_FONT_NAME]
                                                                                    size:[[SlateConfig getInstance] getFloatConfig:WINDOW_HINTS_FONT_SIZE]],
                                                                    NSFontAttributeName,
                                                                    fontColor,
                                                                    NSForegroundColorAttributeName, nil]];
}

@end
