//
//  InterfaceController.m
//  Cards WatchKit Extension
//
//  Created by Practice on 11.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "InterfaceController.h"
#import "CardTableRowController.h"
#import "SecondScreenInterfaceController.h"
#import "Card.h"


@interface InterfaceController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *card;
@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
    [self setTitle:@"Bank"];
    [self configureTableWithData];
    
    
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}
-(void)configureTableWithData{
    NSArray* plist = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Cards" ofType:@"plist"]];
    
    
    
    //number of rows
    int num = [plist count];
    
    [self.card setNumberOfRows:num withRowType:@"CardTableRowController"];
    
    NSInteger rowCount = self.card.numberOfRows;
    
    
    for(int i =0;i<rowCount;i++){
        
        Card* cardd = [plist objectAtIndex:i];
        
        
        NSLog(@"%@", cardd.name);
        
        CardTableRowController* row = [self.card rowControllerAtIndex:i];
        NSDictionary *dict = [plist objectAtIndex:i];
        
        [row.labell setText:cardd.name];
        [row.image setImageNamed:cardd.imageName];
        [row.number setText:cardd.number];
        
        
//        for(id key in dict){
//            NSString* data = [dict objectForKey:key];
//            NSArray *items=@[@"name",@"number",@"amount",@"imageName"];
//            int pointr = [items indexOfObject:key];
//
//            switch (pointr) {
//                case 0:{
//                    [row.labell setText:data];
//                    break;
//                }
//                case 1:{
//                    [row.number setText:data];
//                    break;
//                }
//                case 3:{
//                    [row.image setImageNamed:data];
//                    break;
//                }
//                default:{
//                    break;
//                }
//            }
//
//        }
    }
}

-(void)table:(WKInterfaceTable *)_card didSelectRowAtIndex:(NSInteger)rowIndex{
    NSArray* plist = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Cards" ofType:@"plist"]];
    
    NSDictionary *dict = [plist objectAtIndex:rowIndex];
    [self pushControllerWithName:@"SecondScreenInterfaceController" context:dict];
}

@end



