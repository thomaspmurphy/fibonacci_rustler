# FibonacciRustler

This is a project to experiment with offloading arithmetic to Rustler from an Elixir app. It also demonstrates the massive variation in perf characteristics betwen the linear time complexity of an iterative approach versus the exponential time of the recursive approach.

## Why The Recursive Implementation is Expected to be Faster

### Time Complexity

The recursive implementation of the Fibonacci function has an exponential time complexity of $O(2^n)$. This is because it makes two recursive calls for each non-base case, leading to a binary tree of calls.

In contrast, the iterative implementation has a linear time complexity of $O(n)$. This is because it uses a simple loop to calculate the Fibonacci number, making a constant amount of work for each increment of $n$.

### Mathematical Explanation

Let's denote the time complexity of the recursive Fibonacci function as $T_{\text{rec}}(n)$ and the iterative Fibonacci function as $T_{\text{iter}}(n)$.

For the recursive function:

```math
T_{\text{rec}}(n) = T_{\text{rec}}(n-1) + T_{\text{rec}}(n-2) + O(1)
```

This recurrence relation leads to an exponential growth:

```math
T_{\text{rec}}(n) = O(2^n)
```

For the iterative function:

```math
T_{\text{iter}}(n) = O(n)
```

This is because the iterative approach calculates the Fibonacci number by iterating from 0 to $n$, performing a constant amount of work in each iteration. Therefore, the total work done is proportional to $n$.

### Performance Comparison

Given the exponential time complexity of the recursive function and the linear time complexity of the iterative function, we can expect the iterative function to be significantly faster for large values of $n$.

For example, if $n = 30$:
- The recursive function would take approximately $2^{30} \approx 1,073,741,824$ operations.
- The iterative function would take approximately $30$ operations.

This vast difference in the number of operations explains why the Rust implementation is expected to be faster.

## Conclusion

This project demonstrates how to use Rustler to create a NIF in Rust and compare its performance with an Elixir implementation. The iterative implementation is expected to be faster due to the time complexity features demonstrated above. The Rust implementation is expected to be faster due to the lower-level optimizations available in Rust.

## License

This project is licensed under the MIT License.