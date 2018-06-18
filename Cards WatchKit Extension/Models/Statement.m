//
//  Statement.m
//  Cards WatchKit Extension
//
//  Created by Practice on 18.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "Statement.h"

@implementation Statement
-(id)initWithDict:(NSDictionary *)dict{
    self=[super init];
    if(self){
        [self setAmount:dict[@"amount"]];
        [self setDate:dict[@"date"]];
        [self setDesc:dict[@"desc"]];
    }
    return self;
}
@end
