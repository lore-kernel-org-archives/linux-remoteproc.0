Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4BA226541
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Jun 2025 14:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344210; cv=none; b=aFUbOEHNT98drsNsZHjjf4Hx/B9qeGtoxnRDlGQdmcJdclGAUoRIKV0UeIayBkuEXkmb2aVxLKerSF2W1nuS2rkPF7jLYT+9Xzd3PzNBoadhTkUAhIamclEXGWb1LrVEqTaSXhhb6oJWLxGZQ4u4CVIU7AXZImaiXqxVqnT5ZV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344210; c=relaxed/simple;
	bh=BDrXN8cEKhWfXlTshh+iy/iDJNY5nWZhoBV77lo3Y/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EmfjfvEYJTg3QR3/g0VKne7AttovssWiYdlOKR06g+H4LaxGU4DUH4Tq7XLRuDNqOiKLeXo58WEc7d6ieKMRaFiSL92l56AUl4BA0sdN2JAhDDvxkP/76WoGp4Ce3EW2vmALqnHt40gv64KpN5rOxOkKV07oWZaa9C3TmIzsCdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=taUDo0WC; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="taUDo0WC"
Date: Thu, 19 Jun 2025 22:43:01 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750344196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9KW3ogTMNpUoc7AGxHr/wt079K5mnLuDr9bP8sPDr+Q=;
	b=taUDo0WCH+TRlje236wmJXC0Smz+GART3fNhfyLkDplSN+xn3qokccye0V4OZb/ro1T7PW
	Vz7h/PVoC1EY+nNKOsmJk2/xYaejOkKoqbZKInuVOmzOh1n36GfGbWYkPDYbVkKP0G9vYF
	HYubp3NDCeyz0tiqlEjnFb7dpwnlmZg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Dawei Li <dawei.li@linux.dev>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	set_pte_at@outlook.com, dawei.li@linux.dev
Subject: Re: [PATCH v4 0/3] rpmsg: Introduce RPMSG_CREATE_EPT_FD_IOCTL uAPI
Message-ID: <20250619144301.GA9575@wendao-VirtualBox>
References: <20250609151531.22621-1-dawei.li@linux.dev>
 <f3b99a3d-5d20-4e82-ae5d-75c2c866e118@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3b99a3d-5d20-4e82-ae5d-75c2c866e118@foss.st.com>
X-Migadu-Flow: FLOW_OUT

Hi Arnaud, 
Thanks for review.

On Wed, Jun 18, 2025 at 03:07:36PM +0200, Arnaud POULIQUEN wrote:
> Hello Dawei,
> 
> 
> Please find a few comments below. It is not clear to me which parts of your
> implementation are mandatory and which are optional "nice-to-have" optimizations.

It's more like an improvement.

> 
> Based on (potentially erroneous) hypothesis, you will find a suggestion for an
> alternative to the anonymous inode approach, which does not seem to be a common
> interface.

AFAIC, annoymous inode is a common interface and used extensivly in kernel development.
Some examples below.

> 
> 
> On 6/9/25 17:15, Dawei Li wrote:
> > Hi,
> > 
> > This is V4 of series which introduce new uAPI(RPMSG_CREATE_EPT_FD_IOCTL)
> > for rpmsg subsystem.
> > 
> > Current uAPI implementation for rpmsg ctrl & char device manipulation is
> > abstracted in procedures below:
> > - fd = open("/dev/rpmsg_ctrlX")
> > - ioctl(fd, RPMSG_CREATE_EPT_IOCTL, &info); /dev/rpmsgY devnode is
> >   generated.
> > - fd_ep = open("/dev/rpmsgY", O_RDWR) 
> > - operations on fd_ep(write, read, poll ioctl)
> > - ioctl(fd_ep, RPMSG_DESTROY_EPT_IOCTL)
> > - close(fd_ep)
> > - close(fd)
> > 
> > This /dev/rpmsgY abstraction is less favorable for:
> > - Performance issue: It's time consuming for some operations are
> > invovled:
> >   - Device node creation.
> >     Depends on specific config, especially CONFIG_DEVTMPFS, the overall
> >     overhead is based on coordination between DEVTMPFS and userspace
> >     tools such as udev and mdev.
> > 
> >   - Extra kernel-space switch cost.
> > 
> >   - Other major costs brought by heavy-weight logic like device_add().
> 
> Is this a blocker of just optimization?

Yep, performance is one of motivations of this change.

> 
> > 
> > - /dev/rpmsgY node can be opened only once. It doesn't make much sense
> >     that a dynamically created device node can be opened only once.
> 
> 
> I assume this is blocker with the fact that you need to open the /dev/rpmsg<x>
> to create the endpoint.

Yes. You have to open /dev/rpmsgX which is generated by legacy ioctl to
instantiate a new endpoint.

