use inc::Module::Install;

name     'Ledger-Converter';
all_from 'lib/Ledger/Converter.pm';
author   q{Christopher Mckay <potatohead@potatolan.com>};
license  'perl';

build_requires 'Test::More';

auto_install;

WriteAll;

