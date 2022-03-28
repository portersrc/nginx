
default:	build

#clean:
#	rm -rf Makefile objs
clean:
	rm `find -name "*.obj"`
	rm `find -name "*.pch"`

.PHONY:	default clean

build:
	$(MAKE) -f objs/Makefile.wpd-windows

base_loop_simplify:
	$(MAKE) -f objs/Makefile.wpd-windows base_loop_simplify

base_loop_simplify_ics:
	$(MAKE) -f objs/Makefile.wpd-windows base_loop_simplify_ics

wpd_ics:
	$(MAKE) -f objs/Makefile.wpd-windows wpd_ics

wpd_custlink_ics:
	$(MAKE) -f objs/Makefile.wpd-windows wpd_custlink_ics

install:
	$(MAKE) -f objs/Makefile install

modules:
	$(MAKE) -f objs/Makefile modules

upgrade:
	/nginx.exe -t

	kill -USR2 `cat /logs/nginx.pid`
	sleep 1
	test -f /logs/nginx.pid.oldbin

	kill -QUIT `cat /logs/nginx.pid.oldbin`

.PHONY:	build install modules upgrade base_loop_simplify wpd_ics wpd_custlink_ics
