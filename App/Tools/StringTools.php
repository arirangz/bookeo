<?php

namespace App\Tools;

class StringTools
{

    public static function toCamelCase($value, $pascalCase = false){
        $value = ucwords(str_replace(array('-', '_'), ' ', $value));
        $value = str_replace(' ', '', $value);
        if ($pascalCase === false) {
            return lcfirst($value);
        } else {
            return $value;
        }
    }
    public static function toPascalCase($value){

        return self::toCamelCase($value, true);
    }

}