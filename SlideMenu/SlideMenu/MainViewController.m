//
//  MainViewController.m
//  SlideMenu
//
//  Created by Kyle Begeman on 1/13/13.
//  Copyright (c) 2013 Indee Box LLC. All rights reserved.
//

#import "MainViewController.h"
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "DataController.h"
#import "inventoryitems.h"



@interface MainViewController ()

@end

@implementation MainViewController

@synthesize menuBtn;
@synthesize backIcon;
@synthesize homeIcon;




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //testen of database werkt
    DataController *dataController = [[DataController alloc]init];
    [dataController initDatabase];
    
    
    //Inventoryitem toe proberen te voegen
    //inventoryitems *item = [[inventoryitems alloc]initWithName:@"testitem" andPricePerUnit:[NSNumber numberWithInt:1]];
   // [dataController insertInventoryItem:item];
    
       
    
	// Do any additional setup after loading the view.
    backIcon.image = [UIImage imageNamed:@"topbar_knopterug.png"];
    backIcon.image = [UIImage imageNamed:@"topbar_kniphome.png"];
    
    
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    
    
    self.menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBtn.frame = CGRectMake(8, 10, 34, 24);
    [menuBtn setBackgroundImage:[UIImage imageNamed:@"knopmenu"] forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(revealMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.menuBtn];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}





@end
