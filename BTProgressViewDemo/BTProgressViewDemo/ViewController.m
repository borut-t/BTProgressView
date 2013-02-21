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

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    BTProgressView *playingProgressView = [[BTProgressView alloc] initWithFrame:CGRectMake(10.f, 100.f, self.view.frame.size.width-20.f, 3.f)];
    playingProgressView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    playingProgressView.progress = 0.1;
    playingProgressView.tag = 444;
    playingProgressView.bgImage = @"tvguide_progressbar_grey.png";
    playingProgressView.fillImage = @"tvguide_progressbar_blue.png";
    [self.view addSubview:playingProgressView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
