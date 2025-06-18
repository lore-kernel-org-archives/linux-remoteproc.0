Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4B028A1F5;
	Wed, 18 Jun 2025 13:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750252169; cv=none; b=VVCMBKC+n8nBZcx3iE/B7ybDLdagyTZ5dQc+NsXVjJNeSnYGn5wxZGF3Mhg+K7T37j6qM7y9jvCAwTihcOiNwe5oZC/2BYrXsPLkRl+vouM+1dBfRgO17NPFaHPrZAkEIKgTmzvfI1XtN1OwftBI1XfJcda4cpjpsJY1/E22eCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750252169; c=relaxed/simple;
	bh=S5oqW1pBvEubAtrW4HiWNgN+tKiViEZG87D2CLMk3r4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cIS8AB1qnOtsTI6Qq7SBHbNv5hAPePsmyzTsTr+qaIkEOl7A0v0lmVdGwW0w8ppx+MLQ3++Y79Q9ZCVvLrUh5fvZn8BDu0UFjdMzGFef2rGRVS4If6AwyLJjuDmNlaN5ijD/GEcU/NRMGP/0TzXCbPz6vrICp9g+oi/YZxFxyV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=opbivEj5; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="opbivEj5"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ICIeoP032010;
	Wed, 18 Jun 2025 15:08:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	GEOmT8untl9NInLdtL6sO9U9bHDKDZxqkP6HRCFtkfo=; b=opbivEj588Qkhv44
	dE9tEBMfzFMCbD0/i72laaHqlExqR73cLB6u66URDp/FwQu6vSB/HD3bLwrF8g1z
	4MqRlnGlac8MEoWqpnMBZitMZGk32jxFHXFWC25yWmKSye205R9fYpnttfsY1lSV
	pZqQNXM+RaYuma69okvVFGYiN41YrcZwl6JcNmTTUobDUtxlUGQbNbS+oo6A/2Sz
	WE7w+9xjC84wid6LZbarHZqdmY/DM2HNxYXzBimy/zGDNMVx7wtKNx1mc8z3xuyk
	TzyLpl6qfJis29kcuHGPjyFMlEeg+9IPk5oMG0Dmbvb6JbcTiw/M1x02nYhC3i9K
	aR8heA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47afw1vtey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 15:08:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CEC9740050;
	Wed, 18 Jun 2025 15:08:04 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 37320B281D2;
	Wed, 18 Jun 2025 15:07:38 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Jun
 2025 15:07:38 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Jun
 2025 15:07:37 +0200
Message-ID: <f3b99a3d-5d20-4e82-ae5d-75c2c866e118@foss.st.com>
Date: Wed, 18 Jun 2025 15:07:36 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] rpmsg: Introduce RPMSG_CREATE_EPT_FD_IOCTL uAPI
To: Dawei Li <dawei.li@linux.dev>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <set_pte_at@outlook.com>
References: <20250609151531.22621-1-dawei.li@linux.dev>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <20250609151531.22621-1-dawei.li@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01

Hello Dawei,


Please find a few comments below. It is not clear to me which parts of your
implementation are mandatory and which are optional "nice-to-have" optimizations.

Based on (potentially erroneous) hypothesis, you will find a suggestion for an
alternative to the anonymous inode approach, which does not seem to be a common
interface.


On 6/9/25 17:15, Dawei Li wrote:
> Hi,
> 
> This is V4 of series which introduce new uAPI(RPMSG_CREATE_EPT_FD_IOCTL)
> for rpmsg subsystem.
> 
> Current uAPI implementation for rpmsg ctrl & char device manipulation is
> abstracted in procedures below:
> - fd = open("/dev/rpmsg_ctrlX")
> - ioctl(fd, RPMSG_CREATE_EPT_IOCTL, &info); /dev/rpmsgY devnode is
>   generated.
> - fd_ep = open("/dev/rpmsgY", O_RDWR) 
> - operations on fd_ep(write, read, poll ioctl)
> - ioctl(fd_ep, RPMSG_DESTROY_EPT_IOCTL)
> - close(fd_ep)
> - close(fd)
> 
> This /dev/rpmsgY abstraction is less favorable for:
> - Performance issue: It's time consuming for some operations are
> invovled:
>   - Device node creation.
>     Depends on specific config, especially CONFIG_DEVTMPFS, the overall
>     overhead is based on coordination between DEVTMPFS and userspace
>     tools such as udev and mdev.
> 
>   - Extra kernel-space switch cost.
> 
>   - Other major costs brought by heavy-weight logic like device_add().

Is this a blocker of just optimization?

> 
> - /dev/rpmsgY node can be opened only once. It doesn't make much sense
>     that a dynamically created device node can be opened only once.


I assume this is blocker with the fact that you need to open the /dev/rpmsg<x>
to create the endpoint.


