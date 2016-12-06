package Util::Database;

use strict;
use warnings;
use DBI;

our @EXPORT_OK = qw(add_image fetch_images);

my $driver = "Pg";
my $dbname = "db378ps1famcsf";
my $host   = "ec2-54-243-201-116.compute-1.amazonaws.com";
my $port   = 5432;
my $dsn    = "DBI:$driver:dbname=$dbname;host=$host;port=$port";

my $user   = "xnrqjtxsfmyezd";
my $pass   = '0bp7HC-esSRU8vo_0XnHgiSgVc';

sub get_database {
    DBI->connect($dsn, $user, $pass, {RaiseError => 1}) or die "Failed To Connect To Database. \n";
}

sub authenticate {
    my ($username, $password) = @_;

    my $sql = "SELECT password FROM users WHERE username LIKE (?)";
    my $db  = get_database();
    my $sth = $db->prepare($sql);
    $sth->execute($username);

    my @row = $sth->fetchrow_array;

    return $row[0] eq $password;
}

sub add_user {
    my ($username, $password, $bio) = @_;

    my $sql = "INSERT INTO users (username, password, bio) VALUES (?, ?, ?)";
    my $db  = get_database();
    my $sth = $db->prepare($sql);
    $sth->execute($username, $password, $bio);
}

# sub add_image {
#     my $data = shift;
# 
#     my $sql = "INSERT INTO fruitlog (content, date_posted) VALUES (?, CURRENT_DATE)";
#     my $db  = get_database();
#     my $sth = $db->prepare($sql);
#     $sth->execute($data);
# }
# 
# sub fetch_images {
#     my $sql = "SELECT content, date_posted FROM fruitlog";
#     my $db  = get_database();
#     my $sth = $db->prepare($sql);
#     $sth->execute or warn "Failed To Select Data";
# 
#     $sth;
# }

1;
