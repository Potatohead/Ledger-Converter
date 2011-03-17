#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Ledger::Converter' ) || print "Bail out!
";
}

diag( "Testing Ledger::Converter $Ledger::Converter::VERSION, Perl $], $^X" );
