Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C10032E142
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Oct 2025 14:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712482; cv=none; b=Q7fg0bEzV8b1qfFNzrFHGlEAdJhkOUg6dbC36xW0QbZacIEwgP1kC/yz3A93JmjhZNY4sj4iSoHCMPDhr6dHj8cL7Y5Mbm1to73ZoLBREvBDbO9/Efchw2jOk4tPFfTbG7IbjR48uASoScJrlguUbgBeqAsUuQIPEIR+9huyiHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712482; c=relaxed/simple;
	bh=HJplxAoLXGiZQF9kf+B/09KOCU0GgE9brxiuiplLdIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAm/Tp7/gpHfuDy+aEdMsk5DsLVzUYJfb72/CGBRM4xijSijXeA6n6DYwQmPpjoll33qisdF9NshPHIF6/4s1S0payBxbLf2Iprh6xB3bAot41/vzB7Tb33eVG88+E/M5uSInTOHdl4aq2JFQohs9kBWqYbPnAFdK8Hb6EOFH2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w/OoGnv5; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w/OoGnv5"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-339c9bf3492so2535452a91.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Oct 2025 07:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760712479; x=1761317279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tz8UYunYEGaNriyw6WiQDuHxIstZZ889aQV5Kr6HI54=;
        b=w/OoGnv57NnvXDelt1RdKoY4MWMlWZ0NfIEoIWEnXtxvudbUowiKxSVkhHRW3ZSR7J
         rOdr7qkWO+S5Mm5/84C4rjNcpa9d6RXVF/AHJEz38EdepCdC/x7rvwBbF3jFux1JLF8T
         4s0OtA48xnYgmi7NX15zhBVFI0fPYH8xbbi5U5RJsQAH47j9ZMUh57YpG1GcsTaY6yaJ
         HvZ30XVnxzxx+HAKqYZQA4vuRjAGr3nUtwYauHR3EWexTimQOKK5NAdGUF2Hi+PpB1Mi
         9cSFu3ON9QGoN/pC4wUID3VxreoYPH47A6xPYSrurZZvrdKdOUE3yhFdhhHVqlYixSHy
         YmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760712479; x=1761317279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tz8UYunYEGaNriyw6WiQDuHxIstZZ889aQV5Kr6HI54=;
        b=jHg4aVIJCpm2XI+m3h7Esk5JrRqj0wFUb9+d77ICVu1Q2rEp0Q92KO84uTwJQXepNN
         61iCVZ63dMS4h3zIa5vFoKqx+2eXl4nrk8lMIgeTnUd5/KjS2D5GBmgaOJF+WuwyjQV+
         nKgre5M5AXa23X7gETtqXXFVhI4XLbrM533n3ogF4bQ3zpbpkbSFyj7KgDkY6TrjBTJh
         LVqXL3KptoE/PxJUBzTT9JnS6sUSP1uGzfqd1Al7yxR9uPLYKIWOOYWi5TssPiBeTFVL
         vi1PQbkaKf0AixYC7J9Xyt4w+CAeIjHtoO52IAdlX5Rr/YEX4b4lVghPxfeyz5qYlSxZ
         QGug==
X-Forwarded-Encrypted: i=1; AJvYcCV9e7IDn0q6J22uxTzzjuyBIRtG05SSPrxphbuDNbVEx+XbwJuenTqle/uR3GSkU9RbRJmZqZxVurOXLsYu1Oy/@vger.kernel.org
X-Gm-Message-State: AOJu0Yze+dTAh0KIDlQp/Oh/37q9NZupQz9AuWqI7h66Cx26XzP3cmCu
	VzMNHLi99ysFi+lQ+W67N/oNTclvSPvs5xl4VoL5MDhjJ0ffV56p/tTG2Zk7YN1LSEU=
X-Gm-Gg: ASbGncsO0W/wurGstU1tvQ7cMjzClQ8JnOS2i8dN13ul9y2HqI5H0Ic5ciccK3sbdRn
	+U+PhfnOm9n7C8nfG6Ue3YVKgJwL1ATfPW4Aec7wuGv2fVKyHs9bgB+SfARKFdZNx2yBQNkVJdh
	NS7JWjF8YqXwzt7czzbuR5I3ctla24xZWKQRtQuevRkgXFP+L4swVY0BLPoGj26kqDdZ+K2L5Gz
	BULz8c3dT9292nj5z7/0b6h6KtcM/JefP6Te83mqPh0hlhDwuPDsAPIsjsiWj4A6lbIkOax9nAc
	3+BhpBL25mW3SAnklYONuQRpqKSZwveZqAq2aWAmvoJesPQLSgsPKEzV9LpuYuGrNoKrL3cBa85
	1SkCoR1O6PZNA8pmUEhsVXhsYsUu3r3UrjvHp4zpvoUNYy2YzVZZlL6YsPMcCr2ylFcJAf+Z5GJ
	SVg6XtfnSKB2mGDw==
