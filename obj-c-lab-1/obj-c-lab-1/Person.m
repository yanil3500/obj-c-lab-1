//
//  Person.m
//  obj-c-lab-1
//
//  Created by Elyanil Liranzo Castro on 4/17/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                           andAge:(NSNumber *)age {
    self = [super init];
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
        _age = age;
    }
    return self;
}

-(id)copyWithZone:(NSZone *)zone{
    Person *person = [[[self class] alloc]init];
    
    [person setFirstName: [self firstName]];
    [person setLastName:[self lastName]];
    [person setAge: [self age]];

    
    return person;
}
@end
