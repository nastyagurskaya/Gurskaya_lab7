//
//  ViewController.m
//  Drawing2
//
//  Created by Admin on 30.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//
#import "ViewController.h"
#import "ViewController2.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *canvas;
@property CGPoint lastPoint;
@property (weak, nonatomic) IBOutlet UISlider *sliderOp;
@property (weak, nonatomic) IBOutlet UISlider *sliderBrush;
@property  CGFloat brush;
@property (weak, nonatomic) IBOutlet UILabel *labelOp;
@property (weak, nonatomic) IBOutlet UILabel *labelBrush;
@property  CGFloat opacity;
@property  CGFloat red;
@property (weak, nonatomic) IBOutlet UISlider *slidGreen;
@property  CGFloat green;
@property (weak, nonatomic) IBOutlet UISlider *slidRed;
@property (weak, nonatomic) IBOutlet UISlider *slidBlue;
@property  CGFloat blue;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _opacity =0.5;
    _brush =25;
    _red=0.0;
    _green=0.0;
    [self.labelBrush setText:[NSString stringWithFormat:@"%.1f", _brush]];
    [self.labelOp setText:[NSString stringWithFormat:@"%.1f", _opacity]];
}
- (IBAction)clear:(id)sender {
    _canvas.image = nil;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    UITouch *touch = [touches anyObject];
    [self setLastPoint:[touch locationInView:self.view]];
    
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
    UIGraphicsBeginImageContext(self.view.frame.size);
    CGRect drawRect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width,
                                 self.view.frame.size.height);
    [[[self canvas] image] drawInRect:drawRect];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), _brush);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(),_red,_green,_blue, _opacity);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), _lastPoint.x,_lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x,currentPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    [[self canvas] setImage:UIGraphicsGetImageFromCurrentImageContext()];
    UIGraphicsEndImageContext();
    _lastPoint = currentPoint;
    
}
- (IBAction)save:(id)sender {
    UIGraphicsBeginImageContext(self.view.frame.size);
     [[self canvas] setImage:UIGraphicsGetImageFromCurrentImageContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Now I use the "screenshot"
    NSString *path = [NSHomeDirectory() stringByAppendingString:@"/1.jpg"];
    if ([UIImageJPEGRepresentation(image, 1) writeToFile:path atomically:YES]) {
        NSLog(@"save ok");
    }
    else {
        NSLog(@"save failed");
    }
}
- (IBAction)sliderOpa:(id)sender {
    _opacity = (CGFloat)_sliderOp.value;
    
    [self.labelOp setText:[NSString stringWithFormat:@"%.1f", _opacity]];

}
- (IBAction)sliderBru:(id)sender {
    _brush = (CGFloat)_sliderBrush.value;
    
    [self.labelBrush setText:[NSString stringWithFormat:@"%.1f", _brush]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)slidRed:(id)sender {
    _red = (CGFloat)(_slidRed.value/255);
}
- (IBAction)slidGreen:(id)sender {
    _green = (CGFloat)(_slidGreen.value/255);
}
- (IBAction)slidBlue:(id)sender {
    _blue = (CGFloat)(_slidBlue.value/255);

}
@end
