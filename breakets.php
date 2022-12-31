<?php
$strings = array('(){}[]', '(}', '[(])', '([{}])');

foreach ($strings as $string) {
    print ($string . ' - ');
    if (check_string($string)) {
        print('passed.');
    } else {
        print('not passed.');
    }
    print('<br>');
}

function check_string($string): bool {
    $stack = array();
    $brackets = str_split($string);

    foreach ($brackets as $bracket) {
        if (!check_bracket($bracket, $stack)) {
            return false;
        }
    }
    return true;
}

function check_bracket($bracket, &$stack): bool {
    switch ($bracket) {
        case '(':
        case '[':
        case '{':
            array_unshift($stack, $bracket);
            break;
        default:
            if (empty($stack) || !is_brackets_pair($bracket, array_shift($stack))) {
                return false;
            }
            break;
    }
    return true;
}

function is_brackets_pair($right_bracket, $left_bracket): bool {
    if (($right_bracket == ')' && $left_bracket != '(') ||
            ($right_bracket == ']' && $left_bracket != '[') ||
            ($right_bracket == '}' && $left_bracket != '{')) {
        return false;
    }
    return true;
}