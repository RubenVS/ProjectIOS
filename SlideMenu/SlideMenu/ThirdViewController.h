//
//  ThirdViewController.h
//  W2DO
//
//  Created by Arnout Creemers on 12/11/13.
//  Copyright (c) 2013 Indee Box LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITextField *txtInventoryName;
@property (strong, nonatomic) UIButton *menuBtn;
- (IBAction)btnAddInventoryItem:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *tblViewInventory;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *txtInventoryPrice;
@end
