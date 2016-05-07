//
//  ViewController2.m
//  Drawing2
//
//  Created by Admin on 30.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController.h"
@implementation ViewController2
- (void)viewDidLoad {
    [super viewDidLoad];
    _opacity =0.5;
    _red =0;
    _green=0;
    _blue =0;
    [self.labelBrush setText:[NSString stringWithFormat:@"%.1f", _brush]];
    [self.labelOp setText:[NSString stringWithFormat:@"%.1f", _opacity]];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)sliderBru:(id)sender {
    _brush = (CGFloat)_sliderBrush.value;
    
    [self.labelBrush setText:[NSString stringWithFormat:@"%.1f", _brush]];
    
    //[self drawPreview];
}
- (IBAction)sliderOpa:(id)sender {
    _opacity = (CGFloat)_sliderOp.value;
    
    [self.labelOp setText:[NSString stringWithFormat:@"%.1f", _opacity]];
}
- (IBAction)ToMain:(id)sender {
    
   [self performSegueWithIdentifier:@"ToMain" sender:self];
    
    [self.delegate setBrush:self enteringItem:(_brush)];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
