vcl 4.0 ;

import std ;
import directors ;

sub vcl_recv {
    if (req.method == "PURGE") {
        return (purge);
    }
}

