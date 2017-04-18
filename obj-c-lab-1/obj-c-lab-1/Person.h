//
//  Person.h
//  obj-c-lab-1
//
//  Created by Elyanil Liranzo Castro on 4/17/17.
//  Copyright © 2017 Elyanil Liranzo Castro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCopying>

//@property automatically creates setters and getters
@property(strong, nonatomic)NSString *firstName;
@property(strong, nonatomic)NSString *lastName;
@property(strong, nonatomic)NSNumber *age;

-(instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName andAge:(NSNumber *)age;

@end
