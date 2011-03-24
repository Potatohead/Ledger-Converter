use inc::Module::Install;

name     'Ledger-Converter';
all_from 'lib/Ledger/Converter.pm';
author   q{Christopher Mckay <potatohead@potatolan.com>};
license  'perl';

build_requires 'Test::More';

requires 'MooseX::Declare';
requires 'Try::Tiny';
requires 'MooseX::Types::Path::Class';
requires 'Class::MOP';
requires 'Text::CSV';
requires 'DBIx::Class';
requires 'autodie';

auto_install;

WriteAll;

