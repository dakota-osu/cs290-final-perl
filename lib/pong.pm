package pong;
use Dancer2;

our $version = '0.2';




get '/' => sub {
    template 'index', {
        page_title => "Welcome!!"
    };
};


###############################
# Handle Logging In / Signing Up
###############################
post '/login' => sub {

    my $user_name = params->{user_name};
    my $password  = params->{password};
    

    # fetch the row of users


};




1;
