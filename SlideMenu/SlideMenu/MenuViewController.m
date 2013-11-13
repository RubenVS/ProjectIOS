//
//  MenuViewController.m
//  SlideMenu
//
//  Created by Kyle Begeman on 1/13/13.
//  Copyright (c) 2013 Indee Box LLC. All rights reserved.
//

#import "MenuViewController.h"
#import "ECSlidingViewController.h"
#import "SecondViewController.h"
@interface MenuViewController ()

@property (strong, nonatomic) NSArray *menu;

@end

@implementation MenuViewController

@synthesize menu;
@synthesize thumbnailImageOne;
@synthesize thumbnailImageTwo;
@synthesize thumbnailImageThree;
@synthesize thumbnailImageFour;
@synthesize thumbnailImageFive;

@synthesize menuItem1;
@synthesize menuItem2;
@synthesize menuItem3;
@synthesize menuItem4;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIImage *image = [UIImage imageNamed:@"menu_achtergrond.png"];
    self.tableView.backgroundView = nil;
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    
    thumbnailImageOne.image = [UIImage imageNamed:@"menu_overzicht_knop.png"];
    thumbnailImageTwo.image = [UIImage imageNamed:@"menu_afspraak_knop.png"];
    thumbnailImageThree.image = [UIImage imageNamed:@"menu_cirkel.png"];
    thumbnailImageFour.image = [UIImage imageNamed:@"menu_database_knop.png"];
    thumbnailImageFive.image = [UIImage imageNamed:@"menu_vandaag_knop.png"];
    
    [self.slidingViewController setAnchorRightRevealAmount:200.0f];
    self.slidingViewController.underLeftWidthLayout = ECFullWidth;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *theCellClicked = [self.tableView cellForRowAtIndexPath:indexPath];
    if (theCellClicked == menuItem1) {
    
        UIViewController *newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Main"];
    
        [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
        CGRect frame = self.slidingViewController.topViewController.view.frame;
        self.slidingViewController.topViewController = newTopViewController;
        self.slidingViewController.topViewController.view.frame = frame;
        [self.slidingViewController resetTopView];
        }];
        
    }
    
    if (theCellClicked == menuItem2) {
        
        UIViewController *newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
        
        [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
            CGRect frame = self.slidingViewController.topViewController.view.frame;
            self.slidingViewController.topViewController = newTopViewController;
            self.slidingViewController.topViewController.view.frame = frame;
            [self.slidingViewController resetTopView];
        }];
        
    }

    
    if (theCellClicked == menuItem3) {
        
        UIViewController *newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ThirdViewController"];
        
        [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
            CGRect frame = self.slidingViewController.topViewController.view.frame;
            self.slidingViewController.topViewController = newTopViewController;
            self.slidingViewController.topViewController.view.frame = frame;
            [self.slidingViewController resetTopView];
        }];
        
    }

    
    if (theCellClicked == menuItem4) {
        
        UIViewController *newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FourthViewController"];
        
        [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
            CGRect frame = self.slidingViewController.topViewController.view.frame;
            self.slidingViewController.topViewController = newTopViewController;
            self.slidingViewController.topViewController.view.frame = frame;
            [self.slidingViewController resetTopView];
        }];
        
    }

    
    
    
     
}

@end
