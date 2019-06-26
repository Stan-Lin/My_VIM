#include <iostring> 
#include <string> 
#include "lib/my_class.h" 
using namespace std; 
int g_num = 128; 
// 重載函數 
    static void 
printMsg (char ch) 
{ 
    std::cout << ch << std::endl; 
} 
    int 
main (void) 
{ 
    // 局部對象
    const string    name = "yangyang.gnu"; 
    // 類 
    MyClass one; 
    // 成員函數 
    one.printMsg(); 
    // 使用局部對象 
    cout << g_num << name << endl; 
    return  (EXIT_SUCCESS); 
} 
