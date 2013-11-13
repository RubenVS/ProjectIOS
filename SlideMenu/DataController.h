//
//  DataController.h
//  W2DO
//
//  Created by Arnout Creemers on 12/11/13.
//  Copyright (c) 2013 Indee Box LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "inventoryitems.h"


@interface DataController : NSObject

{
    sqlite3 *databaseHandle;
}
-(void)insertInventoryItem:(inventoryitems*)item;
-(void)insertClient;
-(void)initDatabase;
-(NSArray*)getInventoryITems;

@end
