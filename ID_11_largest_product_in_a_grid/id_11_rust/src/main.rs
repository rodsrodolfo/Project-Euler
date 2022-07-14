use ndarray::Array;

fn main() {
    let mut a = Array::zeros((2, 4));
    a[[1, 1]] = 1;
    println!("{}", a);
}
