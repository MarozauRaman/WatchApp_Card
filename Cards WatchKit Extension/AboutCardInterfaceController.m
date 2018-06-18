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
    int i=0;
    while(i<(num-1)){
        
        for(id key in info){
            
            NSString* data = [info objectForKey:key];

            
            NSArray *items=@[@"name",@"number",@"amount",@"imageName"];
            int pointr = [items indexOfObject:key];
            InfoTableRowController* row = [self.cardAbout rowControllerAtIndex:pointr];
            switch (pointr) {
                case 0:{
                    
                    [row.labell setText:@"Название"];
                    [row.data setText:data];
                    break;
                }
                case 1:{
               
                    [row.labell setText:@"Номер"];
                    [row.data setText:data];
                    break;
                }
                    
                case 2:{
                    [row.labell setText:@"IBAN"];
                    [row.data setText:@"IBAN Number"];
                    
                    break;
                }
                case 3:{
                    [row.labell setText:@"Срок действия карты"];
                    [row.data setText:@"Term"];
                }
                default:{
                    break;
                }
                    
            }
            
            i++;
        
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



