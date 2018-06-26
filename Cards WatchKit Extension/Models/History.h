//
//  History.h
//  Cards WatchKit Extension
//
//  Created by Roman Morozov on 26.06.18.
//  Copyright © 2018 Practice. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface History : NSObject


@property(nonatomic,strong) NSString* date;
@property(nonatomic,strong) NSString* dateResp;
@property(nonatomic,strong) NSString* type;
@property(nonatomic,strong) NSString* cardAcceptor;
@property(nonatomic,strong) NSString* transactionAmt;
@property(nonatomic,strong) NSString* transactionAmtCurrency;
@property(nonatomic,strong) NSString* accountAmt;
@property(nonatomic,strong) NSString* acountAmtCurrency;
@property(nonatomic,strong) NSString* feeAmt;
@property(nonatomic,strong) NSString* feeAmtCurrency;
@property(nonatomic,strong) NSString* reflectedAccountAmt;
@property(nonatomic,strong) NSString* reflectedAccountAmtCurrency;
@property(nonatomic,strong) NSString* reflectedFee;
@property(nonatomic,strong) NSString* reflectedFeeCurrency;
@property(nonatomic,strong) NSString* balanceAmt;
@property(nonatomic,strong) NSString* balanceAmtCurrency;
@property(nonatomic,strong) NSString* status;
@property(nonatomic,strong) NSString* sign;
@property(nonatomic,strong) NSString* operationColor;
@property(nonatomic,strong) NSString* cardNum;
@property(nonatomic,strong) NSString* historyKey;

-(id)initWithDictionary:(NSDictionary*) dict;


@end
