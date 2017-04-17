//
//  PersonQueue.h
//  obj-c-lab-1
//
//  Created by Elyanil Liranzo Castro on 4/17/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
//Declare a protocol called PersonQueue with the following methods:
//enqueue(required): Takes in a Person, returns Void
//dequeue(required): Takes no arguments, returns a Person
//count(optional): Takes no arguments, returns an int


@protocol PersonQueue <Person>


@required
-(void) enqueue:(Person *)person;

-(Person *)dequeue;

@optional
- (int)count;

@end
