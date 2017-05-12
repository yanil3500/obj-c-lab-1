//
//  Person.h
//  obj-c-lab-1
//
//  Created by Elyanil Liranzo Castro on 4/17/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCopying>{
    NSString *_firstName;
    NSString *_lastName;
    NSNumber *_age;
}


-(NSString *)firstName;
-(void)setFirstName:(NSString *)firstName;
-(NSString *)lastName;
-(void)setLastName:(NSString *)lastName;
-(NSNumber *)age;
-(void)setAge:(NSNumber *)age;

-(instancetype)initWithFirstName:(NSString *)firstName
                        lastName:(NSString *)lastName
                          andAge:(NSNumber *)age;

@end
