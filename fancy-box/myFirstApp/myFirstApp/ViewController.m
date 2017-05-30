//
//  ViewController.m
//  myFirstApp
//
//  Created by coskun on 29.05.2017.
//  Copyright (c) 2017 coskun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize etiket;
@synthesize myImageView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
    //[etiket setText:@"merhaba iOS dünyası!"];
    CGRect myFrame = CGRectMake(10, 10, 200, 50);
    
    UILabel *myLable = [[UILabel alloc] init];
    //[myLable setFrame:CGRectMake(50, 50, 200, 50)];
    [myLable setFrame:myFrame];
    [myLable setText:@"My Lable with Code"];
    [myLable setTextAlignment:NSTextAlignmentLeft];
    [myLable setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0]];
    [myLable setTextColor:[UIColor whiteColor]];
    
    
    [self.view addSubview:myLable];
    */
    count = 0;
    
    [myImageView setImage:[UIImage imageNamed:@"oyuncak.png"]]; 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)labelOlustur{
    CGRect myFrame = CGRectMake(10, 100, 200, 50);
    
    UILabel *myLable = [[UILabel alloc] init];
    
    [myLable setFrame:myFrame];
    [myLable setText:@"My Lable with Code"];
    [myLable setTextAlignment:NSTextAlignmentLeft];
    [myLable setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0]];
    [myLable setTextColor:[UIColor whiteColor]];
    
    [self.view addSubview:myLable];
}

-(IBAction)resmiDegistir{
    if (count % 2 == 0) {
        [myImageView setImage:[UIImage imageNamed:@"ucak.png"]];
    }
    else{
        [myImageView setImage:[UIImage imageNamed:@"oyuncak.png"]];
    }
    count++;
}

@end
