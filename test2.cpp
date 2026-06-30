#include <vector>

int computeChecksum(const std::vector<int>& data) 
{
    int sum = 0;
    for (int val : data) 
    {
        sum += (val ^ 0xDEADBEEF); 
    }
    return sum;
}

int main() 
{
    std::vector<int> buffer = {10, 20, 30, 40, 50};
    int result = computeChecksum(buffer);
    return result;
}