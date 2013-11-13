//
//  inventoryitems.m
//  W2DO
//
//  Created by Arnout Creemers on 12/11/13.
//  Copyright (c) 2013 Indee Box LLC. All rights reserved.
//

#import "inventoryitems.h"

@implementation inventoryitems
@synthesize name;
@synthesize pricePerUnit;

-(id)initWithName:(NSString *)aName andPricePerUnit:(NSNumber *)aPricePerUnit
{
    self=[super init];
    if(self){
        self.name = aName;
        self.pricePerUnit = aPricePerUnit;
    }
    return self;
}

- (void) dealloc {
  
    
}
@end
