/*
 *
 * ©K. D. Hedger. Tue 27 Apr 20:30:06 BST 2021 keithdhedger@gmail.com

 * This file (poweroff.cpp) is part of Projects.

 * Projects is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * at your option) any later version.

 * Projects is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with Projects.  If not, see <http://www.gnu.org/licenses/>.
 */

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