//
//  inventoryperclientperday.m
//  W2DO
//
//  Created by Arnout Creemers on 12/11/13.
//  Copyright (c) 2013 Indee Box LLC. All rights reserved.
//

#import "inventoryperclientperday.h"

@implementation inventoryperclientperday

@synthesize client;
@synthesize item;
@synthesize calendarDay;
@synthesize amount;

-(id)initWithClient:(clients *)aClient andItem:(inventoryitems *)anItem andCalendarDay:(NSDate *)aCalendarDay andAmount:(NSNumber *)anAmount
{
    self=[super init];
    if(self){
        self.client = aClient;
        self.item = anItem;
        self.calendarDay = aCalendarDay;
        self.amount = anAmount;
    }
    return self;
}

-(void) dealloc{
    
}

@end
