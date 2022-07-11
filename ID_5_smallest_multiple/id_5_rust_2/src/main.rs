use std::cmp::max;
use std::collections::HashMap;

const NUM: u32 = 20;

fn main() {
    println!("{}", lcm(NUM));
}

fn factorize(mut num: u32) -> HashMap<u32, u32> {
    let mut factorization: HashMap<u32, u32> = HashMap::new();
    for i in 2..=num {
        while num % i == 0 {
            factorization.insert(
                i,
                if factorization.contains_key(&i) {
                    factorization[&i] + 1
                } else {
                    1
                },
            );
            num /= i;
        }
    }
    factorization
}

fn lcm(num: u32) -> u32 {
    let mut max_values: HashMap<u32, u32> = HashMap::new();
    let mut lcm_answer: u32 = 1;
    for i in 1..=num {
        for (key, val) in factorize(i).iter() {
            if max_values.contains_key(key) {
                max_values.insert(*key, max(*val, max_values[key]));
            } else {
                max_values.insert(*key, *val);
            }
        }
    }
    for (key, val) in max_values.iter() {
        lcm_answer *= u32::pow(*key, *val);
    }
    lcm_answer
}
