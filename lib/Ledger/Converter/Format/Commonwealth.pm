use MooseX::Declare;

=head1 NAME

Ledger::Converter::Format::Commonwealth - Formatter that understands
commonwealth bank csv's

=head1 VERSION

Version 0.01

=cut

class Ledger::Converter::Format::Commonwealth with Ledger::Converter::Format {
  our $VERSION = '0.01';

  use Try::Tiny;
  use Text::CSV;
  use autodie;

  has '_csv_handler' => (
    is => 'ro',
    isa => 'Text::CSV',
    lazy_build => 1,
  );

  method _build__csv_handler {
    my $csv_handler = Text::CSV->new( { binary => 1 } ); 
    $csv_handler->column_names(qw/date amount description balance/);
    return $csv_handler;
  }

  has '_schema' => (
    is => 'ro',
    isa => 'Ledger::Converter::Format::Commonwealth::Schema',
    lazy_build => 1,
  );

  method _build__schema {
    my $schema = Ledger::Converter::Format::Commonwealth::Schema->connect(
      'dbi:SQLite:/home/potato/ledger_commonwealth.sqlite'
    );

    return $schema;
  }

  method convert {
    my $fh = $self->input_file->openr; 

    while (my $row = $self->_csv_handler->getline_hr($fh))
    {
      my ($payee, $note) = split /\s{2,}/, $row->{description}, 2;


    }

    return;
  }
}

__END__

=head1 AUTHOR

Christopher Mckay, C<< <potatohead at potatolan.com> >>

=head1 LICENSE AND COPYRIGHT

Copyright 2011 Christopher Mckay.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut
