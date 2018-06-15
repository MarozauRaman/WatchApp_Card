//
//  AboutCardInterfaceController.m
//  Cards WatchKit Extension
//
//  Created by Practice on 11.06.2018.
//  Copyright © 2018 Practice. All rights reserved.
//

#import "AboutCardInterfaceController.h"
#import "InfoTableRowController.h"

@interface AboutCardInterfaceController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *cardAbout;



@end

@implementation AboutCardInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
    [self setTitle:@"О карте"];
    NSDictionary* info =(NSDictionary*)context;
    int num = info.count;
    [self.cardAbout setNumberOfRows:num-1 withRowType:@"InfoTableRowController"];

        
        for(id key in info){
            
            NSString* data = [info objectForKey:key];

            if([key isEqual:@"Title"]){
                InfoTableRowController* row = [self.cardAbout rowControllerAtIndex:0];
                [row.labell setText:@"Название"];
                [row.data setText:data];
            }
            if([key isEqual:@"Number"]){
                InfoTableRowController* row = [self.cardAbout rowControllerAtIndex:1];
                [row.labell setText:@"Номер"];
                [row.data setText:data];
            }
            if([key isEqual:@"IBAN"]){
                InfoTableRowController* row = [self.cardAbout rowControllerAtIndex:2];
                [row.labell setText:@"IBAN"];
                [row.data setText:data];
            }
            if([key isEqual:@"Term"]){
                InfoTableRowController* row = [self.cardAbout rowControllerAtIndex:3];
                [row.labell setText:@"Срок действия карты"];
                [row.data setText:data];
            }
            
            
        }
    
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
    
 
}

@end



