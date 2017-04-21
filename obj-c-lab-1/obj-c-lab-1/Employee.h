//
//  Employee.h
//  obj-c-lab-1
//
//  Created by Elyanil Liranzo Castro on 4/17/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

#import "Person.h"

@interface Employee : Person <NSCopying, NSCoding> {
    NSNumber * _employeeNumber;
    NSNumber * _yearsEmployed;
    NSString * _managerName;
    NSString * _email;
    
}

-(NSNumber *)yearsEmployed;
-(void)setYearsEmployed:(NSNumber *)yearsEmployed;
-(NSString *)managerName;
-(void)setManagerName:(NSString *)managerName;
-(NSNumber *)employeeNumber;
-(void)setEmployeeNumber:(NSNumber *)employeeNumber;
-(NSString *)email;
-(void)setEmail:(NSString *)email;

-(instancetype)initWithFirstName:(NSString *)firstName
                        lastName:(NSString *)lastName
                          andAge:(NSNumber *)age
                   yearsEmployed:(NSNumber *)yearsEmployed
                      andManager:(NSString *)managerName
                       withEmail:(NSString *)email;

@end
