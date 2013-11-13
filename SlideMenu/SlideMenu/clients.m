//
//  clients.m
//  W2DO
//
//  Created by Arnout Creemers on 12/11/13.
//  Copyright (c) 2013 Indee Box LLC. All rights reserved.
//

#import "clients.h"

@implementation clients
@synthesize firstName;
@synthesize lastName;
@synthesize Address;

-(id)initWithName:(NSString *)aFirstName andLastName:(NSString *)aLastName andAddress:(NSString *)aAddress
{
    self=[super init];
    if(self){
        self.firstName = aFirstName;
        self.lastName = aLastName;
        self.Address = aAddress;
    }
    return self;
}

- (void) dealloc {
    
    
}
@end
