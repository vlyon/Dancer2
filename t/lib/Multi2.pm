package t::lib::Multi2;

use Dancer2;
use t::lib::Multi1 with => { appname => __PACKAGE__ };

get '/2' => sub {__PACKAGE__};

1;
