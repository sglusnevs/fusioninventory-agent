package FusionInventory::Agent::Task::NetDiscovery::Manufacturer::Ricoh;

use strict;
use warnings;

sub discovery {
    my ($empty, $description, $session) = @_;

    if ($description =~ m/RICOH NETWORK PRINTER/) {
        my $description_new = $session->snmpGet({
            oid => '.1.3.6.1.4.1.11.2.3.9.1.1.7.0',
            up  => 1,
        });
        if (($description_new ne "null") && ($description_new ne "No response from remote host")) {
            $description = $description_new;
        }
    }

    return $description;
}

1;
