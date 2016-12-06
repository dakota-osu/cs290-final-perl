package pong;
use Dancer2;

our $version = '0.2';

get '/' => sub {
    "Hello, World!";
};


1;
