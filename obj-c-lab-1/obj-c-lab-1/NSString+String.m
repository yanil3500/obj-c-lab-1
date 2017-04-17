//
//  NSString+String.m
//  obj-c-lab-1
//
//  Created by Elyanil Liranzo Castro on 4/17/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

#import "NSString+String.h"

@implementation NSString (String)

//Create a category of NSString. Extend NSString's functionality to have a instance method that returns an array of the words contained in self.

-(NSArray *) toArray {
    return [self componentsSeparatedByString:@" "];
}


//Create another method in the same category that is a class method that takes in a NSString and returns the same NSString but reversed.
+(NSString *) reversedString:(NSString *)inputString {
    int lengthOfString = [inputString length];
    NSMutableString *reversed = [NSMutableString string];
    while (lengthOfString > 0) {
        lengthOfString--;
        
        NSRange subrange = NSMakeRange(lengthOfString, 1);
        [reversed appendString:[inputString substringWithRange:subrange]];
    }
    return reversed;
}


@end
