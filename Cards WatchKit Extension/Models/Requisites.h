//
//  Requisites.h
//  Cards WatchKit Extension
//
//  Created by Roman Morozov on 26.06.18.
//  Copyright © 2018 Practice. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Requisites : NSObject

@property(nonatomic,strong) NSString* bank;
@property(nonatomic,strong) NSString* bankDetails;
@property(nonatomic,strong) NSString* unp;
@property(nonatomic,strong) NSString* account;
@property(nonatomic,strong) NSString* payAssign;
@property(nonatomic,strong) NSString* noAdditionalPayments;
@property(nonatomic,strong) NSString* currencyCode;
@property(nonatomic,strong) NSString* currencyName;

-(id)initWithDictionary:(NSDictionary*) dict;

@end
