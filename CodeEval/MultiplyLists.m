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
        NSArray *listsArray = [line componentsSeparatedByString:@" | "];
        NSArray *first = [listsArray[0] componentsSeparatedByString:@" "];
        NSArray *second = [listsArray[1] componentsSeparatedByString:@" "];
        NSMutableArray *valueArray = [[NSMutableArray alloc] init];
        if(first.count == second.count){
            for (int i=0; i <first.count ; i++)
            {
                int result = ([first[i] intValue] * [second[i] intValue]);
                [valueArray addObject:[NSString stringWithFormat:@"%i",result]];
            }
        }
        
        // output an answer
        printf("%s\n", [[valueArray componentsJoinedByString:@" "] cStringUsingEncoding:NSASCIIStringEncoding]);
    }
    
    [pool release];
    return 0;
}
