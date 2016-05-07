//
//  ViewController2.h
//  Drawing2
//
//  Created by Admin on 30.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"
@class ViewController2;
@protocol ViewController2Delegate <NSObject>
- (void)setBrush:(ViewController2 *)controller enteringItem:(CGFloat )brush;
@end
@interface ViewController2 : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *labelBrush;
@property  CGFloat brush;
@property  CGFloat opacity;
@property  CGFloat red;
@property  CGFloat green;
@property  CGFloat blue;;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewBrush;
@property (weak, nonatomic) IBOutlet UISlider *sliderBrush;
@property (weak, nonatomic) IBOutlet UISlider *sliderOp;
@property (weak, nonatomic) IBOutlet UILabel *labelOp;
@property (nonatomic, weak) id delegate;
@end
