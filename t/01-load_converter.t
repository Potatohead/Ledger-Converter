#!perl -T

use Test::Most tests => 6;

BEGIN {
    use_ok( 'Ledger::Converter' ) || print "Bail out!
";
}

my $test_converter;

lives_ok {
  $test_converter = Ledger::Converter->new(
    account => 'test', 
    format => 'Commonwealth',
    input_file => '/tmp/file',
  )
}  'Converter creates ok';

my $format;

lives_ok {
  $format = $test_converter->_converter
} 'Survives Converter creation';

isa_ok $format, 
  'Ledger::Converter::Format::Commonwealth', 
  'Created the right kind of converter';

lives_ok {
  $test_converter = Ledger::Converter->new(
    account => 'test', 
    format => 'Commonwealth2',
    input_file => '/tmp/file',
  )
}  'Converter with wrong format creates ok';

throws_ok {$test_converter->_converter} 
  qr/^Format Commonwealth2 is not available to the converter/,
  'Throws converter unavailable error';



