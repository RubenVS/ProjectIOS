//
//  inventoryitems.h
//  W2DO
//
//  Created by Arnout Creemers on 12/11/13.
//  Copyright (c) 2013 Indee Box LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface inventoryitems : NSObject
{
    NSString *name;
    NSNumber *pricePerUnit;
    
}

@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSNumber *pricePerUnit;

-(id)initWithName:(NSString*)aName
  andPricePerUnit:(NSNumber*)aPricePerUnit;


@end
