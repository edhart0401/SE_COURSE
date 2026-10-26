#include <iostream>
#include <vector>
#include <algorithm>

int main() {
    std::vector<int> nums = {1, 2, 3, 4, 5};

    auto it = std::find(nums.begin(), nums.end(), 3);

    std::cout << *it << '\n';
    return 0;
}