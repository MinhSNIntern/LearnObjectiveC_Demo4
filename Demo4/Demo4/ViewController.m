//
//  ViewController.m
//  Demo4
//
//  Created by vfa on 8/16/22.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UIImageView * imageView;
@property (nonatomic,strong) UIImageView * scrollViewImageItem;
@property (nonatomic,strong) UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Demo Button" forState:UIControlStateNormal];
    self.button.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    [self.button sizeToFit];
    [self.button.titleLabel setTextAlignment:NSTextAlignmentCenter];
    self.button.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.button.layer setBorderWidth:1.0];
    [self.button.layer setCornerRadius:12.0];
    [self.button.layer setBorderColor: [[UIColor systemBlueColor] CGColor]];
    [self.button addTarget:self action:@selector(showAlert) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: self.button];
    // Do any additional setup after loading the view.
    
    //image view
    UIImage *image = [UIImage imageNamed:@"image"];
    self.imageView = [[UIImageView alloc] initWithImage:image];
    self.imageView.frame = CGRectMake(0,0, self.view.frame.size.width,
    self.view.frame.size.height/2 - self.button.frame.size.height);
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview: self.imageView];
    
    //scroll view
    UIImage *image2 = [UIImage imageNamed:@"image2"];
    self.scrollViewImageItem = [[UIImageView alloc] initWithImage:image2];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.button.frame.origin.y+self.button.frame.size.height +20, self.view.frame.size.width, self.view.frame.size.height/2 - self.button.frame.size.height)];
    [self.scrollView addSubview:self.scrollViewImageItem];
    self.scrollView.contentSize = self.scrollViewImageItem.bounds.size;
   
    self.scrollView.delegate = self;
    self.scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    [self.view addSubview:self.scrollView];
    
}
- (void) showAlert{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Button Clicked" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:actionOK];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
