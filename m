Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482153451B0
	for <linux-remoteproc@vger.kernel.org>; Thu, 16 Oct 2025 15:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760628731; cv=none; b=i4njB+dDkqxuM6hzLPY8mxX2bhXZQkJjDwwpGesAde9xrQFDO68vRxJxa6plIOFbqiP4Jh6aAjp51ct0NfCulNOi3f4EZdKYmMd3LNZLG4+uca/z6J0dOvP1vPCb1I3SzafE8I5El0BlTuKK8lai6UB6u2BO25K207Gkx5chWeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760628731; c=relaxed/simple;
	bh=N/zyROLuKLVeX37D0ncvfcK4nxhsEWumdfdFGc8IDm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLZ5g8dBMWPP3a6Xuxg3nGM1gpaZoiKKwIlsIwyHy7hqyPbMeVoiX9gR0n6otX9t8YUy3O6TUIb+zD2mgCOOktWzsDKkVtt6ff1jib9AhGfMVum5St1vHgwhR9WdX1oBIZSYVvo5cd+vjPfLz5L9Swhe1KeodxdNkOKVRQHsTS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RpzlSY34; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RpzlSY34"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-27d3540a43fso9297235ad.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Oct 2025 08:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760628728; x=1761233528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2U9KnBBOdL0NScSZD9oLJXkvfeJnletRnq0CiO/gI70=;
        b=RpzlSY340X/YNwfX7pj4amnpShawFd2KlqADVGp7kV9TCZpRu6Q6gLI3O2HAn30iwK
         hnZiRjCUkoKzJbCgP3/pDcSTEpBstIWYBTzMuB6XnceNaAADEgvtQl8GQJhSwv+xsszv
         8aXjMZtK6w9GxFbdA1kjx6KMl7nOxjCKcgpqSgL1AcakIoPGl/yhLGJ508+mzFPLSKzL
         s0wHIN2bx25Lzgp0yRmLW2i2oE11t73XloaVCIoP7cuO2uD8/ZyLmy/ITCRS7L8ipoVt
         TFbm4+aNWT0/IaVTzDT0IcGfI95zHY18O5LQ2YLAliM1OaK7ALYKa4m1Nyk2KUGZZe73
         lvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760628728; x=1761233528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2U9KnBBOdL0NScSZD9oLJXkvfeJnletRnq0CiO/gI70=;
        b=AVFigqZR5Itv/QHoDzlYlY0y8aN3gRuL9f8m29GSlhgcE8rnKWg6Rqb31iXZacvCIC
         lYqzmO5NXTm6LCCelihx4U4VUnvXr2ppHJ9azhkrnO0YjIijVUteCZCTWl8zJ0znUKyy
         zzIpOaxGVhWfqmEwpw5CwFFamM3NdekbrFG7kNwsvFB+vUTxDwAviMhibDUA/+T9pIhV
         aGDfQEWAbd/cYQeFNNDfBOYoShxpS+17KsZqYezp+onQiBJYN/FeCOAhhc3CKmMzpa/Z
         zK8o9FpySZvUAudcQEbfcPcf1zOn04HGUhIxurq87YLk778Ns/0TLtGtQzUlTDk8QOnm
         U3hA==
X-Forwarded-Encrypted: i=1; AJvYcCWC3WsvbmKSdUui3Lc8k8RtR2+GaYbUnUiUA9ieto1h9e4kAFudpxX4cicNVmZ11Y597xLfdpzhDt5GvEqnRQGn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8IfL3rlea2XA3xstz9RMxELG/BIZR0SDumRwmM7TL//vD+PAC
	9lblNh1PDPGMEBc8bD1qTKiVwYVVj7dnoXZyYWzts8PeXSkssetGwnAvKRAxm6S/JoAcXBZIzCj
	Jk8kupGg=
