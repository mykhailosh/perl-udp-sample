#!/usr/bin/perl
# Sends udp data to the server

use IO::Socket::INET;

# flush after every write
$| = 1;

my ($socket,$data);

#  We call IO::Socket::INET->new() to create the UDP Socket 
# and bind with the PeerAddr.
$socket = new IO::Socket::INET (
	PeerAddr     => '127.0.0.1:514',
	Proto        => 'udp'
) or die "ERROR in Socket Creation : $!\n";

while (1) {
	my $time = time();
	print "SENDED: $time\n";
	$socket->send( $time );
	sleep 1;
}
