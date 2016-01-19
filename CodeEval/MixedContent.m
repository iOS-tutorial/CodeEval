/*Objective-C programs are executed via GNUStep on Linux*/


#import <Foundation/Foundation.h>

bool isNumber(NSString* str){
    
    for(int i=0; i <str.length; i++)
    {
        char c = [str characterAtIndex:i];
        
        if(!isdigit(c)){
            return false;
            }
       }
    return true;
       
}


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
        NSArray *mixedArray = [line componentsSeparatedByString:@","];
        NSMutableArray *numArray = [[NSMutableArray alloc] init];
        NSMutableArray *strArray = [[NSMutableArray alloc] init];
        
        for(NSString *element in mixedArray){
            if(isNumber(element)){
                [numArray addObject:element];
                
            }
            else{
                [strArray addObject:element];
            }
                
        }
        NSMutableString *printStr = [NSMutableString stringWithString:[strArray componentsJoinedByString:@","]];
        if(numArray.count > 0 && strArray.count > 0){
            [printStr appendString:@"|"];
        }
            [printStr appendString:[numArray componentsJoinedByString:@","]];
        
        
        // output an answer
        printf("%s\n", [printStr cStringUsingEncoding:NSASCIIStringEncoding]);
    }
    
    [pool release];
    return 0;
}
