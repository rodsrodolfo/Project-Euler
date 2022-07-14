use std::cmp::max;
use std::fs;

const FILENAME: &str = "ID_8_source.txt";
const ADJ_NUM: usize = 13;

fn main() {
    let largest: usize = find_largest_product(ADJ_NUM, FILENAME);

    println!("{}", largest);
}

fn read_num_str(filename: &str) -> String {
    let mut num: String = "".to_owned();

    let contents: String = fs::read_to_string(filename).expect("error reading file");
    let lines: Vec<&str> = contents.split("\n").collect::<Vec<&str>>();

    for line in lines {
        num.push_str(line);
    }

    num
}

fn product_slice(slice: &str) -> usize {
    let mut prod: usize = 1;

    for digit in slice.chars() {
        prod *= digit.to_string().parse::<usize>().unwrap();
    }

    prod
}

fn find_largest_product(adjacent_num: usize, filename: &str) -> usize {
    let mut largest: usize = 0;
    let num: String = read_num_str(filename);
    let limit: usize = num.len() - adjacent_num;

    for i in 0..=limit {
        largest = max(largest, product_slice(&num[i..i + adjacent_num]))
    }

    largest
}
