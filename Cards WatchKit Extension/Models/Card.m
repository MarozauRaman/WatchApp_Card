//
//  Card.m
//  Cards WatchKit Extension
//
//  Created by Practice on 18.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "Card.h"

@implementation Card

-(instancetype)initWithDictionary:(NSDictionary*) dict {
    self = [super init];
    if(self){
        self.name = (NSString*) dict[@"name"];
        self.imageName = dict[@"imageName"];
        self.amount = dict[@"amount"];
        self.number = dict[@"number"];
        self.statement=[[NSMutableArray alloc]init];
        for(NSDictionary* source in dict[@"statement"]){
            Statement* statement =[[Statement alloc]init:source];
            [self.statement addObject:statement];
        }
        self.term=dict[@"term"];
    }
    
    return self;
}


@end

@implementation Statement

-(id)init:(NSDictionary*) dict{
    self=[super init];
    if(self){
        [self setAmount:dict[@"amount"]];
        [self setDate:dict[@"date"]];
        [self setDesc:dict[@"desc"]];
    }
    return self;
}

@end
