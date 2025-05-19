Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB81284B38
	for <linux-remoteproc@vger.kernel.org>; Mon, 19 May 2025 15:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667335; cv=none; b=o9S6sUwRLhJTyf315XsZ5YLEWTreAwRS1TwK9uBogWmjHehEQEhJiecbwrcgd22h/4XcNQqC2INEUShvAeiEoBdTPJDba36oEekO6GoN6KKIInPC+7Og948hry5GuVRGcVFloeXFFLSxYZxiDRe+P3/rrUKsqqaAJIOMiBMlUhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667335; c=relaxed/simple;
	bh=OUlaWeW4tfZieewQ0URcqIi0vvlVTer9F5Lm/M6o37U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JbIfQLy7+pvAskB7JRE/TiYNmFv7NEGaL8BkLQsCLWBefrn+FPfcvF1NWTqLI5t9dPDHL8X02cHtl+WLHfSCrFlAkHdzDTHvOYn8IWHOjyPrlk9do6WOaIymysNyDNXv5Cnfq16in2MlXm+jdm9Lyw+rzbZq8aFZQX6vbR1BhC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=d+7EGyzQ; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="d+7EGyzQ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747667321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AOBNc5KafxPVNUaymDS4XmpLmArtpsT7LlxIifP0pqQ=;
	b=d+7EGyzQzECG3QV+WgTOmCa3GDjkPWp8P4mjWugQwN2HVPKXMlXaRx68s+aICdVUSN0KNI
	2ewEls+Z9yLmSqNRHdtSKG02KomkHrrMHTlQOhXEXGRiJoJan7Gmk9RU6DkAIay4+NNISG
	KEJVN2Re8w649d3TEPx0M9aWjdrsJls=
From: Dawei Li <dawei.li@linux.dev>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dawei.li@linux.dev,
	set_pte_at@outlook.com
Subject: [PATCH v3 0/3] rpmsg: Introduce RPMSG_CREATE_EPT_FD_IOCTL uAPI
Date: Mon, 19 May 2025 23:08:20 +0800
Message-Id: <20250519150823.62350-1-dawei.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,

This is V3 of series which introduce new uAPI(RPMSG_CREATE_EPT_FD_IOCTL)
for rpmsg subsystem.

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

An anonymous inode based approach is introduced to address the issues above.
Rather than generating device node and opening it, rpmsg code just creates
an anonymous inode representing eptdev and return the fd to userspace.

# Performance demo (Updated)

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
			printf("old ioctl[RPMSG_DESTROY_EPT_IOCTL] failed, ret[%d], errno[%d]\n", ret, errno);
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
		fd_info.flags = O_RDWR | O_CLOEXEC | O_NONBLOCK;
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

# Performance benchmark (Updated)

- Legacy means benchmark based on old uAPI
- New means benchmark based on new uAPI(the one this series introduce)
- Time are in units of us(10^-6 s)

Test	loops	Total time(legacy)	Total time(new)	legacy/new	
1	1000	218472			2445		89.354601
2	1000	223435			2419		92.366680
3	1000	224263			2487		90.174105
4	1000	218982			2465		88.836511
5	1000	209640			2574		81.445221
6	1000	203816			2509		81.233958
7	1000	203266			2458		82.695688
8	1000	222842			2835		78.603880
9	1000	209590			2719		77.083487
10	1000	194558			2621		74.230446

11	10000	2129021			31239		68.152662
12	10000	2081722			27997		74.355181
13	10000	2077086			31724		65.473648
14	10000	2073547			28290		73.296112
15	10000	2055153			26957		76.238194
16	10000	2022767			29809		67.857593
17	10000	2054562			25884		79.375753
18	10000	2036320			28511		71.422258
19	10000	2062547			28725		71.803203
20	10000	2110498			26740		78.926627

21	100000	20802565		260392		79.889417
22	100000	20373178		259836		78.407834
23	100000	20361077		256404		79.410138
24	100000	20207000		256759		78.700260
25	100000	20220358		268118		75.415892
26	100000	20711593		259130		79.927423
27	100000	20301064		258545		78.520428
28	100000	20393203		256070		79.639173
29	100000	20162830		259942		77.566649
30	100000	20471632		259291		78.952343

# Changelog:

Changes in v3:
- s/anon/anonymous (Mathieu)

- API naming adjustment (Mathieu)
  - __rpmsg_chrdev_eptdev_alloc ->  rpmsg_eptdev_alloc
  - __rpmsg_chrdev_eptdev_add ->  rpmsg_eptdev_add

- Add parameter 'flags' to uAPI so user can specify file flags
  explicitly on creating anonymous inode.
- Link to v2: https://lore.kernel.org/all/20250509155927.109258-1-dawei.li@linux.dev/ 

Changes in v2:
- Fix compilation error for !CONFIG_RPMSG_CHAR config(Test robot).
- Link to v1: https://lore.kernel.org/all/20250507141712.4276-1-dawei.li@linux.dev/

Dawei Li (3):
  rpmsg: char: Reuse eptdev logic for anonymous device
  rpmsg: char: Implement eptdev based on anonymous inode
  rpmsg: ctrl: Introduce RPMSG_CREATE_EPT_FD_IOCTL uAPI

 drivers/rpmsg/rpmsg_char.c | 129 ++++++++++++++++++++++++++++++-------
 drivers/rpmsg/rpmsg_char.h |  23 +++++++
 drivers/rpmsg/rpmsg_ctrl.c |  38 ++++++++---
 include/uapi/linux/rpmsg.h |  24 +++++++
 4 files changed, 182 insertions(+), 32 deletions(-)

---
base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb

Thanks,

	Dawei
-- 
2.25.1