> 
> 
> > 
> > - For some container application such as docker, a client can't access
> >   host's dev unless specified explicitly. But in case of /dev/rpmsgY, which
> >   is generated dynamically and whose existence is unknown for clients in
> >   advance, this uAPI based on device node doesn't fit well.
> 
> does this could be solve in userspace parsing /sys/class/rpmsg/ directory to
> retreive the device?

Hardly, because client still can't access /dev/rpmsgX which is generated
by host _after_ client is launched.

> 
> You could face same kind of random instantiation for serial peripherals ( UART;
> USb, I2C,...) based on a device tree enumeration. I suppose that user space
> use to solve this.
> 
> > 
> > An anonymous inode based approach is introduced to address the issues above.
> > Rather than generating device node and opening it, rpmsg code just creates
> > an anonymous inode representing eptdev and return the fd to userspace.
> 
> A drawback is that you need to share fb passed between processes.

Fd is the abstraction of an unique endpoint device, it holds true for
both legacy and new approach.

So I guess what you mean is that /dev/rpmsgX is global to all so other process
can access it?

But /dev/rpmsgX is designed to be opened only once, it's implemented as
singleton pattern.

static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
{
...
        if (eptdev->ept) {
                mutex_unlock(&eptdev->ept_lock);
                return -EBUSY;
        }
...
        eptdev->ept = ept;
...
}

[...]
 
> > 	printf("loop[%d]\n", loop);
> > 
> > 	gettimeofday(&start, NULL);
> > 
> > 	while (loop--) {
> 
> Do you need to create /close Endpoint sevral times in your real use case with
> high timing
> constraint?

No, it's just a silly benchmark demo, large sample reduces noise statistically.

> 
> > 		fd_info.fd = -1;
> > 		fd_info.flags = O_RDWR | O_CLOEXEC | O_NONBLOCK;
> > 		ret = ioctl(fd, RPMSG_CREATE_EPT_FD_IOCTL, &fd_info);
> > 		if (ret < 0 || fd_info.fd < 0) {
> > 			printf("ioctl[RPMSG_CREATE_EPT_FD_IOCTL] failed, ret[%d]\n", ret);
> > 		}
> > 
> 
> 
> > 		ret = ioctl(fd_info.fd, RPMSG_DESTROY_EPT_IOCTL, &info);
> > 		if (ret < 0) {
> > 			printf("new ioctl[RPMSG_DESTROY_EPT_IOCTL] failed, ret[%d]\n", ret);
> > 		}
> > 
> > 		close(fd_info.fd);
> 
> It seems strange to me to use ioctl() for opening and close() for closing, from
> a symmetry point of view.

Sorry to hear that. But no, it's a pretty normal skill in kernel codebase
, I had to copy some examples from reply to other reviewer[1].

anon_inode_get_{fd,file} are used extensively in kernel for returning a new
fd to userspace which is associated with an unique data structure in kernel
space, in different ways:

- via ioctl(), some examples are:

 - KVM ioctl(s)
   - KVM_CREATE_VCPU -> kvm_vm_ioctl_create_vcpu
   - KVM_GET_STATS_FD -> kvm_vcpu_ioctl_get_stats_fd
   - KVM_CREATE_DEVICE -> kvm_ioctl_create_device
   - KVM_CREATE_VM -> kvm_dev_ioctl_create_vm

 - DMA buf/fence/sync ioctls
   - DMA_BUF_IOCTL_EXPORT_SYNC_FILE -> dma_buf_export_sync_file
   - SW_SYNC_IOC_CREATE_FENCE -> sw_sync_ioctl_create_fence
   - Couples of driver implement DMA buf by using anon file _implicitly_:
     - UDMABUF_CREATE -> udmabuf_ioctl_create
     - DMA_HEAP_IOCTL_ALLOC -> dma_heap_ioctl_allocate

 - gpiolib ioctls:
   - GPIO_GET_LINEHANDLE_IOCTL -> linehandle_create
   - GPIO_V2_GET_LINE_IOCTL

 -  IOMMUFD ioctls:

 -  VFIO Ioctls:

 - ....


- via other specific syscalls:
 - epoll_create1
 - bpf
 - perf_event_open
 - inotify_init
 - ...

[1] https://lore.kernel.org/all/20250530125008.GA5355@wendao-VirtualBox/

> 
> Regarding your implementation, I wonder if we could keep the /dev/rpmsg<x>
> device with specific open() and close() file operations associated with your new
> ioctl.
> 
> - The ioctl would create the endpoint.
> - The open() and close() operations would simply manage the file descriptor and
> increment/decrement a counter to prevent premature endpoint destruction.
> 
> 
> Regards,
> Arnaud
> 

[...]

Thanks,

	Dawei
