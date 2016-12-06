use strict;
use warnings;

use DBI;

my $driver = "Pg";
my $dbname = "db378ps1famcsf";
my $host   = "ec2-54-243-201-116.compute-1.amazonaws.com";
my $port   = 5432;
my $dsn    = "DBI:$driver:dbname=$dbname;host=$host;port=$port";

my $user   = "xnrqjtxsfmyezd";
my $pass   = '0bp7HC-esSRU8vo_0XnHgiSgVc';

my $db     = DBI->connect($dsn, $user, $pass, {RaiseError => 1}) or die "Failed To Connect To Database. \n";

print "Succesfully Connect To Database\n";


my $sql = "TRUNCATE users";
$db->do($sql) or die "Failed To Remove Database\n";
