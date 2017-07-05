//
//  ViewController.m
//  Animation1
//
//  Created by Qu ZhongLiang on 17/7/5.
//  Copyright © 2017年 Qu ZhongLiang. All rights reserved.
//

#import "ViewController.h"
#import "RedLabel.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<CAAnimationDelegate>
@property(nonatomic, strong)UIView *backView;
@property(nonatomic, strong)UILabel *aview;
@end

@implementation ViewController
- (UILabel *)aview
{
    if (!_aview) {
        _aview = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        _aview.center = self.view.center;
        _aview.backgroundColor = [UIColor yellowColor];
        _aview.layer.cornerRadius = 50;
        _aview.layer.masksToBounds = YES;
        _aview.text = @"💰";
        _aview.font = [UIFont systemFontOfSize:45];
        _aview.textAlignment = NSTextAlignmentCenter;
    }
    return _aview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    _backView.center = self.view.center;
    _backView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_backView];
    
    
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self showAnimation1];
}
- (void)showAnimation1
{
    [self.view addSubview:self.aview];
    
    
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    animation.duration = 0.6;
    animation.fromValue = @(0.8);
    animation.toValue = @(0.9);
    animation.repeatCount = 4;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //[_aview.layer addAnimation:animation forKey:@"KKKKK"];
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    animation1.duration = 0.6;
    animation1.fromValue = @(1.05);
    animation1.toValue = @(0.95);
    animation1.repeatCount = 4;
    animation1.fillMode = kCAFillModeForwards;
    animation1.removedOnCompletion = NO;
    animation1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //[_aview.layer addAnimation:animation forKey:@"JJJJ"];
    CAKeyframeAnimation *animation2 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation2.duration = 0.6;
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(self.view.center.x, self.view.center.y - 15)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(self.view.center.x, self.view.center.y-5)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(self.view.center.x, self.view.center.y-15)];
    animation2.repeatCount = 4;
    animation2.values = @[value0,value1,value2];
    animation2.fillMode = kCAFillModeForwards;
    animation2.removedOnCompletion = NO;
    animation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];

    
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[animation,animation1,animation2];
    group.delegate = self;
    group.duration = 2.4;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    [_aview.layer addAnimation:group forKey:@"groupAnimation"];
    
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    
        CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"position"];
        animation3.duration = 1.5;
        animation3.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.view.center.x, self.view.center.y)];
        animation3.toValue = [NSValue valueWithCGPoint:CGPointMake(self.view.center.x, -100)];
        animation3.fillMode = kCAFillModeForwards;
        animation3.removedOnCompletion = NO;
        animation3.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        [_aview.layer addAnimation:animation3 forKey:@"pppp"];
   
}
@end
