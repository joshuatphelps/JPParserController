//
//  JPTreeNode.h
//  JPOperationBuilder
//
//  Created by Joshua Phelps on 10/4/11.
//  Copyright 2011 Joshua T. Phelps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JPTreeNode : NSObject
{
	JPTreeNode *_parent;
	NSMutableArray *_children;
	
	NSString *_key;
	NSString *_leafValue;

	NSDictionary *_attributes;
}

@property (nonatomic, retain) JPTreeNode *parent;
@property (nonatomic, retain) NSArray *children;
@property (nonatomic, retain) NSString *key;
@property (nonatomic, retain) NSString *leafValue;
@property (nonatomic, retain) NSDictionary *attributes;

@end
