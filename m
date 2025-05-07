Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DBF289E21
	for <linux-remoteproc@vger.kernel.org>; Wed,  7 May 2025 14:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746627467; cv=none; b=VFgbbDaUAEguAoqPm4HCL1ZLPGLVL3f+H880EoL35yvDmMNVuT86z0osXVn/QAitKk3Scvu32K0ZAVVfQiwAk4vFtbG9nRA0IKGYiZQV17yHnQJHycIcMc2JhQRkHyHvt97leF7YPz/1pCw3CbLlRhszgwGt0B812DjGUoCCdbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746627467; c=relaxed/simple;
	bh=IxupcJPlYRhD2UqkmorA3DMzhd32rJ1yoT6/PHsqJoU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ufO4C1M7KISSi/RGEUEgDXmMK3DC3+HD9TRFAmSTPqiiGHeqtchhej7IBX5JLdWtaC4oHQXTT5RhgmuDyw14SBVFfCr8adjgbs6Ld4fnLWi+zKo8pxxc/ootbxCzymgFpwaKBRQLEMfCOUFUEPFXKBWQoV5Jk3h8EYQObOk0UT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iSCSiHbF; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iSCSiHbF"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746627449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pH7UmPvS4rp26O6yU59fxdXGcFqjDChPqNvKXLI8EQU=;
	b=iSCSiHbFUehvqLfQa0NoeuKVcsAi8xvPf1wG6uFk+LxnoSW6V7ecBgD0xAqgzvfZMb9Sw2
	jalSpqCLDKxjyJ1Sd7CYf9c3EhDay7ygvNrEKny9/PDuybVoxIo5upbrosz0lqxOPPFrRS
	c6CfRUqEUZUiKK6KNaeTMQH8zKMfG8k=
From: Dawei Li <dawei.li@linux.dev>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dawei.li@linux.dev,
	set_pte_at@outlook.com
Subject: [PATCH 0/3] rpmsg: Introduce RPMSG_CREATE_EPT_FD_IOCTL uAPI
Date: Wed,  7 May 2025 22:17:09 +0800
Message-Id: <20250507141712.4276-1-dawei.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,

This series introduce new uAPI(RPMSG_CREATE_EPT_FD_IOCTL) for rpmsg
subsystem.

Current uAPI implementation for rpmsg ctrl & char device manipulation is
abstracted in procedures below:
- fd = open("/dev/rpmsg_ctrlX")
- ioctl(fd, RPMSG_CREATE_EPT_IOCTL, &info); /dev/rpmsgY devnode is
  generated.
- fd_ep = open("/dev/rpmsgY", O_RDWR) 
- operations on fd_ep(write, read, poll ioctl)
- ioctl(fd_ep, RPMSG_DESTROY_EPT_IOCTL)
- close(fd_ep)
- close(fd)

This /dev/rpmsgY abstraction is less favorable for:
- Performance issue: It's time consuming for some operations are
invovled:
  - Device node creation.
    Depends on specific config, especially CONFIG_DEVTMPFS, the overall
    overhead is based on coordination between DEVTMPFS and userspace
    tools such as udev and mdev.

  - Extra kernel-space switch cost.

  - Other major costs brought by heavy-weight logic like device_add().

- /dev/rpmsgY node can be opened only once. It doesn't make much sense
    that a dynamically created device node can be opened only once.

- For some container application such as docker, a client can't access
  host's dev unless specified explicitly. But in case of /dev/rpmsgY, which
  is generated dynamically and whose existence is unknown for clients in
  advance, this uAPI based on device node doesn't fit well.

An anon inode based approach is introduced to address the issues above.
Rather than generating device node and opening it, rpmsg code just make
a anon inode representing eptdev and return the fd to userspace.

# Performance demo

An simple C application is tested to verify performance of new uAPI.

$ cat test.c

#include <linux/rpmsg.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <string.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/time.h>

#define N (1 << 20)

