//
//  ViewController.h
//  myFirstApp
//
//  Created by coskun on 29.05.2017.
//  Copyright (c) 2017 coskun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    int count;
}

-(IBAction)labelOlustur;
-(IBAction)resmiDegistir;

@property (nonatomic, retain) IBOutlet UILabel *etiket;
@property (nonatomic, retain) IBOutlet UIImageView *myImageView;

@end

