//
//  MainViewController.h
//  SlideMenu
//
//  Created by Kyle Begeman on 1/13/13.
//  Copyright (c) 2013 Indee Box LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (strong, nonatomic) UIButton *menuBtn;

@property (weak, nonatomic) IBOutlet UIImageView *backIcon;
@property (weak, nonatomic) IBOutlet UIImageView *homeIcon;

@end