X-Gm-Gg: ASbGnculJLHDO2bfrqWVErho3G+l+IM3w5ehLtX9EJNOsFFmiBDTW+kKlxrcxzkY+6R
	Q7w4LarGwrTPwFWz7Hu67v2NdNQhZN9SxPDmXwSX3+Tf8SosvsFO3T8dchQ/rXaUh9NT0hKqU2K
	6ujJ5YJ4AdcxFOFgW6lnhAf00Ckl34sYI6iHn+t6UUgKG5IV0eCNmrKeV0UnbvG8W4bL1KZbX+D
	fmFhiinSUGWN6RHHYl0wNIK7eLjxS/pPwe+RIDoo9Cga+mX3RlVZGm9v1CRibwycZPnH61b7GdT
	CK1ua0ETKyiPt7/wjf+FJeY+3EpZy5ftQfCY6o0ukgdj67vaAVP8WK1RralkGg0+OoBATWmjurE
	IzPDVdphAJjkhY79Unt6ixUrviKFBj/4QioPuqnfPEKhm55xWwToUWSwTJQ6ReIv4HxafEy65Yi
	gWd+Do6/rsiU5yiA==
X-Google-Smtp-Source: AGHT+IHyUGIpygPtrcP+MCKi61KAsnJemGDTDLAwO6l+QjXSKyjkkxZkpEv9f2+gDcVx0P8g04QeIw==
X-Received: by 2002:a17:902:d4ca:b0:275:b1cf:6dd7 with SMTP id d9443c01a7336-290caf844e8mr4916865ad.34.1760628727929;
        Thu, 16 Oct 2025 08:32:07 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c6a8:58de:b8f8:4d8e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7cec6sm33975245ad.55.2025.10.16.08.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:32:07 -0700 (PDT)
Date: Thu, 16 Oct 2025 09:32:04 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Dawei Li <dawei.li@linux.dev>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, set_pte_at@outlook.com
Subject: Re: [PATCH v5 0/3] rpmsg: Introduce RPMSG_CREATE_EPT_FD_IOCTL uAPI
Message-ID: <aPEP9EdZ8tIAVwyE@p14s>
References: <20251015151718.3927-1-dawei.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015151718.3927-1-dawei.li@linux.dev>

I have applied this set.

Thanks,
Mathieu

