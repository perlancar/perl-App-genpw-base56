package App::genpw::base56;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use App::genpw ();

our %SPEC;

my %args = %{$App::genpw::SPEC{genpw}{args}};
delete $args{patterns};
delete $args{case};

$SPEC{genpw} = {
    v => 1.1,
    summary => 'Generate random password using base56 characters',
    description => <<'_',

_
    args => {
        %args,
    },
    examples => [
    ],
};
sub genpw {
    my %args = @_;

    my $min_len = $args{len} // $args{min_len} // 8;
    my $max_len = $args{len} // $args{max_len} // 20;

    App::genpw::genpw(
        %args,
        patterns => ["%${min_len}\$${max_len}B"],
    );
}

1;
# ABSTRACT:

=head1 SYNOPSIS

See the included script L<genpw-base56>.


=head1 SEE ALSO

L<https://en.wikipedia.org/wiki/Base56>

L<genpw> (from L<App::genpw>)

L<genpw-base58> (from L<App::genpw::base58>)
