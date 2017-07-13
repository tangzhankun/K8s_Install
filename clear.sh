#!/bin/bash 
iptables-save | awk '/^[*]/ { print $1 } 
                     /^:[A-Z]+ [^-]/ { print $1 " ACCEPT" ; }
                                          /COMMIT/ { print $0; }' | iptables-restore
