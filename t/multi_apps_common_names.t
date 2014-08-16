use strict;
use warnings;
use Test::More skip_all => 'Lazy apps not yet available'; #tests => 5;
use Plack::Builder;
use Plack::Test;
use HTTP::Request::Common;

# load the "main" app
# which will load the rest
use t::lib::Multi2;

my $app = Dancer2->psgi_app();
isa_ok( $app, 'CODE', 'Got app' );

is( scalar @{ Dancer2->runner->apps }, 1, 'Got two Dancer Apps' );

is(
    Dancer2->runner->apps->[0]->name,
    't::lib::Multi2',
    'Multi1 has appname Multi2',
);

test_psgi $app, sub {
    my $cb = shift;

    is( $cb->( GET '/1' )->content, 't::lib::Multi1', 'Multi1' );
    is( $cb->( GET '/2' )->content, 't::lib::Multi2', 'Multi2' );
};

