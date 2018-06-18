//
//  Card.h
//  Cards WatchKit Extension
//
//  Created by Practice on 18.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Statement.h"

@interface Card : NSObject

@property(nonatomic,weak) NSString* name;
@property(nonatomic,strong) NSString* number;
@property(nonatomic,strong) NSString* amount;
@property(nonatomic,strong) NSString* imageName;
@property(nonatomic,strong) Statement* statement;

//-(id)initWithArray:(Statement*)statement
//              name:(NSString*)name
//            number:(NSString*)number amount:(NSString*)amount
//         imageName:(NSString*)imageName;
-(instancetype)initWithArray:(NSDictionary*)dict;
@end
