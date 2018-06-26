//
//  Requisites.m
//  Cards WatchKit Extension
//
//  Created by Roman Morozov on 26.06.18.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "Requisites.h"

@implementation Requisites
-(id)initWithDictionary:(NSDictionary*) dict{
    self=[super init];
    if(self){
        self.bank = dict[@"bank"];
        self.bankDetails = dict[@"bankDetails"];
        self.unp = dict[@"unp"];
        self.account = dict[@"account"];
        self.payAssign = dict[@"payAssign"];
        self.noAdditionalPayments = dict[@"noAdditionalPayments"];
        self.currencyCode = dict[@"currencyCode"];
        self.currencyName = dict[@"currencyName"];
       
    }
    return self;
}

@end
