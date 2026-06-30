#include <vector>

int main() 
{
    std::vector<int> data = {10, 20, 30, 40, 50};
    volatile int checksum = 0;
    
    for (int i = 0; i < 1000; i++) 
    {
        for (int val : data) 
        {
            checksum += (val ^ i);
        }
    }
    
    return 0;
}