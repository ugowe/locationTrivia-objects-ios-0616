//
//  FISLocation.m
//  locationTrivia-Objects
//
//  Created by Ugowe on 6/14/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocation.h"

@implementation FISLocation

- (instancetype)init{
    self = [self initWithName:@""
                      latitude:0
                     longitude:0 ];
    return self;
}
- (instancetype)initWithName:(NSString *)name
                    latitude:(CGFloat)latitude
                   longitude:(CGFloat)longitude{
    self = [super init];
    if (self) {
        _name = name;
        _latitude = latitude;
        _longitude = longitude;
        _trivia = [NSMutableArray new];
    }
    
    return self;
}

/* Define the stringByTruncatingNameToLength: method to return a substring of the location's name shortened to the number of characters defined by the length argument. This method should handle a length argument integer that exceeds the length of the location's name string; in such a case, it should just return the location's whole name. 
 
stringByTruncatingNameToLength: method
 length
 name
 
 define stringByTruncatingNameToLength: method 
    return-- a substring of the location's name --  shortened to the number of characters defined by the LENGTH argument
 NSUInteger *nameLength = [self.name length]
 if (!
  else {
 }
 
 NSString has a handy method called substringToIndex.
 NSUInteger *nameLength = [self.name length]
 
 NSString *truncatedName = [NSString substringToIndex:nameLength]
 
return truncatedName;
 */

- (NSString *)stringByTruncatingNameToLength:(NSUInteger)length{
    
    if (length < self.name.length){
        
        NSString *subString = [self.name substringToIndex:length];
        return subString;
    }
    
    return self.name;
}

- (BOOL)hasValidData {
    if (self.name.length == 0) {
        return NO;
    }
    if (self.latitude < -90.0 || self.latitude > 90.0) {
        return NO;
    }
    if (self.longitude <= -180.0 || self.longitude > 180.0) {
        return NO;
    }
    return YES;
}

- (FISTrivium *)triviumWithMostLikes {
    if (self.trivia.count == 0) {
        return nil;
    }
    
    FISTrivium *triviumWithMostLikes = self.trivia[0];
    for (FISTrivium *currentTrivium in self.trivia) {
        if (triviumWithMostLikes.likes < currentTrivium.likes) {
            triviumWithMostLikes = currentTrivium;
        }
    }
    return triviumWithMostLikes;
    
    /** solution with NSSortDescriptor
     
     NSSortDescriptor *sortByLikesDesc = [NSSortDescriptor sortDescriptorWithKey:@"likes"
     ascending:NO];
     NSArray *triviumByLikes = [self.trivia sortedArrayUsingDescriptors:@[sortByLikesDesc]];
     
     return triviumByLikes[0];
     */
}


@end
