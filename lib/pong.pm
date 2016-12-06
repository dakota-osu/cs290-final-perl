package pong;
use Dancer2;

our $version = '0.2';

get '/' => sub {
    "Hello, World!";
};



###############################
# Handle Logging In 
###############################
post '/login' => sub {

    my $user_name = params->{user_name};
    my $password  = params->{password};
};


1;
