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
        self.idCard = dict[@"idCard"];
        self.isCurrent = dict[@"isCurrent"];
        self.type = dict[@"type"];
        self.expdate = dict[@"expdate"];
        self.cardClass = dict[@"cardClass"];
        self.corporative = dict[@"corporative"];
        self.num = dict[@"num"];
        self.cardHolder = dict[@"cardHolder"];
        self.cardName = dict[@"cardName"];
        self.fixedBalance = dict[@"fixedBalance"];
        self.currency = dict[@"currency"];
        self.blocking = dict[@"blocking"];
        self.balance = dict[@"balance"];
        self.international = dict[@"international"];
        self.internet = dict[@"internet"];
        self.status3D = dict[@"status3D"];
        self.statusPimp = dict[@"statusPimp"];
        self.statusLimits = dict[@"statusLimits"];
        self.isProlongable = dict[@"isProlongable"];
        self.isReplaceable = dict[@"isReplaceable"];
        self.isCredit = dict[@"isCredit"];
        self.isBelcard = dict[@"isBelcard"];
        self.isSendPinAllowed = dict[@"isSendPinAllowed"];
        self.isDBO = dict[@"isDBO"];
        self.cardClassColor = dict[@"cardClassColor"];
        self.isVirtual=dict[@"isVirtual"];
        self.cardsKey = dict[@"cardsKey"];
    }
    
    return self;
}



@end

