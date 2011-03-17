use MooseX::Declare;

=head1 Name

Ledger::Converter::Format - Role defining what a formatter should do

=head1 VERSION

Version 0.01

=cut

role Ledger::Converter::Format {
  our $VERSION = '0.01';

  use MooseX::Types::Path::Class;

  has 'input_file' => (
    is => 'ro', 
    isa => 'Path::Class::File', 
    required => 1,
    coerce => 1);

  requires 'convert';
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
