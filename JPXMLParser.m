//
//  JPXMLParser.m
//  JPOperationBuilder
//
//  Created by Joshua Phelps on 10/4/11.
//  Copyright 2011 Joshua T. Phelps. All rights reserved.
//

#import "JPXMLParser.h"

@implementation JPXMLParser

@synthesize delegate;

- (id)init
{
    self = [super init];
    if (self) {
        _stack = [[NSMutableArray alloc]init];		
    }
    
    return self;
}

-(void)dealloc
{
	[_stack release];
	[_parser release];
	[super dealloc];
}

-(JPTreeNode*)parseXMLFile:(NSData*)xml
{
	if(_parser) [_parser release];
	if(_root) [_root release];
	
	_root = [[JPTreeNode alloc]init];
	_root.children = [[[NSMutableArray alloc]init]autorelease];
	_root.leafValue = nil;
	
	_parser = [[NSXMLParser alloc]initWithData:xml];
	_parser.delegate = self;
	[_parser parse];
	[_parser release];
	
	return [_root autorelease];
}

#pragma mark - NSXMLParserDelegate methods

-(void)parserDidStartDocument:(NSXMLParser *)parser
{
	
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI 
qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	
}

-(void)parserDidEndDocument:(NSXMLParser *)parser
{
	
}

@end
