#if 0

#©keithhedger Fri 17 Mar 10:49:47 GMT 2017 keithdhedger@gmail.com

g++ -Wall "$0" -o poweroff||exit 1

exit 0

#endif

#include <stdio.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/reboot.h>
#include <string.h>
#include <linux/reboot.h>

int main(int argc, char **argv)
{
	sync();
	if(strcmp(argv[1],"-r")==0)
		reboot(LINUX_REBOOT_CMD_RESTART);
	else
		reboot(LINUX_REBOOT_CMD_POWER_OFF);

	return 0;
}