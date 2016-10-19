package Util::Image;

use strict;
use warnings;
use File::Slurp;
use MIME::Base64 qw(encode_base64);

use Exporter 'import';


our @EXPORT_OK = qw(img_to_base64);


sub img_to_base64 {
    encode_base64(read_file($_[0]));
}

1;
