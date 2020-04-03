Example 1:
Input:
matrix = [
  [1,   3,  5,  7],
  [10, 11, 16, 20],
  [23, 30, 34, 50]
]
target = 3
Output: true

3X 4
low = [0][0 + 1]
mid = [1 - 1][2-1] 
up = [3][4]

Example 2:
Input:
matrix = [
  [1,   3,  5,  7],
  [10, 11, 16, 20],
  [23, 30, 34, 50]
]
target = 13
Output: false

function searchMatrix(matrix, target) {
    let midx = parseInt(matrix.length / 2);
    let midy = parseInt(matrix[0].length / 2);

    let mid = matrix[midx, midy];
    while (midx >= 0 && midy >= 0) {
        if (mid === target) return true;
        if (mid > target) {
            if (matrix[midx][0] > target) midx--;
            else midy--;
        } else {
            
        }
    }
    return false;
}