//
//  clients.h
//  W2DO
//
//  Created by Arnout Creemers on 12/11/13.
//  Copyright (c) 2013 Indee Box LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface clients : NSObject
{
    NSString *firstName;
    NSString *lastName;
    NSString *Address;
    
}

@property(nonatomic, retain) NSString *firstName;
@property(nonatomic, retain) NSString *lastName;
@property(nonatomic, retain) NSString *Address;

-(id)initWithName:(NSString*)aFirstName
  andLastName:(NSString*)aLastName
andAddress:(NSString*)aAddress;
@end
