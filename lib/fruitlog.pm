package fruitlog;
use Dancer2;

use Util::Database;
use Util::Image;

our $VERSION = '0.1';

get '/' => sub {

    my $sth  = Util::Database::fetch_images();

    my @imgs;
    while(my @row = $sth->fetchrow_array) {
        unshift @imgs, {
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
    # "don't want to let just anyone post, too lazy to make this look nice"; 
    template 'post';
};

post '/post' => sub {
    my $data = request->upload('file');

    my $dir = path(config->{'public_dir'}, 'tmp');
    
    my $path = path($dir, $data->basename);

    if(-e $path) {
        return "file already exists";
    }

    $data->copy_to($path) || die "failed to copy files!\n";

    my $hex = Util::Image::img_to_base64($path);
    Util::Database::add_image($hex);
   
    unlink($path);

    redirect "/";
};


1;
