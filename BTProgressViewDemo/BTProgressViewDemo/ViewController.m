//
//  ViewController.m
//  BTProgressViewDemo
//
//  Created by Borut Tomažin on 2/21/13.
//  Copyright (c) 2013 Borut Tomazin. All rights reserved.
//

#import "ViewController.h"
#import "BTProgressView.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutlet UIStepper *stepper;
@property (nonatomic, strong) IBOutlet BTProgressView *myProgressView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.myProgressView.progress = 0.1f;
    self.myProgressView.bgImage = @"bgimage_grey.png";
    self.myProgressView.fillImage = @"fillimage_blue.png";
    self.myProgressView.handleColor = [UIColor redColor];
    [self.view addSubview:self.myProgressView];
}

- (IBAction)repositionProgressView:(UIStepper *)sender
{
    self.myProgressView.progress = sender.value;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
