'use strict';

const applicantForm = document.getElementById('equation_form');
applicantForm.addEventListener('submit', (event) => {
    event.preventDefault();

    let a = document.getElementById('a').value;
    let b = document.getElementById('b').value;
    let c = document.getElementById('c').value;

    document.getElementById('result').textContent = solve_and_show_result(a, b, c);
    document.getElementById('result-header').classList.toggle('hidden');
});

function solve_and_show_result(a, b, c) {
    if (a === 0){
        return "Error, 'а' cannot be zero!";
    }
    let discriminant = b * b - 4 * a * c;
    let x1, x2;
    let result = "Discriminant(D) = " + discriminant + ", \n";
    if (discriminant > 0) {
        x1 = (-b + Math.sqrt(discriminant)) / (2 * a);
        x2 = (-b - Math.sqrt(discriminant)) / (2 * a);
        result += "Complex roots: x1 = " + x1.toFixed(2) + ", x2 = " + x2.toFixed(2);
    } else if (discriminant === 0) {
        x1 = -b / (2 * a);
        result += "Double root: x = " + x1.toFixed(2);
    } else {
        result += "No real roots!";
    }
    return result;
}