
backend gadmin_zwt_w3
{
    .host = "220.181.158.61"  ;
    .port = "8360";
    .probe = {
        .url = "http://api.gadmin.svc.1360.com/svc.php?do=help";
        .interval  = 5s ;
        .timeout   = 3s ;
        .window    = 5 ;
        .threshold = 3 ;
    }
}


backend gadmin_ccp_w13
{
    .host = "58.68.227.121"  ;
    .port = "8360";
    .probe = {
        .url = "http://api.gadmin.svc.1360.com/svc.php?do=help";
        .interval  = 5s ;
        .timeout   = 3s ;
        .window    = 5 ;
        .threshold = 3 ;
    }
}


director  gadmin_director round-robin
{
    {
        .backend = gadmin_zwt_w3  ;
    }
    {
        .backend = gadmin_ccp_w13  ;
    }
}

sub vcl_recv {

    if (req.http.host ~ "api.gadmin.svc.1360.com" )
    {
        set req.backend =  gadmin_director ;
        unset req.http.Cookie ;
        if(req.request == "DELETE" || req.request == "PUT" ||  req.request == "POST" ) 
        {

            ban( "req.http.host == "  + req.http.host +  " &&  req.url ~ " +  regsuball( regsuball(req.url,"\.","\.") , "\?.*",".*") ) ;
        }

    }
}
