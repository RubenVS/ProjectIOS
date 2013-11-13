//
//  inventoryperclientperday.h
//  W2DO
//
//  Created by Arnout Creemers on 12/11/13.
//  Copyright (c) 2013 Indee Box LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "clients.h"
#import "inventoryitems.h"


@interface inventoryperclientperday : NSObject
{
    clients *client;
    inventoryitems *item;
    NSDate *calendarDay;
    NSNumber *amount;
    
    
}

@property(nonatomic, retain) clients *client;
@property(nonatomic, retain) inventoryitems *item;
@property(nonatomic, retain) NSDate *calendarDay;
@property(nonatomic, retain) NSNumber *amount;

-(id)initWithClient:(clients*)aClient
      andItem:(inventoryitems*)anItem
       andCalendarDay:(NSDate*)aCalendarDay
          andAmount:(NSNumber*)anAmount;
@end
