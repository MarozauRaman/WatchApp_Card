//
//  Card.h
//  Cards WatchKit Extension
//
//  Created by Practice on 18.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property(nonatomic,assign) NSString* idCard;
@property(nonatomic,assign) BOOL isCurrent;
@property(nonatomic,strong) NSString* type;
@property(nonatomic,strong) NSString* expdate;
@property(nonatomic,strong) NSString* cardClass;
@property(nonatomic,strong) NSString* corporative;
@property(nonatomic,strong) NSString* num;
@property(nonatomic,strong) NSString* cardHolder;
@property(nonatomic,strong) NSString* cardName;
@property(nonatomic,strong) NSString* fixedBalance;
@property(nonatomic,strong) NSString* currency;
@property(nonatomic,strong) NSString* blocking;
@property(nonatomic,strong) NSString* balance;
@property(nonatomic,strong) NSString* international;
@property(strong,nonatomic) NSString* internet;
@property(strong,nonatomic) NSString* status3D;
@property(strong,nonatomic) NSString* statusPimp;
@property(strong,nonatomic) NSString* statusLimits;
@property(strong,nonatomic) NSString* isProlongable;
@property(strong,nonatomic) NSString* isReplaceable;
@property(strong,nonatomic) NSString* isCredit;
@property(strong,nonatomic) NSString* isBelcard;
@property(strong,nonatomic) NSString* isSendPinAllowed;
@property(strong,nonatomic) NSString* isDBO;
@property(strong,nonatomic) NSString* cardClassColor;
@property(strong,nonatomic) NSString* isVirtual;
@property(strong,nonatomic) NSString* cardsKey;



-(instancetype)initWithDictionary:(NSDictionary*) dict;

@end

