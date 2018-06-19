//
//  Statement.h
//  Cards WatchKit Extension
//
//  Created by Practice on 18.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Statement : NSObject

@property(nonatomic,strong) NSString* amount;
@property(nonatomic,strong) NSString* desc;
@property(nonatomic,strong) NSString* date;

-(id)initWithDict:(NSDictionary*)dict;
-(id)initWithArray:(NSArray*) array;
@end
