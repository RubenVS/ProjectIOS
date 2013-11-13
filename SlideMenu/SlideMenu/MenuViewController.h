//
//  MenuViewController.h
//  SlideMenu
//
//  Created by Kyle Begeman on 1/13/13.
//  Copyright (c) 2013 Indee Box LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageOne;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageTwo;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageThree;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageFour;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageFive;
@property (strong, nonatomic) IBOutlet UITableViewCell *menuItem1;
@property (strong, nonatomic) IBOutlet UITableViewCell *menuItem2;
@property (strong, nonatomic) IBOutlet UITableViewCell *menuItem3;
@property (strong, nonatomic) IBOutlet UITableViewCell *menuItem4;

@end
