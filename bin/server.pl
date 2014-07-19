#!/usr/bin/perl 
# Listen to the specified port, print received data

use IO::Socket::INET;

# flush after every write
$| = 1;

my ($socket,$received_data);

$socket = new IO::Socket::INET (
	LocalAddr 	=> '127.0.0.1',
	LocalPort 	=> '514',
	Proto 		=> 'udp',
) or die "ERROR in Socket Creation : $!\n";

while ( $socket->recv( $recieved_data, 4096 ) ) {
    print "RECEIVED: $recieved_data\n";
}
