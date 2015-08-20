//
//  Level.h
//  TapMatch
//
//  Created by Noyin Lawal on 2014-08-16.
//  Copyright (c) 2014 Noyin Lawal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tile.h"


static const NSInteger NumColumns = 8;
static const NSInteger NumRows = 8;

@interface Level : NSObject

-(instancetype)initWithFile:(NSString*)filename;


@end
