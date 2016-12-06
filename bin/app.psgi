#!/usr/bin/env perl

use strict;
use warnings;
use Plack::Builder;

use lib 'lib';

use pong;

builder {
    mount '/' => pong->to_app,
};
