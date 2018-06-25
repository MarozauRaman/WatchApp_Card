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
        self.name = dict[@"cardName"];
        self.imageName = dict[@"type"];
        self.amount = dict[@"balance"];
        self.number = dict[@"num"];
        self.statement=[[NSMutableArray alloc]init];
        self.term=dict[@"term"];
        self.currency = dict[@"currency"];
    }
    
    return self;
}



@end

@implementation Statement

-(id)initWithDictionary:(NSDictionary*) dict{
    self=[super init];
    if(self){
        self.amount = dict[@"transactionAmt"];
        self.date = dict[@"date"];
        self.desc = dict[@"type"];
        self.sign = dict[@"sign"];
    }
    return self;
}

@end
