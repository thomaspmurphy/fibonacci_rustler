use rustler::{Atom};

mod atoms {
    rustler::atoms! {
        ok,
    }
}

#[rustler::nif]
fn fibonacci_iterative(n: u64) -> (Atom, u64) {
    let result = match n {
        0 => 0,
        1 => 1,
        _ => {
            let mut a = 0;
            let mut b = 1;
            for _ in 2..=n {
                let temp = a + b;
                a = b;
                b = temp;
            }
            b
        }
    };
    (atoms::ok(), result)
}

#[rustler::nif]
fn fibonacci_recursive(n: u64) -> (Atom, u64) {
    fn fib(n: u64) -> u64 {
        match n {
            0 => 0,
            1 => 1,
            _ => fib(n - 1) + fib(n - 2),
        }
    }
    (atoms::ok(), fib(n))
}

rustler::init!("Elixir.FibonacciRustler");