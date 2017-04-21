//
//  Employee.m
//  obj-c-lab-1
//
//  Created by Elyanil Liranzo Castro on 4/17/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

#import "Employee.h"

@implementation Employee

-(instancetype)initWithFirstName:(NSString *)firstName
                        lastName:(NSString *)lastName
                          andAge:(NSNumber *)age
                   yearsEmployed:(NSNumber *)yearsEmployed
                      andManager:(NSString *)managerName
                       withEmail:(NSString *)email{
    self = [super initWithFirstName:firstName lastName:lastName andAge:age];
    if (self){
        _yearsEmployed = yearsEmployed;
        _managerName = managerName;
        _employeeNumber = [NSNumber numberWithInt:arc4random_uniform(1000)];
        _email = email;
    }
    
    return self;
}

-(NSNumber *)yearsEmployed{
    return _yearsEmployed;
}

-(void)setYearsEmployed:(NSNumber *)yearsEmployed{
    if(_yearsEmployed != yearsEmployed){
        [yearsEmployed retain];
        [_yearsEmployed release];
        _yearsEmployed = yearsEmployed;
    }
}
-(NSString *)managerName{
    return _managerName;
}

-(void)setManagerName:(NSString *)managerName {
    if(_managerName != managerName){
        [managerName retain];
        [_managerName release];
        _managerName = managerName;
    }
}
-(NSNumber *)employeeNumber{
    return _employeeNumber;
}

-(void)setEmployeeNumber:(NSNumber *)employeeNumber{
    if(_employeeNumber != employeeNumber){
        [employeeNumber retain];
        [_employeeNumber release];
        _employeeNumber = employeeNumber;
    }
}
-(NSString *)email{
    return _email;
}

-(void)setEmail:(NSString *)email{
    if(_email != email){
        [email retain];
        [_email release];
        _email = email;
    }
}

-(id)copyWithZone:(NSZone *)zone{
    Employee *employee = [super copyWithZone:zone];
    
    [employee setEmployeeNumber: [self employeeNumber]];
    [employee setYearsEmployed: [self yearsEmployed]];
    [employee setManagerName: [self managerName]];
    [employee setEmail: [self email]];
    
    return employee;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    
    if (self){
        self.firstName = [aDecoder decodeObjectForKey:@"firstName"];
        self.lastName = [aDecoder decodeObjectForKey:@"lastName"];
        self.age = [aDecoder decodeObjectForKey:@"age"];
        self.yearsEmployed = [aDecoder decodeObjectForKey:@"yearsEmployed"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.employeeNumber = [aDecoder decodeObjectForKey:@"employeeNumber"];
        self.managerName = [aDecoder decodeObjectForKey:@"managerName"];
    }
    
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:[self firstName] forKey:@"firstName"];
    [aCoder encodeObject:[self lastName] forKey:@"lastName"];
    [aCoder encodeObject:[self age] forKey:@"age"];
    [aCoder encodeObject:[self yearsEmployed] forKey:@"yearsEmployed"];
    [aCoder encodeObject:[self email] forKey:@"email"];
    [aCoder encodeObject:[self employeeNumber] forKey:@"employeeNumber"];
    [aCoder encodeObject:[self managerName] forKey:@"managerName"];
}



@end