int main(int argc, char *argv[])
{
	int ret, fd, ep_fd, loop;
	struct rpmsg_endpoint_info info; 
	struct rpmsg_endpoint_fd_info fd_info; 
	struct timeval start, end;
	int i = 0;
	double t1, t2;

	fd = -1;
	ep_fd = -1;
	loop = N;

	if (argc == 1) {
		loop = N;
	} else if (argc > 1) {
		loop = atoi(argv[1]);
	}

	printf("loop[%d]\n", loop);

	strcpy(info.name, "epx");
	info.src = -1;
	info.dst = -1;

	strcpy(fd_info.name, "epx");
	fd_info.src = -1;
	fd_info.dst = -1;
	fd_info.fd = -1;

	while (fd < 0) {
		fd = open("/dev/rpmsg_ctrl0", O_RDWR);
		if (fd < 0) {
			printf("open rpmsg_ctrl0 failed, fd[%d]\n", fd);
		}
	}

	gettimeofday(&start, NULL);

	while (loop--) {
		ret = ioctl(fd, RPMSG_CREATE_EPT_IOCTL, &info);
		if (ret < 0) {
			printf("ioctl[RPMSG_CREATE_EPT_IOCTL] failed, ret[%d]\n", ret);
		}

		ep_fd = -1;
		i = 0;

		while (ep_fd < 0) {
			ep_fd = open("/dev/rpmsg0", O_RDWR);
			if (ep_fd < 0) {
				i++;
				printf("open rpmsg0 failed, epfd[%d]\n", ep_fd);
			}
		}

		//printf("Number of open failed[%d]\n", i);

		ret = ioctl(ep_fd, RPMSG_DESTROY_EPT_IOCTL, &info);
		if (ret < 0) {
			printf("old ioctl[RPMSG_DESTROY_EPT_IOCTL] failed, ret[%d], errno[%d]\n",
				ret, errno);
		}

		close(ep_fd);
	}
	
	gettimeofday(&end, NULL);

	printf("time for old way: [%ld] us\n", 1000000 * (end.tv_sec - start.tv_sec) + end.tv_usec - start.tv_usec);
	t1 = 1000000 * (end.tv_sec - start.tv_sec) + end.tv_usec - start.tv_usec;

	if (argc == 1) {
		loop = N;
	} else if (argc > 1) {
		loop = atoi(argv[1]);
	}

	printf("loop[%d]\n", loop);

	gettimeofday(&start, NULL);

	while (loop--) {
		fd_info.fd = -1;
		ret = ioctl(fd, RPMSG_CREATE_EPT_FD_IOCTL, &fd_info);
		if (ret < 0 || fd_info.fd < 0) {
			printf("ioctl[RPMSG_CREATE_EPT_FD_IOCTL] failed, ret[%d]\n", ret);
		}

		ret = ioctl(fd_info.fd, RPMSG_DESTROY_EPT_IOCTL, &info);
		if (ret < 0) {
			printf("new ioctl[RPMSG_DESTROY_EPT_IOCTL] failed, ret[%d]\n", ret);
		}

		close(fd_info.fd);
	}
	
	gettimeofday(&end, NULL);

	printf("time for new way: [%ld] us\n", 1000000 * (end.tv_sec - start.tv_sec) + end.tv_usec - start.tv_usec);
	t2 = 1000000 * (end.tv_sec - start.tv_sec) + end.tv_usec - start.tv_usec;

	printf("t1(old) / t2(new) = %f\n", t1 / t2);

	close(fd);
}

# Performance benchmark 

- Legacy means benchmark based on old uAPI
- New means benchmark based on new uAPI(the one this series introduce)
- Time are in units of us(10^-6 s)

Test	loops	Total time(legacy)	Total time(new)	legacy/new	
1	1000	203227			2533		80.2	
2	1000	196501			2384		82.4
3	1000	213619			2518		84.8
4	1000	215898			2515		85.8
5	1000	211340			2417		87.4
6	1000	217008			2545		85.2
7	1000	213591			2478		86.1
8	1000	214618			2351		91.2
9	1000	208021			2505		83.0
10	1000	217092			2716		79.9	
11	10000	2040802			26765		76.2
12	10000	2027708			26867		75.4
13	10000	1986117			27151		73.1
14	10000	1992956			26301		75.7
15	10000	1980262			25808		76.7
16	10000	1925883			27926		68.9	
17	10000	1957518			27100		72.2
18	10000	1980626			28020		70.6
19	10000	1990349			27351		72.7
20	10000	1979087			27563		71.8
21	100000	20266414		256170		79.1
22	100000	19732259		259883		75.9
23	100000	19878399		253710		78.3	
24	100000	19788886		257199		76.9
25	100000	19937663		258865		77.0
26	100000	19602512		256771		76.3
27	100000	19599214		257088		76.2
28	100000	19795920		261488		75.7
29	100000	19719341		263299		74.8
30	100000	19871390		258465		76.8

Dawei Li (3):
  rpmsg: char: Reuse eptdev logic for anon device
  rpmsg: char: Implement eptdev based on anon inode
  rpmsg: ctrl: Introduce RPMSG_CREATE_EPT_FD_IOCTL uAPI

 drivers/rpmsg/rpmsg_char.c | 124 ++++++++++++++++++++++++++++++-------
 drivers/rpmsg/rpmsg_char.h |  19 ++++++
 drivers/rpmsg/rpmsg_ctrl.c |  37 ++++++++---
 include/uapi/linux/rpmsg.h |  19 ++++++
 4 files changed, 167 insertions(+), 32 deletions(-)

---
base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb

Thanks,

	Dawei
-- 
2.25.1