X-Google-Smtp-Source: AGHT+IFFv67bzyQb985R+6jllClmrOMayTWiNbjhxT/kqbV+V00yKrZ2LAKj91q+RwNLrzPymSKT2w==
X-Received: by 2002:a17:90b:4f41:b0:32d:17ce:49d5 with SMTP id 98e67ed59e1d1-33bcf8ec618mr5302922a91.23.1760712478687;
        Fri, 17 Oct 2025 07:47:58 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:a70a:89e5:9a8a:630f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bb6298651sm5788314a91.0.2025.10.17.07.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 07:47:58 -0700 (PDT)
Date: Fri, 17 Oct 2025 08:47:56 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Dawei Li <dawei.li@linux.dev>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, set_pte_at@outlook.com
Subject: Re: [PATCH v5 0/3] rpmsg: Introduce RPMSG_CREATE_EPT_FD_IOCTL uAPI
Message-ID: <aPJXHCRWiN9bm54D@p14s>
References: <20251015151718.3927-1-dawei.li@linux.dev>
 <aPEP9EdZ8tIAVwyE@p14s>
 <20251016162844.GA2725@wendao-VirtualBox>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016162844.GA2725@wendao-VirtualBox>

On Fri, Oct 17, 2025 at 12:28:44AM +0800, Dawei Li wrote:
> Hi, Mathieu, 
> 
> On Thu, Oct 16, 2025 at 09:32:04AM -0600, Mathieu Poirier wrote:
> > I have applied this set.
> > 
> > Thanks,
> > Mathieu
> 
> It seems that it is v4 being applied? [1]

I don't know how it came to that but it is fixed now.

Thanks for bringing this to my attention,
Mathieu

