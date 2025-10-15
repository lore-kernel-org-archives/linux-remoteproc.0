Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4227D2F7AC3
	for <linux-remoteproc@vger.kernel.org>; Wed, 15 Oct 2025 15:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760541486; cv=none; b=ZCykdsKsFnKWt5THfH9tw2DsVijtFI//TqKr331WJ9aEyOJ1oPCLftz9i5gsLCsK4JCHc310W0iTrvJJyK28hfM1+/k+of3UlD2Y823vBZk38pgA1PSZoVIbu0muc93aJG/8+dMoyUuBVmdK6eaMZdag9f/8XnMXdPjWDcNFvDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760541486; c=relaxed/simple;
	bh=BBthzJlG1S9QuR5dqjQLzn2VsJIYqJ0Gs9k13mwBVb4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c1TZeNfeTsjd52jXtnGLnWc1YJN7rJHQhphHsaM6HCnm6jwVqn9U0gUtWLqb0udkz4c0xNjJ+eugg5MSUOCed9nSE8bkknoCpBGTFRb7CelzhbwKACvqnZSthoeABLjjPjqwLd98xkGI2NI0N/N0UyDkOxxsSGGLXN4ox75KQRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VhqjmL+T; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VhqjmL+T"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760541470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2iZ3yeqP3iO4fyCc4gvNNfQvklKuJyhYyfIm61BR4OE=;
	b=VhqjmL+TpC1LilskqL8fT7kxl/Bb8NvKMehb+R7sAaAPSKNQHC+u8/YhNCWbvM0C9paq6V
	2z6xDXbhEcQ14yPm8VwQMIl4Gl6wylwKBXGqN6nC0BM9KnXJ9Wi8PhM4QOp+dp9NLgbW/C
	hH6VIVFKrBo1/RwX9p1VEfhfRU8LaX4=
From: Dawei Li <dawei.li@linux.dev>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dawei.li@linux.dev,
	set_pte_at@outlook.com
Subject: [PATCH v5 0/3] rpmsg: Introduce RPMSG_CREATE_EPT_FD_IOCTL uAPI
Date: Wed, 15 Oct 2025 23:17:15 +0800
Message-Id: <20251015151718.3927-1-dawei.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,

This is V5 of series which introduce new uAPI(RPMSG_CREATE_EPT_FD_IOCTL)
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
involved:
  - Device node creation.
    Depends on specific config, especially CONFIG_DEVTMPFS, the overall
    overhead is based on coordination between DEVTMPFS and userspace
    tools such as udev and mdev.
  - Extra kernel-userspace switch cost.
  - Other major costs brought by heavy-weight logic like device_add().

- /dev/rpmsgY node can be opened only once. It doesn't make much sense
    that a dynamically created device node can be opened only once.

- For some container application such as docker, a client can't access
  host's dev unless specified explicitly. But in case of /dev/rpmsgY, which
  is generated dynamically and whose existence is unknown for clients in
  advance, this uAPI based on device node doesn't fit well.

An anonymous inode based approach is introduced to address the issues
above. Rather than generating device node and opening it, rpmsg code just
creates an anonymous inode representing eptdev and return the fd to
userspace.

Performance demo

A simple C application is tested to verify performance of new uAPI.
Please be noted that all '#' in code are preceded with space to suppress
checkpatch complaints.

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
			printf("ioctl[RPMSG_CREATE_EPT_IOCTL] failed,
			ret[%d]\n", ret);
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

		ret = ioctl(ep_fd, RPMSG_DESTROY_EPT_IOCTL, &info);
		if (ret < 0) {
			printf("old RPMSG_DESTROY_EPT_IOCTL failed, ret[%d], errno[%d]\n",
			ret, errno);
		}

		close(ep_fd);
	}
	
	gettimeofday(&end, NULL);

	printf("time for old way: [%ld] us\n",
		1000000 * (end.tv_sec - start.tv_sec) + end.tv_usec - start.tv_usec);
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

	printf("time for new way: [%ld] us\n",
	1000000 * (end.tv_sec - start.tv_sec) + end.tv_usec - start.tv_usec);
	t2 = 1000000 * (end.tv_sec - start.tv_sec) + end.tv_usec - start.tv_usec;

	printf("t1(old) / t2(new) = %f\n", t1 / t2);

	close(fd);
}

