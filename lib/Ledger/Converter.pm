use MooseX::Declare;

=head1 NAME

Ledger::Converter - The great new Ledger::Converter!

=head1 VERSION

Version 0.01

=cut


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Ledger::Converter;

    my $foo = Ledger::Converter->new();
    ...

=cut

class Ledger::Converter {
  our $VERSION = '0.01';

  use Try::Tiny;
  use MooseX::Types::Path::Class;
  
  has ['account', 'format'] => ( is => 'ro', isa => 'Str', required => 1 );
  has '_converter' => ( is => 'ro', lazy_build => 1 );
  has 'input_file' => ( 
    is => 'ro', 
    isa => 'Path::Class::File', 
    required => 1,
    coerce => 1);

  method _build__converter {
    my $base = __PACKAGE__ . '::Format';

    return try {
      my $class = $base . '::' . $self->format;
      Class::MOP::load_class($class);
      return $class->new(input_file => $self->input_file);
    }
    catch {
      if ($_ =~ m/^Can't locate /)
      {
        die 'Format ' . $self->format . ' is not available to the converter';
      }
      else
      {
        die $_;
      }
    }
  }
}

__END__

=head1 AUTHOR

Christopher Mckay, C<< <potatohead at potatolan.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-ledger-converter at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Ledger-Converter>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Ledger::Converter


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2011 Christopher Mckay.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut
