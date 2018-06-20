//
//  Card.h
//  Cards WatchKit Extension
//
//  Created by Practice on 18.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Card;
@class Statement;

@interface Card : NSObject

@property(nonatomic,weak) NSString* name;
@property(nonatomic,strong) NSString* number;
@property(nonatomic,strong) NSString* amount;
@property(nonatomic,strong) NSString* imageName;
@property(nonatomic,strong) NSString* term;
@property(strong,nonatomic) Statement* statement;


-(instancetype)initWithDictionary:(NSDictionary*)dict;
-(NSArray*)allCards;

@end

@interface Statement : NSObject

@property(nonatomic,strong) NSString* amount;
@property(nonatomic,strong) NSString* desc;
@property(nonatomic,strong) NSString* date;

-(id)initWithDict:(NSDictionary*)dict;
-(NSArray*)statementsForWeek:(NSArray*)context;
@end
