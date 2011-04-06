package TrimJ::Tags;

use strict;

sub _filter_trimj_to {
    my ( $text, $arg, $ctx ) = @_;
    my ( $trim_witdth, $ellipsis );
    if ( ref $arg eq 'ARRAY' ) {
        $trim_witdth = @$arg[0];
        $ellipsis = @$arg[1];
    } else {
        $trim_witdth = $arg;
    }
    if (! $text ) {
        return $ellipsis;
    }
    my $trim_witdth = $trim_witdth * 2;
    my @strs = split( //, $text );
    my $length = 0;
    my $out = '';
    for my $str ( @strs ) {
        $out .= $str;
        if ( bytes::length( $str ) > 1 ) {
            $length += 2;
        } else {
            $length += 1;
        }
        if ( $length >= $trim_witdth ) {
            last;
        }
    }
    if ( $out ne $text ) {
        $out .= $ellipsis;
    }
    return $out;
}

1;