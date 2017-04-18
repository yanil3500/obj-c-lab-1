//
//  Employee.h
//  obj-c-lab-1
//
//  Created by Elyanil Liranzo Castro on 4/17/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

#import "Person.h"

@interface Employee : Person <NSCopying>

@property(strong, nonatomic)NSNumber * employeeNumber;
@property(strong, nonatomic)NSNumber * yearsEmployed;
@property(strong, nonatomic)NSString * managerName;

-(instancetype)initWithFirstName:(NSString *)firstName
                        lastName:(NSString *)lastName
                          andAge:(NSNumber *)age
                   yearsEmployed:(NSNumber *)yearsEmployed
                      andManager:(NSString *)managerName;

@end
