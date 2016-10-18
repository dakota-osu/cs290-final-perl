#!/usr/bin/env perl

use strict;
use warnings;
use Plack::Builder;

use lib 'lib';

use fruitlog;

builder {
    mount '/' => fruitlog->to_app,
};
