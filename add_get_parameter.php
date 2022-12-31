<?php

$homepage = file_get_contents('http://localhost/im.test/example.html');

print htmlspecialchars($homepage);

$out_html = modify_html($homepage);

print htmlspecialchars($out_html);
print $out_html;

function modify_html($html) {
    $dom = new DOMDocument;
    $dom->loadHTML($html);

    add_get_parameter($dom, 'a', 'href');
    add_get_parameter($dom, 'img', 'src');
    add_get_parameter($dom, 'script', 'src');

    return $dom->saveHTML();
}

function add_get_parameter($dom, $tag, $attribute) {
    $tags = $dom->getElementsByTagName($tag);
    foreach ($tags as $teg) {
        $attribute_value = $teg->getAttribute($attribute);
        $teg->setAttribute($attribute,
                $attribute_value . '?v=' . crc32($attribute_value));
    }
}