Performance benchmark

- Legacy means benchmark based on old uAPI
- New means benchmark based on new uAPI(the one this series introduce)
- Time are in units of us(10^-6 s)

Test	loops	Total time(legacy)	Total time(new)	legacy/new	
1	1000	148362			1153		128.674761	
2	1000	145640			1121		129.919715	
3	1000	145303			1174		123.767462	
4	1000	150294			1142		131.605954	
5	1000	160877			1175		136.916596	
6	1000	154400			1134		136.155203	
7	1000	143252			1163		123.174549	
8	1000	148758			1161		128.129199
9	1000	149044			1112		134.032374
10	1000	146895			1192		123.234060
11	10000	1428967			11627		122.900748
12	10000	1367015			10557		129.488965
13	10000	1371919			11663		117.630027
14	10000	1358447			11080		122.603520
15	10000	1375463			11245		122.317741
16	10000	1364901			11153		122.379718
17	10000	1352665			10735		126.005123
18	10000	1400873			11341		123.522882
19	10000	1391276			10892		127.733750
20	10000	1394367			11110		125.505581
21	100000	14069671		115569		121.742604
22	100000	13663364		117074		116.707074
23	100000	13735740		115638		118.782234
24	100000	13714441		119362		114.897882
25	100000	13904366		118282		117.552679
26	100000	13870560		117717		117.829710
27	100000	13713605		118312		115.910516
28	100000	13872852		114347		121.322396
29	100000	13777964		119072		115.711200
30	100000	13725654		116296		118.023440

Changelog:

Changes in v5:
- Rebased on v6.18.rc1.
- Fix checkpatch warning on commit msg on patch[1/3].
- Other minor commit msg tweaks.
- Update performance testing results.
- Link to v4:
  https://lore.kernel.org/all/20250609151531.22621-1-dawei.li@linux.dev/

Changes in v4:
- Build warning of copy_to_user (Dan).
- ioctl() branches reorder (Beleswar).
- Remove local variable fd and pass &ept_fd_info.fd to
  rpmsg_anonymous_eptdev_create().
- Link to v3:
  https://lore.kernel.org/all/20250519150823.62350-1-dawei.li@linux.dev/

Changes in v3:
- s/anon/anonymous (Mathieu)
- API naming adjustment (Mathieu)
  - __rpmsg_chrdev_eptdev_alloc ->  rpmsg_eptdev_alloc
  - __rpmsg_chrdev_eptdev_add ->  rpmsg_eptdev_add
- Add parameter 'flags' to uAPI so user can specify file flags
  explicitly on creating anonymous inode.
- Link to v2:
  https://lore.kernel.org/all/20250509155927.109258-1-dawei.li@linux.dev/

Changes in v2:
- Fix compilation error for !CONFIG_RPMSG_CHAR config(Test robot).
- Link to v1:
  https://lore.kernel.org/all/20250507141712.4276-1-dawei.li@linux.dev/

Dawei Li (3):
  rpmsg: char: Reuse eptdev logic for anonymous device
  rpmsg: char: Implement eptdev based on anonymous inode
  rpmsg: ctrl: Introduce RPMSG_CREATE_EPT_FD_IOCTL uAPI

 drivers/rpmsg/rpmsg_char.c | 129 ++++++++++++++++++++++++++++++-------
 drivers/rpmsg/rpmsg_char.h |  23 +++++++
 drivers/rpmsg/rpmsg_ctrl.c |  35 ++++++++--
 include/uapi/linux/rpmsg.h |  27 +++++++-
 4 files changed, 182 insertions(+), 32 deletions(-)

---

Thanks,

	Dawei

-- 
2.25.1

