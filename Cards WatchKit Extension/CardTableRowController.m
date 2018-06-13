//
//  CardTableRowController.m
//  Cards WatchKit Extension
//
//  Created by Practice on 12.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "CardTableRowController.h"
#import "InterfaceController.h"


@implementation CardTableRowController
-(void)setLabell:(WKInterfaceLabel *)labell{
    [_labell setText:(NSString*)labell];
}
-(void)setNumber:(WKInterfaceLabel *)number{
    [_number setText:(NSString*)number];
}
@end
