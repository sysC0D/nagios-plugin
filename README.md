# Nagios Pugins 
## check_docker.sh
### Description
This script check stats and health Docker (writing for nagios/nrpe)

### Requierements
Minimum Docker version -> 1.10.0 <br />
Nagios user need permission to use Docker, please add user nagios in docker group
```bash
usermod -aG docker ${USER}
```
For use this scipt nagios user need shell "/bin/bash", please execute next command
```bash
chsh -s /bin/bash ${USER}
```

### Usage
<p>Usage: ./check_docker_stats.sh [-v] [-h] [-n [-s -c -m -N]]<br/>
 -h, --help<br/>
 print this help message<br/>
 -v, --version<br/>
 print version program<br/>
 -n, --name<br/>
 name docker to check<br/>
 -c, --cpulimitperc PERC_WARNING_CPU,PERC_CRITCAL_CPU<br/>
 number in percent alert for CPU<br/>
 -m, --memlimitperc PERC_WARNING_MEM,PERC_CRITICAL_MEM<br/>
 number in percent alert for MEM usage<br/>
 -N, --ntwlimit WARNING_NET_RX,WARNING_NET_TX,CRITCAL_NET_RX,CRITCAL_NET_TX<br/>
 bandwidth (RX -> DL,TX -> UL) in kBps for docker selected<br/>
 -s, --status<br/>
 check if docker is alive</p>

```bash
./check_docker.sh -n <container name> -c <PERC_WARNING_CPU>,<PERC_CRITCAL_CPU> \
 -m <PERC_WARNING_MEM>,<PERC_CRITICAL_MEM> \
 -N <WARNING_NET_RX,WARNING_NET_TX,CRITCAL_NET_RX,CRITCAL_NET_TX>
```

### Troubleshooting
If docker stats have zero value for current|limit memory stats :<br/>
![Alt text](help_script/img_mem_null.jpg?raw=true "MEM USAGE Null")<br/>
Please execute this command :<br/>
```bash
cd help_script; ./enable_memswap_stats.sh
```
