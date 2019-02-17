#!perl -T
use 5.014;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Mail::Qmail::DMARC' ) || print "Bail out!\n";
}

diag( "Testing Mail::Qmail::DMARC $Mail::Qmail::DMARC::VERSION, Perl $], $^X" );
