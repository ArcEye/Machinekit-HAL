#!/bin/sh
set -xe 
if [ -z "$MACHINEKIT_INCLUDE" ]; then
    HEADERS=$(readlink -f ../../../include)
else
    HEADERS=${MACHINEKIT_INCLUDE}
fi
for i in $HEADERS/*.h; do
    case $i in
    */rtapi_app.h) continue ;;
    */rtapi_common.h) continue ;;
    */rtai-kernel.h) continue ;;
    */xenomai-kernel.h) continue ;;
    */*.pb.h) continue ;;
    */container.h) continue ;;
    esac
    gcc -DULAPI -I$HEADERS -E -x c $i > /dev/null
done
for i in $HEADERS/*.h $HEADERS/*.hh; do
    case $i in
    */rtapi_app.h) continue ;;
    */rtapi_common.h) continue ;;
    */interp_internal.hh) continue ;;
    */rtai-kernel.h) continue ;;
    */xenomai-kernel.h) continue ;;
    */*.pb.h) continue ;;
    */container.h) continue ;;
    esac
    g++ -DULAPI -I$HEADERS -E -x c++ $i > /dev/null
done
