//
//  JPURLDownloader.m
//  JPOperationBuilder
//
//  Created by Joshua Phelps on 10/4/11.
//  Copyright 2011 Joshua T. Phelps. All rights reserved.
//

#import "JPURLDownloader.h"

@implementation JPURLDownloader

@synthesize delegate;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
		_data = [[NSMutableData alloc]init];
	}
    return self;
}

-(void)dealloc
{
	if(_urlConnection) [_urlConnection release];
	[_data release];
	[super dealloc];
}

-(void)fetchXMLAtURL:(NSString*)url
{
	[self fetchXMLAtURL:url headerFields:nil];
}

-(void)fetchXMLAtURL:(NSString*)xmlUrl headerFields:(NSDictionary*)headerFields
{
	NSURL *url = [NSURL URLWithString:xmlUrl];
	
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
	[request setHTTPMethod:@"GET"];
	
	for(NSString *key in headerFields)
	{
		[request addValue:[headerFields objectForKey:key] forHTTPHeaderField:key];
	}

	_urlConnection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
}

#pragma mark - NSURLConnectionDelegate methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[_data appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if(self.delegate && [self.delegate respondsToSelector:@selector(jpURLDownloaderDidFinish:withData:)])
	{
		[self.delegate jpURLDownloaderDidFinish:self withData:_data];
	}
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	if(self.delegate && [self.delegate respondsToSelector:@selector(jpURLDownloaderDidFail:)])
	{
		[self.delegate jpURLDownloaderDidFail:self];
	}
}

@end
