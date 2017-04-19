//
//  EmployeeDatabase.m
//  obj-c-lab-1
//
//  Created by Elyanil Liranzo Castro on 4/18/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

#import "EmployeeDatabase.h"
#import "Employee.h"

@interface EmployeeDatabase ()

@property(strong, nonatomic) NSMutableArray *employees;

@end

@implementation EmployeeDatabase

+(instancetype)shared{
    

    static EmployeeDatabase *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[[self class] alloc] init];
    });
    return shared;
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _employees = [NSKeyedUnarchiver unarchiveObjectWithData:[NSData dataWithContentsOfURL:[self archiveURL]]];
        
        //If there is nothing in the archive, then employees would be nil; Which mean we need to [[alloc]init] _employees
        if (!_employees) {
            _employees = [[NSMutableArray alloc]init];
        }
        
    }
    
    return self;
}

-(void)save{
    BOOL success = [NSKeyedArchiver archiveRootObject:[self employees] toFile:[[self archiveURL] path]];
    if (success){
        NSLog(@"Saved employees to database.");
    } else {
        NSLog(@"Failed to save employees to database.");
    }
}

-(NSURL *)documentsDirectory{
    NSURL *documentsDirectoryURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    
    return documentsDirectoryURL;
}

-(NSURL *) archiveURL {
    return [[self documentsDirectory] URLByAppendingPathComponent:@"archive"];
}

-(NSInteger)count{
    return (NSInteger)_employees.count;
}

-(NSMutableArray *)allEmployees {
    NSMutableArray *copyOf = [[NSMutableArray alloc] initWithArray:_employees copyItems:YES];
    return copyOf;
}
-(Employee *)employeeAtIndex:(int)index{
    return [_employees objectAtIndex: index];
}
-(void)remove:(Employee *)employee {
    if([_employees containsObject:employee]){
        [_employees removeObject:employee];
    }
    [self save];
    NSLog(@"Inside of removeEmployee: (after removal) number of employees %lu",(unsigned long)_employees.count);
}
-(void)removeAllEmployees{
    [_employees removeAllObjects];
    [self save];
}
-(void)add:(Employee *)employee{
    NSLog(@"Inside of EmployeeDatabase: %@",employee.firstName);
    if(![_employees containsObject:employee]){
        [_employees addObject:employee];
        [self save];
    }
}
-(void)removeEmployeeAtIndex:(int)index{
    [_employees removeObjectAtIndex:index];
    [self save];
}


//Makes a deep copy
//-(id)copyWithZone:(NSZone *)zone {
//    Person *person = [[Person alloc]init];
//    person.name = self.name;
//    person.email = self.email;
//    
//    return person;
//}
@end
