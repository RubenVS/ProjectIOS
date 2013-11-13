//
//  ThirdViewController.m
//  W2DO
//
//  Created by Arnout Creemers on 12/11/13.
//  Copyright (c) 2013 Indee Box LLC. All rights reserved.
//

#import "ThirdViewController.h"
#import "ECSlidingViewController.h"
#import "MenuViewController.h"
#import "DataController.h"
@interface ThirdViewController ()

@end

@implementation ThirdViewController{
    
   
    NSArray* inventoryItems;
}
@synthesize menuBtn;
@synthesize tblViewInventory;

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
    //inventoryitems ophalen uit database
    
    DataController *dataController = [[DataController alloc]init];
    inventoryItems = [dataController getInventoryITems];
    NSLog(@"inventory count: %d", [inventoryItems count]);

    [super didReceiveMemoryWarning];
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor grayColor].CGColor;
    
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
   
}

- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [inventoryItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSMutableDictionary *d=(NSMutableDictionary*)[inventoryItems objectAtIndex:indexPath.row];
    cell.textLabel.text =[d valueForKey:@"name"];
    
    [cell setAccessoryType: UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
}


- (IBAction)btnAddInventoryItem:(id)sender {
}
@end
