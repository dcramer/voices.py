#!/usr/bin/env python
import socket
import multiprocessing

socket.setdefaulttimeout(5)

def scan(kwargs):
    ip, port = kwargs['ip'], kwargs['port']
    
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    result = s.connect_ex((ip, port))

    if(result == 0) :
        print '%s: OPEN (%s)' % (ip, port)
    s.close()

if __name__ == '__main__':
    print 'Starting scan on LAN'

    #scan reserved ports
    def iter_ips(port):
        for i in range(0, 255):
            i = 255 - i
            yield {'ip': '192.168.1.%s' % i, 'port': port}
        
    pool = multiprocessing.Pool()
    pool.map(scan, iter_ips(2046), 1)
