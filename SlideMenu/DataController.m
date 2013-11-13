//
//  DataController.m
//  W2DO
//
//  Created by Arnout Creemers on 12/11/13.
//  Copyright (c) 2013 Indee Box LLC. All rights reserved.
//

#import "DataController.h"
#import "clients.h"
#import "inventoryperclientperday.h"
#import "inventoryitems.h"
#import "workprojects.h"

@implementation DataController

    -(void)initDatabase
    {
        // Create a string containing the full path to the sqlite.db inside the documents folder
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *databasePath = [documentsDirectory stringByAppendingPathComponent:@"sqlite.db"];
        
        // Check to see if the database file already exists
        bool databaseAlreadyExists = [[NSFileManager defaultManager] fileExistsAtPath:databasePath];
        
        // Open the database and store the handle as a data member
        if (sqlite3_open([databasePath UTF8String], &databaseHandle) == SQLITE_OK)
        {
            // Create the database if it doesn't yet exists in the file system
            if (!databaseAlreadyExists)
            {
                const char *sqlStatement = "CREATE TABLE IF NOT EXISTS INVENTORYITEMS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, PRICEPERUNIT DOUBLE)";
                char *error;
                if (sqlite3_exec(databaseHandle, sqlStatement, NULL, NULL, &error) == SQLITE_OK)
                {
                   sqlStatement = "CREATE TABLE IF NOT EXISTS CLIENTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, FIRSTNAME TEXT, LASTNAME TEXT, ADDRESS TEXT)";
                    if (sqlite3_exec(databaseHandle, sqlStatement, NULL, NULL, &error) == SQLITE_OK)
                    {
                         sqlStatement = "CREATE TABLE IF NOT EXISTS INVENTORYPERCLIENTPERDAY (ID INTEGER PRIMARY KEY AUTOINCREMENT, ITEMID INT, CLIENTID INT, AMOUNT INT, CALENDARDAY DATE, FOREIGN KEY(ITEMID) REFERENCES INVENTORYITEMS(ID), FOREIGN KEY(CLIENTID) REFERENCES CLIENTS(ID))";
                        if (sqlite3_exec(databaseHandle, sqlStatement, NULL, NULL, &error) == SQLITE_OK)
                        {
                            NSLog(@"Database and tables created.");
                        }
                        else
                        {
                            NSLog(@"Error: %s", error);
                        }

                    }
                    else
                    {
                        NSLog(@"Error: %s", error);
                    }
                }
                else
                {
                    NSLog(@"Error: %s", error);
                }
            }
        }
    }

- (void)dealloc{
    sqlite3_close(databaseHandle);
  
}


-(void)insertClient:(clients*)client
{
    // Create insert statement for the person
    NSString *insertStatement = [NSString stringWithFormat:@"INSERT INTO CLIENTS (FIRSTNAME, LASTNAME, ADDRESS) VALUES (\"%@\", \"%@\", \"%@\")", client.firstName, client.lastName, client.Address];
    
    char *error;
    if ( sqlite3_exec(databaseHandle, [insertStatement UTF8String], NULL, NULL, &error) == SQLITE_OK)
    {
            NSLog(@"Client inserted.");
       
    }
    else
    {
        NSLog(@"Error: %s", error);
    }
}


-(void)insertInventoryItem:(inventoryitems*)inventoryItem
{
    // Create insert statement for the person
    NSString *insertStatement = [NSString stringWithFormat:@"INSERT INTO INVENTORYITEMS (NAME, PRICEPERUNIT) VALUES (\"%@\", \"%@\")", inventoryItem.name, inventoryItem.pricePerUnit];
    
    char *error;
    if ( sqlite3_exec(databaseHandle, [insertStatement UTF8String], NULL, NULL, &error) == SQLITE_OK)
    {
        NSLog(@"Inventoryitem inserted.");
        
    }
    else
    {
        NSLog(@"Error: %s", error);
    }
}

-(NSArray*)getInventoryITems
{
    NSMutableArray *inventoryItems = [[NSMutableArray alloc]init];
    
    // Create the query statement to get all persons
    NSString *queryStatement = [NSString stringWithFormat:@"SELECT ID, NAME, PRICEPERUNIT FROM INVENTORYITEMS"];
    
    // Prepare the query for execution
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(databaseHandle, [queryStatement UTF8String], -1, &statement, NULL) == SQLITE_OK)
    {
        // Iterate over all returned rows
        while (sqlite3_step(statement) == SQLITE_ROW) {
            
            int personID = sqlite3_column_int(statement, 0);
            char namechar =  (char *) sqlite3_column_text(statement, 1);
            NSString *name = [NSString stringWithFormat:@"%c", namechar];
            NSNumber *pricePerUnit;
            double temp = (double)sqlite3_column_double(statement, 2);
            pricePerUnit = [[NSNumber alloc]initWithDouble:temp];
            
            inventoryitems *item = [[inventoryitems alloc]initWithName:name andPricePerUnit:pricePerUnit];
            
                                    
            [inventoryItems addObject:item];
                        
        }
        sqlite3_finalize(statement);
    }
    return inventoryItems;
}

@end
