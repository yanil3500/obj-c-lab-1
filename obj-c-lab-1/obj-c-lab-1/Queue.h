//
//  Queue.h
//  obj-c-lab-1
//
//  Created by Elyanil Liranzo Castro on 4/17/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonQueue.h"
@interface Queue : NSObject <PersonQueue>

-(void) enqueue:(Person *)person;

-(Person *) dequeue;

-(int) count;

-(void) printQueue;

-(void)setQueueSize:(int) size;

@end
