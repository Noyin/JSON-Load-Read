//
//  Level.m
//  TapMatch
//
//  Created by Noyin Lawal on 2014-08-16.
//  Copyright (c) 2014 Noyin Lawal. All rights reserved.
//

#import "Level.h"


@interface Level ()
{
    Box * boxGrid[NumColumns][NumRows];
    Tile * tileGrid[NumColumns][NumRows];
    
}

@end

@implementation Level


//Method (Function) to read JSON File

/*

The above method initializes a class, checks to see if the class is initialized then creates a dictionary which is loaded with a JSON file.

The dictionary then enumerates through its content (arrays).

The arrays are then further enumerated and when a value of 1 is encountered , a new "tile" class is created and added to the tileGrid property (an array) of the class.

If 0 is encountered nothing happens.

Lastly the method returns a copy of the initialized class.

*/


-(instancetype)initWithFile:(NSString *)filename
{
    self = [super init];
    if (self) {
        NSDictionary * dictionary = [self loadJSONFile:filename];
        
        [dictionary[@"Tiles"] enumerateObjectsUsingBlock:^( NSArray* array, NSUInteger row, BOOL *stop) {
            [array enumerateObjectsUsingBlock:^(NSNumber * value , NSUInteger column, BOOL *stop) {
                
                NSInteger tileRow =NumRows - row -1;
                if ([value integerValue] == 1) {
                    Tile * tile = [[Tile alloc] init];
                    tileGrid[column][tileRow] = tile;
                }
            }];
        }];
    }
    return self;
}


//Method (Function) to load JSON File

/*
 
 This method loads the JSON file
 
 */



-(NSDictionary*)loadJSONFile:(NSString*)filename
{
    NSString * path = [[NSBundle mainBundle] pathForResource:filename ofType:@"json"];
    if (!path) {
        NSLog(@"Could not find %@.json file",filename);
        return nil;
    }
    
    NSData * data = [NSData dataWithContentsOfFile:path options:0 error:nil];
    if (!data) {
        NSLog(@"Could not find %@.json file",filename);
        return nil;
    }
    
    NSDictionary * dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    if (!dictionary) {
        NSLog(@"Could not find %@.json file",filename);
        return nil;
    }
    
    return dictionary;
    
}



@end
