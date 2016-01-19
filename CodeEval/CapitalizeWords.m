/*Objective-C programs are executed via GNUStep on Linux*/


#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
    
    // read filename from the first argument
    NSString* filename = [NSString stringWithCString:argv[1] encoding:NSASCIIStringEncoding];
    NSString* content = [NSString stringWithContentsOfFile:filename encoding:NSASCIIStringEncoding error:nil];
    NSScanner* scanner = [NSScanner scannerWithString:content];
    
    while (![scanner isAtEnd]) {
        NSString* line;
        [scanner scanUpToString:@"\n" intoString:&line];
        
        NSArray *strArray = [line componentsSeparatedByString:@" "];
        NSMutableArray *newArray = [[NSMutableArray alloc] init];
        
        for(NSString *str in strArray)
        {
            NSMutableString *newStr = [[NSMutableString alloc] init];
            char c = [str characterAtIndex:0];
            
            if(!isdigit(c))
            {
                [newStr appendFormat:@"%c",toupper(c)];
                [newStr appendString:[str substringFromIndex:1]];
                [newArray addObject:newStr];
            }
            else{
                [newArray addObject:str];
            }
            
            
        }
        
        // output an answer
        printf("%s\n", [[newArray componentsJoinedByString:@" "] cStringUsingEncoding:NSASCIIStringEncoding]);
    }
    
    [pool release];
    return 0;
}
