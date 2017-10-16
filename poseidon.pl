#!/usr/bin/env perl

BEGIN{push(@INC, ".")};
BEGIN{push(@INC, "./net")};

package main;
use strict;
use Getopt::Long;
use ragnarok_server;
use query_server;

STDOUT->autoflush(1);
STDERR->autoflush(1);

my $ragnarok_port = '6900';
my $query_port = '24390';

GetOptions(
	'ragnarok-port=s' => \$ragnarok_port,
	'query-port=s' => \$query_port,
	'char-server=s' => \$ragnarok_server::char_server,
	'map-server=s' => \$ragnarok_server::map_server,
) or dir $!;


ragnarok_server::init($ragnarok_port);
query_server::init($query_port);

while (1) {
	ragnarok_server::loop(0);
	query_server::loop(0.1);
}
