backend ${PRJ_NAME}_backend {
    .host = "${L_BEND}";
    .port = "${L_PORT}" ;
    .host_header = "${L_HOST}" ;
    .probe = {
        .url = "${L_CHECK}";
        .timeout = 1s;
        .interval = 5s;
        .window = 5;
        .threshold = 3;
    }
}

sub vcl_recv {

    if (req.http.host ~ "${L_HOST}") {
        std.log("set ${L_HOST} backend ") ;
        set req.backend_hint = ${PRJ_NAME}_backend ;
    }
}

