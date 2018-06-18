//
//  Card.m
//  Cards WatchKit Extension
//
//  Created by Practice on 18.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "Card.h"

@implementation Card
//-(id)initWithArray:(Statement *)statement name:(NSString *)name number:(NSString *)number amount:(NSString *)amount imageName:(NSString *)imageName {
-(instancetype)initWithArray:(NSDictionary*)dict {
    self = [super init];
    if(self){
        self.name = dict[@"name"];
        self.imageName = dict[@"imageName"];
        self.amount = dict[@"amount"];
        self.number = dict[@"number"];
        self.statement = dict[@"statement"];
    }
    
    return self;
}


@end
