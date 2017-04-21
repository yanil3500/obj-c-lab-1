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
        _firstName = [firstName retain];
        _lastName = [lastName retain];
        _age = [age retain];
    }
    return self;
}

-(NSString *)firstName{
    return _firstName;
}

-(void)setFirstName:(NSString *)firstName{
    if (_firstName != firstName){
        //Retain the reference that is being passed in
        [firstName retain];
        //Release the reference that is being overwritten
        [_firstName release];
        _firstName = firstName;
        
    }
}

-(NSString *)lastName{
    return _lastName;
}

-(void)setLastName:(NSString *)lastName{
    if(_lastName != lastName){
        //Retain the reference that is being passed in
        [lastName retain];
        //Release the reference that is being overwritten
        [_lastName release];
        _lastName = lastName;
    }
}

-(NSNumber *)age{
    return _age;
}

-(void)setAge:(NSNumber *)age{
    if(_age != age){
        //Retain the reference that is being passed in
        [age retain];
        //Release the reference that is being overwritten
        [_age release];
        _age = age;
    }
}




//Makes a deep copy
-(id)copyWithZone:(NSZone *)zone{
    Person *person = [[[self class] alloc]init];
    
    [person setFirstName: [self firstName]];
    [person setLastName:[self lastName]];
    [person setAge: [self age]];

    
    return person;
}
@end
