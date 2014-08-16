package t::lib::Multi1;

use Dancer2;

get '/1' => sub {__PACKAGE__};

1;