On Wed, Oct 15, 2025 at 11:17:15PM +0800, Dawei Li wrote:
> Hi,
> 
> This is V5 of series which introduce new uAPI(RPMSG_CREATE_EPT_FD_IOCTL)
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
> involved:
>   - Device node creation.
>     Depends on specific config, especially CONFIG_DEVTMPFS, the overall
>     overhead is based on coordination between DEVTMPFS and userspace
>     tools such as udev and mdev.
>   - Extra kernel-userspace switch cost.
>   - Other major costs brought by heavy-weight logic like device_add().
> 
> - /dev/rpmsgY node can be opened only once. It doesn't make much sense
>     that a dynamically created device node can be opened only once.
> 
> - For some container application such as docker, a client can't access
>   host's dev unless specified explicitly. But in case of /dev/rpmsgY, which
>   is generated dynamically and whose existence is unknown for clients in
>   advance, this uAPI based on device node doesn't fit well.
> 
> An anonymous inode based approach is introduced to address the issues
> above. Rather than generating device node and opening it, rpmsg code just
> creates an anonymous inode representing eptdev and return the fd to
> userspace.
> 
> Performance demo
> 
> A simple C application is tested to verify performance of new uAPI.
> Please be noted that all '#' in code are preceded with space to suppress
> checkpatch complaints.
> 
> $ cat test.c
> 
>  #include <linux/rpmsg.h>
> 
>  #include <sys/types.h>
>  #include <sys/stat.h>
>  #include <sys/ioctl.h>
>  #include <fcntl.h>
>  #include <string.h>
>  #include <stdio.h>
>  #include <unistd.h>
>  #include <stdlib.h>
>  #include <errno.h>
>  #include <sys/time.h>
> 
>  #define N (1 << 20)
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
> 			printf("ioctl[RPMSG_CREATE_EPT_IOCTL] failed,
> 			ret[%d]\n", ret);
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
> 		ret = ioctl(ep_fd, RPMSG_DESTROY_EPT_IOCTL, &info);
> 		if (ret < 0) {
> 			printf("old RPMSG_DESTROY_EPT_IOCTL failed, ret[%d], errno[%d]\n",
> 			ret, errno);
> 		}
> 
> 		close(ep_fd);
> 	}
> 	
> 	gettimeofday(&end, NULL);
> 
> 	printf("time for old way: [%ld] us\n",
> 		1000000 * (end.tv_sec - start.tv_sec) + end.tv_usec - start.tv_usec);
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
> 	}
> 	
> 	gettimeofday(&end, NULL);
> 
> 	printf("time for new way: [%ld] us\n",
> 	1000000 * (end.tv_sec - start.tv_sec) + end.tv_usec - start.tv_usec);
> 	t2 = 1000000 * (end.tv_sec - start.tv_sec) + end.tv_usec - start.tv_usec;
> 
> 	printf("t1(old) / t2(new) = %f\n", t1 / t2);
> 
> 	close(fd);
> }
> 
> Performance benchmark
> 
> - Legacy means benchmark based on old uAPI
> - New means benchmark based on new uAPI(the one this series introduce)
> - Time are in units of us(10^-6 s)
> 
> Test	loops	Total time(legacy)	Total time(new)	legacy/new	
> 1	1000	148362			1153		128.674761	
> 2	1000	145640			1121		129.919715	
> 3	1000	145303			1174		123.767462	
> 4	1000	150294			1142		131.605954	
> 5	1000	160877			1175		136.916596	
> 6	1000	154400			1134		136.155203	
> 7	1000	143252			1163		123.174549	
> 8	1000	148758			1161		128.129199
> 9	1000	149044			1112		134.032374
> 10	1000	146895			1192		123.234060
> 11	10000	1428967			11627		122.900748
> 12	10000	1367015			10557		129.488965
> 13	10000	1371919			11663		117.630027
> 14	10000	1358447			11080		122.603520
> 15	10000	1375463			11245		122.317741
> 16	10000	1364901			11153		122.379718
> 17	10000	1352665			10735		126.005123
> 18	10000	1400873			11341		123.522882
> 19	10000	1391276			10892		127.733750
> 20	10000	1394367			11110		125.505581
> 21	100000	14069671		115569		121.742604
> 22	100000	13663364		117074		116.707074
> 23	100000	13735740		115638		118.782234
> 24	100000	13714441		119362		114.897882
> 25	100000	13904366		118282		117.552679
> 26	100000	13870560		117717		117.829710
> 27	100000	13713605		118312		115.910516
> 28	100000	13872852		114347		121.322396
> 29	100000	13777964		119072		115.711200
> 30	100000	13725654		116296		118.023440
> 
> Changelog:
> 
> Changes in v5:
> - Rebased on v6.18.rc1.
> - Fix checkpatch warning on commit msg on patch[1/3].
> - Other minor commit msg tweaks.
> - Update performance testing results.
> - Link to v4:
>   https://lore.kernel.org/all/20250609151531.22621-1-dawei.li@linux.dev/
> 
> Changes in v4:
> - Build warning of copy_to_user (Dan).
> - ioctl() branches reorder (Beleswar).
> - Remove local variable fd and pass &ept_fd_info.fd to
>   rpmsg_anonymous_eptdev_create().
> - Link to v3:
>   https://lore.kernel.org/all/20250519150823.62350-1-dawei.li@linux.dev/
> 
> Changes in v3:
> - s/anon/anonymous (Mathieu)
> - API naming adjustment (Mathieu)
>   - __rpmsg_chrdev_eptdev_alloc ->  rpmsg_eptdev_alloc
>   - __rpmsg_chrdev_eptdev_add ->  rpmsg_eptdev_add
> - Add parameter 'flags' to uAPI so user can specify file flags
>   explicitly on creating anonymous inode.
> - Link to v2:
>   https://lore.kernel.org/all/20250509155927.109258-1-dawei.li@linux.dev/
> 
> Changes in v2:
> - Fix compilation error for !CONFIG_RPMSG_CHAR config(Test robot).
> - Link to v1:
>   https://lore.kernel.org/all/20250507141712.4276-1-dawei.li@linux.dev/
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
> 
> Thanks,
> 
> 	Dawei
> 
> -- 
> 2.25.1
> 