> 
> The only difference between v4 and v5 is commit message, though.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/commit/?h=rpmsg-next&id=00af63201cbb7903e5deb2a9fdebd97f979492e5
> 
> > 
> > On Wed, Oct 15, 2025 at 11:17:15PM +0800, Dawei Li wrote:
> > > Hi,
> > > 
> > > This is V5 of series which introduce new uAPI(RPMSG_CREATE_EPT_FD_IOCTL)
> > > for rpmsg subsystem.
> > > 
> > > Current uAPI implementation for rpmsg ctrl & char device manipulation is
> > > abstracted in procedures below:
> > > - fd = open("/dev/rpmsg_ctrlX")
> > > - ioctl(fd, RPMSG_CREATE_EPT_IOCTL, &info); /dev/rpmsgY devnode is
> > >   generated.
> > > - fd_ep = open("/dev/rpmsgY", O_RDWR)
> > > - operations on fd_ep(write, read, poll ioctl)
> > > - ioctl(fd_ep, RPMSG_DESTROY_EPT_IOCTL)
> > > - close(fd_ep)
> > > - close(fd)
> > > 
> > > This /dev/rpmsgY abstraction is less favorable for:
> > > - Performance issue: It's time consuming for some operations are
> > > involved:
> > >   - Device node creation.
> > >     Depends on specific config, especially CONFIG_DEVTMPFS, the overall
> > >     overhead is based on coordination between DEVTMPFS and userspace
> > >     tools such as udev and mdev.
> > >   - Extra kernel-userspace switch cost.
> > >   - Other major costs brought by heavy-weight logic like device_add().
> > > 
> > > - /dev/rpmsgY node can be opened only once. It doesn't make much sense
> > >     that a dynamically created device node can be opened only once.
> > > 
> > > - For some container application such as docker, a client can't access
> > >   host's dev unless specified explicitly. But in case of /dev/rpmsgY, which
> > >   is generated dynamically and whose existence is unknown for clients in
> > >   advance, this uAPI based on device node doesn't fit well.
> > > 
> > > An anonymous inode based approach is introduced to address the issues
> > > above. Rather than generating device node and opening it, rpmsg code just
> > > creates an anonymous inode representing eptdev and return the fd to
> > > userspace.
> > > 
> > > Performance demo
> > > 
> > > A simple C application is tested to verify performance of new uAPI.
> > > Please be noted that all '#' in code are preceded with space to suppress
> > > checkpatch complaints.
> > > 
> > > $ cat test.c
> > > 
> > >  #include <linux/rpmsg.h>
> > > 
> > >  #include <sys/types.h>
> > >  #include <sys/stat.h>
> > >  #include <sys/ioctl.h>
> > >  #include <fcntl.h>
> > >  #include <string.h>
> > >  #include <stdio.h>
> > >  #include <unistd.h>
> > >  #include <stdlib.h>
> > >  #include <errno.h>
> > >  #include <sys/time.h>
> > > 
> > >  #define N (1 << 20)
> > > 
> > > int main(int argc, char *argv[])
> > > {
> > > 	int ret, fd, ep_fd, loop;
> > > 	struct rpmsg_endpoint_info info;
> > > 	struct rpmsg_endpoint_fd_info fd_info;
> > > 	struct timeval start, end;
> > > 	int i = 0;
> > > 	double t1, t2;
> > > 
> > > 	fd = -1;
> > > 	ep_fd = -1;
> > > 	loop = N;
> > > 
> > > 	if (argc == 1) {
> > > 		loop = N;
> > > 	} else if (argc > 1) {
> > > 		loop = atoi(argv[1]);
> > > 	}
> > > 
> > > 	printf("loop[%d]\n", loop);
> > > 
> > > 	strcpy(info.name, "epx");
> > > 	info.src = -1;
> > > 	info.dst = -1;
> > > 
> > > 	strcpy(fd_info.name, "epx");
> > > 	fd_info.src = -1;
> > > 	fd_info.dst = -1;
> > > 	fd_info.fd = -1;
> > > 
> > > 	while (fd < 0) {
> > > 		fd = open("/dev/rpmsg_ctrl0", O_RDWR);
> > > 		if (fd < 0) {
> > > 			printf("open rpmsg_ctrl0 failed, fd[%d]\n", fd);
> > > 		}
> > > 	}
> > > 
> > > 	gettimeofday(&start, NULL);
> > > 
> > > 	while (loop--) {
> > > 		ret = ioctl(fd, RPMSG_CREATE_EPT_IOCTL, &info);
> > > 		if (ret < 0) {
> > > 			printf("ioctl[RPMSG_CREATE_EPT_IOCTL] failed,
> > > 			ret[%d]\n", ret);
> > > 		}
> > > 
> > > 		ep_fd = -1;
> > > 		i = 0;
> > > 
> > > 		while (ep_fd < 0) {
> > > 			ep_fd = open("/dev/rpmsg0", O_RDWR);
> > > 			if (ep_fd < 0) {
> > > 				i++;
> > > 				printf("open rpmsg0 failed, epfd[%d]\n", ep_fd);
> > > 			}
> > > 		}
> > > 
> > > 		ret = ioctl(ep_fd, RPMSG_DESTROY_EPT_IOCTL, &info);
> > > 		if (ret < 0) {
> > > 			printf("old RPMSG_DESTROY_EPT_IOCTL failed, ret[%d], errno[%d]\n",
> > > 			ret, errno);
> > > 		}
> > > 
> > > 		close(ep_fd);
> > > 	}
> > > 	
> > > 	gettimeofday(&end, NULL);
> > > 
> > > 	printf("time for old way: [%ld] us\n",
> > > 		1000000 * (end.tv_sec - start.tv_sec) + end.tv_usec - start.tv_usec);
> > > 	t1 = 1000000 * (end.tv_sec - start.tv_sec) + end.tv_usec - start.tv_usec;
> > > 
> > > 	if (argc == 1) {
> > > 		loop = N;
> > > 	} else if (argc > 1) {
> > > 		loop = atoi(argv[1]);
> > > 	}
> > > 
> > > 	printf("loop[%d]\n", loop);
> > > 
> > > 	gettimeofday(&start, NULL);
> > > 
> > > 	while (loop--) {
> > > 		fd_info.fd = -1;
> > > 		fd_info.flags = O_RDWR | O_CLOEXEC | O_NONBLOCK;
> > > 		ret = ioctl(fd, RPMSG_CREATE_EPT_FD_IOCTL, &fd_info);
> > > 		if (ret < 0 || fd_info.fd < 0) {
> > > 			printf("ioctl[RPMSG_CREATE_EPT_FD_IOCTL] failed, ret[%d]\n", ret);
> > > 		}
> > > 
> > > 		ret = ioctl(fd_info.fd, RPMSG_DESTROY_EPT_IOCTL, &info);
> > > 		if (ret < 0) {
> > > 			printf("new ioctl[RPMSG_DESTROY_EPT_IOCTL] failed, ret[%d]\n", ret);
> > > 		}
> > > 
> > > 		close(fd_info.fd);
> > > 	}
> > > 	
> > > 	gettimeofday(&end, NULL);
> > > 
> > > 	printf("time for new way: [%ld] us\n",
> > > 	1000000 * (end.tv_sec - start.tv_sec) + end.tv_usec - start.tv_usec);
> > > 	t2 = 1000000 * (end.tv_sec - start.tv_sec) + end.tv_usec - start.tv_usec;
> > > 
> > > 	printf("t1(old) / t2(new) = %f\n", t1 / t2);
> > > 
> > > 	close(fd);
> > > }
> > > 
> > > Performance benchmark
> > > 
> > > - Legacy means benchmark based on old uAPI
> > > - New means benchmark based on new uAPI(the one this series introduce)
> > > - Time are in units of us(10^-6 s)
> > > 
> > > Test	loops	Total time(legacy)	Total time(new)	legacy/new	
> > > 1	1000	148362			1153		128.674761	
> > > 2	1000	145640			1121		129.919715	
> > > 3	1000	145303			1174		123.767462	
> > > 4	1000	150294			1142		131.605954	
> > > 5	1000	160877			1175		136.916596	
> > > 6	1000	154400			1134		136.155203	
> > > 7	1000	143252			1163		123.174549	
> > > 8	1000	148758			1161		128.129199
> > > 9	1000	149044			1112		134.032374
> > > 10	1000	146895			1192		123.234060
> > > 11	10000	1428967			11627		122.900748
> > > 12	10000	1367015			10557		129.488965
> > > 13	10000	1371919			11663		117.630027
> > > 14	10000	1358447			11080		122.603520
> > > 15	10000	1375463			11245		122.317741
> > > 16	10000	1364901			11153		122.379718
> > > 17	10000	1352665			10735		126.005123
> > > 18	10000	1400873			11341		123.522882
> > > 19	10000	1391276			10892		127.733750
> > > 20	10000	1394367			11110		125.505581
> > > 21	100000	14069671		115569		121.742604
> > > 22	100000	13663364		117074		116.707074
> > > 23	100000	13735740		115638		118.782234
> > > 24	100000	13714441		119362		114.897882
> > > 25	100000	13904366		118282		117.552679
> > > 26	100000	13870560		117717		117.829710
> > > 27	100000	13713605		118312		115.910516
> > > 28	100000	13872852		114347		121.322396
> > > 29	100000	13777964		119072		115.711200
> > > 30	100000	13725654		116296		118.023440
> > > 
> > > Changelog:
> > > 
> > > Changes in v5:
> > > - Rebased on v6.18.rc1.
> > > - Fix checkpatch warning on commit msg on patch[1/3].
> > > - Other minor commit msg tweaks.
> > > - Update performance testing results.
> > > - Link to v4:
> > >   https://lore.kernel.org/all/20250609151531.22621-1-dawei.li@linux.dev/
> > > 
> > > Changes in v4:
> > > - Build warning of copy_to_user (Dan).
> > > - ioctl() branches reorder (Beleswar).
> > > - Remove local variable fd and pass &ept_fd_info.fd to
> > >   rpmsg_anonymous_eptdev_create().
> > > - Link to v3:
> > >   https://lore.kernel.org/all/20250519150823.62350-1-dawei.li@linux.dev/
> > > 
> > > Changes in v3:
> > > - s/anon/anonymous (Mathieu)
> > > - API naming adjustment (Mathieu)
> > >   - __rpmsg_chrdev_eptdev_alloc ->  rpmsg_eptdev_alloc
> > >   - __rpmsg_chrdev_eptdev_add ->  rpmsg_eptdev_add
> > > - Add parameter 'flags' to uAPI so user can specify file flags
> > >   explicitly on creating anonymous inode.
> > > - Link to v2:
> > >   https://lore.kernel.org/all/20250509155927.109258-1-dawei.li@linux.dev/
> > > 
> > > Changes in v2:
> > > - Fix compilation error for !CONFIG_RPMSG_CHAR config(Test robot).
> > > - Link to v1:
> > >   https://lore.kernel.org/all/20250507141712.4276-1-dawei.li@linux.dev/
> > > 
> > > Dawei Li (3):
> > >   rpmsg: char: Reuse eptdev logic for anonymous device
> > >   rpmsg: char: Implement eptdev based on anonymous inode
> > >   rpmsg: ctrl: Introduce RPMSG_CREATE_EPT_FD_IOCTL uAPI
> > > 
> > >  drivers/rpmsg/rpmsg_char.c | 129 ++++++++++++++++++++++++++++++-------
> > >  drivers/rpmsg/rpmsg_char.h |  23 +++++++
> > >  drivers/rpmsg/rpmsg_ctrl.c |  35 ++++++++--
> > >  include/uapi/linux/rpmsg.h |  27 +++++++-
> > >  4 files changed, 182 insertions(+), 32 deletions(-)
> > > 
> > > ---
> > > 
> > > Thanks,
> > > 
> > > 	Dawei
> > > 
> > > -- 
> > > 2.25.1
> > > 
> 
> Thanks,
> 
> 	Dawei
