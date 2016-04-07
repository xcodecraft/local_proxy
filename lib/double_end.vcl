backend ${L_TAG}_backend_1 {
    .host = "${L_BEND_1}";
    .port = "${L_PORT}" ;
    .host_header = "${L_HOST}" ;
    .probe = {
        .url       = "${L_CHECK}";
        .timeout   = 1s;
        .interval  = 5s;
        .window    = 5;
        .threshold = 3;
    }
}

backend ${L_TAG}_backend_2 {
    .host = "${L_BEND_2}";
    .port = "${L_PORT}" ;
    .host_header = "${L_HOST}" ;
    .probe = {
        .url       = "${L_CHECK}";
        .timeout   = 1s;
        .interval  = 5s;
        .window    = 5;
        .threshold = 3;
    }
}

sub vcl_init {
    new ${L_TAG}_direct = directors.round_robin();
    ${L_TAG}_direct.add_backend(${L_TAG}_backend_1);
    ${L_TAG}_direct.add_backend(${L_TAG}_backend_2);
}

sub vcl_recv {

    if (req.http.host ~ "${L_HOST}") {
        std.log("set ${L_HOST} backend ") ;
        set req.backend_hint = ${L_TAG}_direct.backend() ;
    }
}

