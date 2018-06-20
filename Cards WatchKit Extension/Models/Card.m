//
//  Card.m
//  Cards WatchKit Extension
//
//  Created by Practice on 18.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "Card.h"

@implementation Card

-(instancetype)initWithDictionary:(NSDictionary*)dict {
    self = [super init];
    if(self){
        self.name = (NSString*)dict[@"name"];
        self.imageName = dict[@"imageName"];
        self.amount = dict[@"amount"];
        self.number = dict[@"number"];
        self.statement = dict[@"statement"];
        self.term=dict[@"term"];
    }
    
    return self;
}

-(NSArray*)allCards{
    
    NSArray* plist = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Cards" ofType:@"plist"]];
    return plist;
}

@end

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

-(NSArray*)statementsForWeek:(id)context{
    
    NSMutableArray *arrayOfStatemnts=[[NSMutableArray alloc]init];
    for (NSDictionary *statemen in context) {
        Statement *statement = [[Statement alloc]initWithDict:statemen];
        NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"dd.MM.yyyy"];
        NSDate *datee = [dateFormat dateFromString:statement.date];
        if([datee timeIntervalSinceNow] > -806400){
            [arrayOfStatemnts addObject:statemen];
        }
        
    }
    
    return arrayOfStatemnts;
}

@end
