//
//  Queue.m
//  obj-c-lab-1
//
//  Created by Elyanil Liranzo Castro on 4/17/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

#import "Queue.h"

@implementation Queue


NSMutableArray *queue;

-(void) enqueue:(Person *)person {
    [queue addObject:person];
}

-(Person *) dequeue {
    Person *dequeuedItem = queue[0];
    
    //Removes first item
    [queue removeObjectAtIndex:0];
    return dequeuedItem;
}

-(int) count {
    return queue.count;
}


@end

