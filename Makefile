
default:	build

#clean:
#	rm -rf Makefile objs

.PHONY:	default clean

build:
	$(MAKE) -f objs/Makefile.wpd

base_loop_simplify:
	$(MAKE) -f objs/Makefile.wpd base_loop_simplify

base_loop_simplify_ics:
	$(MAKE) -f objs/Makefile.wpd base_loop_simplify_ics

wpd_ics:
	$(MAKE) -f objs/Makefile.wpd wpd_ics

wpd_custlink_ics:
	$(MAKE) -f objs/Makefile.wpd wpd_custlink_ics

install:
	$(MAKE) -f objs/Makefile install

modules:
	$(MAKE) -f objs/Makefile modules

upgrade:
	/usr/local/nginx/sbin/nginx -t

	kill -USR2 `cat /usr/local/nginx/logs/nginx.pid`
	sleep 1
	test -f /usr/local/nginx/logs/nginx.pid.oldbin

	kill -QUIT `cat /usr/local/nginx/logs/nginx.pid.oldbin`

.PHONY:	build install modules upgrade base_loop_simplify wpd_ics wpd_custlink_ics
