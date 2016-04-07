if test $# -ne 1 ; then 
    echo "-----------import sdk vcl --------------------"
    echo "useage: $0  <vcl_file>"

fi 
SRC_VCL=$1
LPATH=/etc/local_proxy/app

VCL=`basename $SRC_VCL`
VCL_PATH=`dirname $SRC_VCL`
DST_VCL=$LPATH/$VCL

#机房适配

cp -f $SRC_VCL $DST_VCL
cd /data/x/projects/local_proxy ;
/data/x/tools/rigger-ng/rg  reconf,reload -q
