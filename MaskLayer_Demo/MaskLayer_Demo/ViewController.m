//
//  ViewController.m
//  MaskLayer_Demo
//
//  Created by company on 2017/8/24.
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    CAGradientLayer *_gradientLayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self test1];
    [self test2];
   
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"locations";
    NSArray *v1 = @[@(0.1f),@(0.2f),@(0.3f),@(0.8f)];
    NSArray *v2 = @[@(0.4f),@(0.6f),@(0.7f),@(8.0f)];
    NSArray *v3 = @[@(0.1f),@(0.2f),@(0.3f),@(0.8f)];
    animation.values = @[v1,v2,v3];
    animation.duration = 4;
    animation.repeatCount = 100;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [_gradientLayer  addAnimation:animation forKey:nil];
    
}
-(void)test2
{
    CGRect frame = CGRectMake(10, 30, 200, 200);
    CATextLayer *layer = [CATextLayer layer];
    layer.string = @"测试";
    layer.frame = frame;
    layer.fontSize = 60.f;
    layer.contentsScale = [UIScreen mainScreen].scale;
    layer.foregroundColor =[UIColor blackColor].CGColor;
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.startPoint = CGPointMake(0.0, 0.0);
    gradientLayer.endPoint = CGPointMake(1.0,1.0);
    //设置渐变颜色
    NSArray *colors =@[(id)[UIColor blackColor].CGColor,(id)[UIColor yellowColor].CGColor,(id)[UIColor greenColor].CGColor,(id)[UIColor blueColor].CGColor];
    gradientLayer.colors = colors;
    NSArray *locations = @[@(0.2f),@(0.4f),@(0.6f),@(0.8f)];
    
    gradientLayer.locations = locations;
    gradientLayer.frame = frame;
    gradientLayer.mask = layer;
    _gradientLayer = gradientLayer;
    [self.view.layer addSublayer:gradientLayer];
}
/** 使用图片作纹理 */
-(void)test1
{
    CGRect frame = CGRectMake(10, 30, 200, 200);
    CATextLayer *layer = [CATextLayer layer];
    layer.string = @"测试";
    layer.frame = frame;
    layer.fontSize = 60.f;
    layer.contentsScale = [UIScreen mainScreen].scale;
    layer.foregroundColor =[UIColor redColor].CGColor;
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"image"];
    imageView.frame = frame;
    imageView.layer.mask = layer;
    [self.view addSubview:imageView];
}

@end


















