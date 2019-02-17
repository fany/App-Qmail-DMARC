use 5.014;

package Mail::Qmail::Queue::Message::Extended;

use base 'Mail::Qmail::Queue::Message';

# Use inside-out attributes to avoid interference with base class:
my %header;

sub header {
    my $self = shift;
    return $header{$self} if exists $header{$self};
    open my $fh, '<', $self->body_ref or die 'Cannot read message';
    require Mail::Header;
    $header{$self} = Mail::Header->new($fh);
}

sub header_from {
    my $from = shift->header->get('From') or return;
    require Mail::Address;
    ($from) = Mail::Address->parse($from);
    $from;
}

sub helo {
    my $header = shift->header;
    my $received = $header->get('Received') or return;
    $received =~ /^from .*? \(HELO (.*?)\) / or return;
    $1;
}

sub add_header {
    my $self = shift;
    ${$self->body_ref} = join "\n", @_, $self->body;
}

sub DESTROY {
    my $self = shift;
    delete $header{$self};
}

1;

__END__
