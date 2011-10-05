//
//  JPXMLParser.h
//  JPOperationBuilder
//
//  Created by Joshua Phelps on 10/4/11.
//  Copyright 2011 Joshua T. Phelps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JPTreeNode.h"

@protocol JPXMLParserDelegate;

@interface JPXMLParser : NSObject <NSXMLParserDelegate>
{
	int _totalChildren;
	int _childrenParsed;
	float _progress;

	NSMutableArray *_stack;
	NSXMLParser *_parser;
	
	JPTreeNode *_root;
}

@property (nonatomic, retain) id <JPXMLParserDelegate> delegate;

-(JPTreeNode*)parseXMLFile:(NSData*)xml;

@end

@protocol JPXMLParserDelegate <NSObject>

-(void)jpXMLParser:(JPXMLParser*)parser postedProgress:(NSNumber*)progress;

@end