> 
> - For some container application such as docker, a client can't access
>   host's dev unless specified explicitly. But in case of /dev/rpmsgY, which
>   is generated dynamically and whose existence is unknown for clients in
>   advance, this uAPI based on device node doesn't fit well.

does this could be solve in userspace parsing /sys/class/rpmsg/ directory to
retreive the device?

You could face same kind of random instantiation for serial peripherals ( UART;
USb, I2C,...) based on a device tree enumeration. I suppose that user space
use to solve this.

> 
> An anonymous inode based approach is introduced to address the issues above.
> Rather than generating device node and opening it, rpmsg code just creates
> an anonymous inode representing eptdev and return the fd to userspace.

A drawback is that you need to share fb passed between processes.


> 
> # Performance demo
> 
> An simple C application is tested to verify performance of new uAPI.
> 
> $ cat test.c
> 
> #include <linux/rpmsg.h>
> 
> #include <sys/types.h>
> #include <sys/stat.h>
> #include <sys/ioctl.h>
> #include <fcntl.h>
> #include <string.h>
> #include <stdio.h>
> #include <unistd.h>
> #include <stdlib.h>
> #include <errno.h>
> #include <sys/time.h>
> 
> #define N (1 << 20)
> 
> int main(int argc, char *argv[])
> {
> 	int ret, fd, ep_fd, loop;
> 	struct rpmsg_endpoint_info info; 
> 	struct rpmsg_endpoint_fd_info fd_info; 
> 	struct timeval start, end;
> 	int i = 0;
> 	double t1, t2;
> 
> 	fd = -1;
> 	ep_fd = -1;
> 	loop = N;
> 
> 	if (argc == 1) {
> 		loop = N;
> 	} else if (argc > 1) {
> 		loop = atoi(argv[1]);
> 	}
> 
> 	printf("loop[%d]\n", loop);
> 
> 	strcpy(info.name, "epx");
> 	info.src = -1;
> 	info.dst = -1;
> 
> 	strcpy(fd_info.name, "epx");
> 	fd_info.src = -1;
> 	fd_info.dst = -1;
> 	fd_info.fd = -1;
> 
> 	while (fd < 0) {
> 		fd = open("/dev/rpmsg_ctrl0", O_RDWR);
> 		if (fd < 0) {
> 			printf("open rpmsg_ctrl0 failed, fd[%d]\n", fd);
> 		}
> 	}
> 
> 	gettimeofday(&start, NULL);
> 
> 	while (loop--) {
> 		ret = ioctl(fd, RPMSG_CREATE_EPT_IOCTL, &info);
> 		if (ret < 0) {
> 			printf("ioctl[RPMSG_CREATE_EPT_IOCTL] failed, ret[%d]\n", ret);
> 		}
> 
> 		ep_fd = -1;
> 		i = 0;
> 
> 		while (ep_fd < 0) {
> 			ep_fd = open("/dev/rpmsg0", O_RDWR);
> 			if (ep_fd < 0) {
> 				i++;
> 				printf("open rpmsg0 failed, epfd[%d]\n", ep_fd);
> 			}
> 		}
> 
> 		//printf("Number of open failed[%d]\n", i);
> 
> 		ret = ioctl(ep_fd, RPMSG_DESTROY_EPT_IOCTL, &info);
> 		if (ret < 0) {
> 			printf("old ioctl[RPMSG_DESTROY_EPT_IOCTL] failed, ret[%d], errno[%d]\n", ret, errno);
> 		}
> 
> 		close(ep_fd);
> 	}
> 	
> 	gettimeofday(&end, NULL);
> 
> 	printf("time for old way: [%ld] us\n", 1000000 * (end.tv_sec - start.tv_sec) + end.tv_usec - start.tv_usec);
> 	t1 = 1000000 * (end.tv_sec - start.tv_sec) + end.tv_usec - start.tv_usec;
> 
> 	if (argc == 1) {
> 		loop = N;
> 	} else if (argc > 1) {
> 		loop = atoi(argv[1]);
> 	}
> 
> 	printf("loop[%d]\n", loop);
> 
> 	gettimeofday(&start, NULL);
> 
> 	while (loop--) {

Do you need to create /close Endpoint sevral times in your real use case with
high timing
constraint?

> 		fd_info.fd = -1;
> 		fd_info.flags = O_RDWR | O_CLOEXEC | O_NONBLOCK;
> 		ret = ioctl(fd, RPMSG_CREATE_EPT_FD_IOCTL, &fd_info);
> 		if (ret < 0 || fd_info.fd < 0) {
> 			printf("ioctl[RPMSG_CREATE_EPT_FD_IOCTL] failed, ret[%d]\n", ret);
> 		}
> 


> 		ret = ioctl(fd_info.fd, RPMSG_DESTROY_EPT_IOCTL, &info);
> 		if (ret < 0) {
> 			printf("new ioctl[RPMSG_DESTROY_EPT_IOCTL] failed, ret[%d]\n", ret);
> 		}
> 
> 		close(fd_info.fd);

It seems strange to me to use ioctl() for opening and close() for closing, from
a symmetry point of view.

Regarding your implementation, I wonder if we could keep the /dev/rpmsg<x>
device with specific open() and close() file operations associated with your new
ioctl.

- The ioctl would create the endpoint.
- The open() and close() operations would simply manage the file descriptor and
increment/decrement a counter to prevent premature endpoint destruction.


Regards,
Arnaud

> 	}
> 	
> 	gettimeofday(&end, NULL);
> 
> 	printf("time for new way: [%ld] us\n", 1000000 * (end.tv_sec - start.tv_sec) + end.tv_usec - start.tv_usec);
> 	t2 = 1000000 * (end.tv_sec - start.tv_sec) + end.tv_usec - start.tv_usec;
> 
> 	printf("t1(old) / t2(new) = %f\n", t1 / t2);
> 
> 	close(fd);
> }
> 
> # Performance benchmark
> 
> - Legacy means benchmark based on old uAPI
> - New means benchmark based on new uAPI(the one this series introduce)
> - Time are in units of us(10^-6 s)
> 
> Test	loops	Total time(legacy)	Total time(new)	legacy/new	
> 1	1000	218472			2445		89.354601
> 2	1000	223435			2419		92.366680
> 3	1000	224263			2487		90.174105
> 4	1000	218982			2465		88.836511
> 5	1000	209640			2574		81.445221
> 6	1000	203816			2509		81.233958
> 7	1000	203266			2458		82.695688
> 8	1000	222842			2835		78.603880
> 9	1000	209590			2719		77.083487
> 10	1000	194558			2621		74.230446
> 
> 11	10000	2129021			31239		68.152662
> 12	10000	2081722			27997		74.355181
> 13	10000	2077086			31724		65.473648
> 14	10000	2073547			28290		73.296112
> 15	10000	2055153			26957		76.238194
> 16	10000	2022767			29809		67.857593
> 17	10000	2054562			25884		79.375753
> 18	10000	2036320			28511		71.422258
> 19	10000	2062547			28725		71.803203
> 20	10000	2110498			26740		78.926627
> 
> 21	100000	20802565		260392		79.889417
> 22	100000	20373178		259836		78.407834
> 23	100000	20361077		256404		79.410138
> 24	100000	20207000		256759		78.700260
> 25	100000	20220358		268118		75.415892
> 26	100000	20711593		259130		79.927423
> 27	100000	20301064		258545		78.520428
> 28	100000	20393203		256070		79.639173
> 29	100000	20162830		259942		77.566649
> 30	100000	20471632		259291		78.952343
> 
> # Changelog:
> 
> Changes in v4:
> - Build warning of copy_to_user (Dan).
> - ioctl() branches reorder (Beleswar).
> - Remove local variable fd and pass &ept_fd_info.fd to rpmsg_anonymous_eptdev_create().
> - Link to v3: https://lore.kernel.org/all/20250519150823.62350-1-dawei.li@linux.dev/ 
> 
> Changes in v3:
> - s/anon/anonymous (Mathieu)
> 
> - API naming adjustment (Mathieu)
>   - __rpmsg_chrdev_eptdev_alloc ->  rpmsg_eptdev_alloc
>   - __rpmsg_chrdev_eptdev_add ->  rpmsg_eptdev_add
> 
> - Add parameter 'flags' to uAPI so user can specify file flags
>   explicitly on creating anonymous inode.
> - Link to v2: https://lore.kernel.org/all/20250509155927.109258-1-dawei.li@linux.dev/ 
> 
> Changes in v2:
> - Fix compilation error for !CONFIG_RPMSG_CHAR config(Test robot).
> - Link to v1: https://lore.kernel.org/all/20250507141712.4276-1-dawei.li@linux.dev/
> 
> Dawei Li (3):
>   rpmsg: char: Reuse eptdev logic for anonymous device
>   rpmsg: char: Implement eptdev based on anonymous inode
>   rpmsg: ctrl: Introduce RPMSG_CREATE_EPT_FD_IOCTL uAPI
> 
>  drivers/rpmsg/rpmsg_char.c | 129 ++++++++++++++++++++++++++++++-------
>  drivers/rpmsg/rpmsg_char.h |  23 +++++++
>  drivers/rpmsg/rpmsg_ctrl.c |  35 ++++++++--
>  include/uapi/linux/rpmsg.h |  27 +++++++-
>  4 files changed, 182 insertions(+), 32 deletions(-)
> 
> ---
> base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
> 
> Thanks,
> 
> 	Dawei
