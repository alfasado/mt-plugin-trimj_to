<?php
function smarty_modifier_trimj_to ( $text, $trim_witdth, $ellipsis = '' ) {
    if (! $text ) return $ellipsis;
    $strs = _trimj_to_mb_str_split( $text );
    $length = 0;
    $out = '';
    $trim_witdth = $trim_witdth * 2;
    foreach ( $strs as $str ) {
        $out .= $str;
        $length += mb_strwidth( $str );
        if ( $length >= $trim_witdth ) {
            break;
        }
    }
    if ( $text != $out ) {
        $out .= $ellipsis;
    }
    return $out;
}
function _trimj_to_mb_str_split( $str, $length = 1 ) {
    if ( $length < 1 ) return FALSE;
    $result = array();
    for ( $i = 0; $i < mb_strlen( $str ); $i += $length ) {
        $result[] = mb_substr( $str, $i, $length );
    }
    return $result;
}
?>