//
//  History.m
//  Cards WatchKit Extension
//
//  Created by Roman Morozov on 26.06.18.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "History.h"

@implementation History

-(id)initWithDictionary:(NSDictionary*) dict{
    self=[super init];
    if(self){
        self.date = dict[@"date"];
        self.dateResp = dict[@"dateResp"];
        self.type = dict[@"type"];
        self.cardAcceptor = dict[@"cardAcceptor"];
        self.transactionAmt = dict[@"transactionAmt"];
        self.transactionAmtCurrency = dict[@"transactionAmtCurrency"];
        self.accountAmt = dict[@"accountAmt"];
        self.acountAmtCurrency = dict[@"acountAmtCurrency"];
        self.feeAmt = dict[@"feeAmt"];
        self.feeAmtCurrency = dict[@"feeAmtCurrency"];
        self.reflectedAccountAmt = dict[@"reflectedAccountAmt"];
        self.reflectedAccountAmtCurrency = dict[@"reflectedAccountAmtCurrency"];
        self.reflectedFee = dict[@"reflectedFee"];
        self.reflectedFeeCurrency = dict[@"reflectedFeeCurrency"];
        self.balanceAmt = dict[@"balanceAmt"];
        self.balanceAmtCurrency = dict[@"balanceAmtCurrency"];
        self.status = dict[@"status"];
        self.sign = dict[@"sign"];
        self.operationColor = dict[@"operationColor"];
        self.cardNum = dict[@"cardNum"];
        self.historyKey = dict[@"historyKey"];
    }
    return self;
}

@end
