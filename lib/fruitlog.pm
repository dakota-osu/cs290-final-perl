package fruitlog;
use Dancer2;

our $VERSION = '0.1';

get '/' => sub {
    template 'index';
};


###########################
# Private Bits
###########################

get '/post' => sub {

};

post '/post' => sub {

};

1;
