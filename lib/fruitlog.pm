package fruitlog;
use Dancer2;

use Util::Database;
use Util::Image;

our $VERSION = '0.1';

get '/' => sub {

    my $sth  = Util::Database::fetch_images();

    my @imgs;
    while(my @row = $sth->fetchrow_array) {
        push @imgs, {
            content     => $row[0],
            date_posted => $row[1]
        };
    }

    template 'index', {
        imgs => \@imgs,
    };
};


###########################
# Private Bits
###########################

get '/post' => sub {
    template 'post';
};

post '/post' => sub {
    my $data = request->upload('file');

    my $dir = path(config->{'appdir'}, 'tmp');
    
    my $path = path($dir, $data->basename);

    if(-e $path) {
        return "file aleady exists";
    }

    $data->link_to($path);

    my $hex = Util::Image::img_to_base64($path);
    Util::Database::add_image($hex);
   
    unlink($path);

    redirect "/";
};


1;