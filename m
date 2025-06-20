Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C4B231841;
	Fri, 20 Jun 2025 07:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406039; cv=none; b=ZQv2/BIgPGrNPLFHRn5BlVb4dCG+qI3hBVNDCdUfLKyFjCysuPYwZELbpMXC9eETig59SvZ5k6+TSsoLk1XuJndcJOKIVUb102O6GlkudS3X/DfiQeY7YFPI5zfQ4IYqo4YHO1UZ4mnORtSRfDb54UF9zCRRax2qQ1xEcG9drEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406039; c=relaxed/simple;
	bh=QBAjZVIHROcckdx/RtVG0POj4hfqqhoi41Flu/KAoiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VE9Grs/mO2WJlvj2Da3i77fQERVqlNgDD0FgFGRaCple1LMa17qkI8Y/wEvdWJYhec8llwfB95leO/j0x9sSCPJVx1uT/isjoqWVpKwnN7x1lQM/rg5Ndxz1NuZhiu08zogeiBrFQRJCjOKCxdgF3fG1HNLaEibAXdkZTuOTuzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=m2PJKjU+; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="m2PJKjU+"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K7mtjs016036;
	Fri, 20 Jun 2025 09:53:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	KwoxSQi/J6LsbwAWa5/UHiWcRgOE08yJ7aqWZZ0l55A=; b=m2PJKjU+aWQjSnqs
	PiHES+/r8yLt+avaOuIs/rwNeC1G5kNa9/+881WiLy4JZXBSJP6ZvPhmg4wlRwBY
	RjMGYk6pnGGcg8lNvGiS6nv0DgJRLdICB7XwHVwUzHFAoR5FrMkCKSM3LTfV9+0s
	aMKu7jPRsGGVP0Xno8oAlkhcb1NztX0atVcD/WOOKSdPRgmuuXIQxa9bziu6UbBq
	3ytNQGX8IJcxhC+tNsjB/txUZYto4p4tDmfVhxC8y2iE39z/vdSsGlPj5JpV4tbx
	QqRkm5baniUy2ioJU92D7Z/kJwaz6MWQx4h7uyLlJ/v03sfq0YfEagnkuijGevBr
	FBbr8w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4790e2n4r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 09:53:19 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0D4B740048;
	Fri, 20 Jun 2025 09:52:29 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8899C4838B0;
	Fri, 20 Jun 2025 09:52:04 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 09:52:04 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 09:52:03 +0200
Message-ID: <db2d2296-3893-427d-85ec-f64e6c0e1d1d@foss.st.com>
Date: Fri, 20 Jun 2025 09:52:03 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] rpmsg: Introduce RPMSG_CREATE_EPT_FD_IOCTL uAPI
To: Dawei Li <dawei.li@linux.dev>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <set_pte_at@outlook.com>
References: <20250609151531.22621-1-dawei.li@linux.dev>
 <f3b99a3d-5d20-4e82-ae5d-75c2c866e118@foss.st.com>
 <20250619144301.GA9575@wendao-VirtualBox>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <20250619144301.GA9575@wendao-VirtualBox>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_03,2025-06-18_03,2025-03-28_01



On 6/19/25 16:43, Dawei Li wrote:
> Hi Arnaud, 
> Thanks for review.
> 
> On Wed, Jun 18, 2025 at 03:07:36PM +0200, Arnaud POULIQUEN wrote:
>> Hello Dawei,
>>
>>
>> Please find a few comments below. It is not clear to me which parts of your
>> implementation are mandatory and which are optional "nice-to-have" optimizations.
> 
> It's more like an improvement.
> 
>>
>> Based on (potentially erroneous) hypothesis, you will find a suggestion for an
>> alternative to the anonymous inode approach, which does not seem to be a common
>> interface.
> 
> AFAIC, annoymous inode is a common interface and used extensivly in kernel development.
> Some examples below.
> 
>>
>>
>> On 6/9/25 17:15, Dawei Li wrote:
>>> Hi,
>>>
>>> This is V4 of series which introduce new uAPI(RPMSG_CREATE_EPT_FD_IOCTL)
>>> for rpmsg subsystem.
>>>
>>> Current uAPI implementation for rpmsg ctrl & char device manipulation is
>>> abstracted in procedures below:
>>> - fd = open("/dev/rpmsg_ctrlX")
>>> - ioctl(fd, RPMSG_CREATE_EPT_IOCTL, &info); /dev/rpmsgY devnode is
>>>   generated.
>>> - fd_ep = open("/dev/rpmsgY", O_RDWR) 
>>> - operations on fd_ep(write, read, poll ioctl)
>>> - ioctl(fd_ep, RPMSG_DESTROY_EPT_IOCTL)
>>> - close(fd_ep)
>>> - close(fd)
>>>
>>> This /dev/rpmsgY abstraction is less favorable for:
>>> - Performance issue: It's time consuming for some operations are
>>> invovled:
>>>   - Device node creation.
>>>     Depends on specific config, especially CONFIG_DEVTMPFS, the overall
>>>     overhead is based on coordination between DEVTMPFS and userspace
>>>     tools such as udev and mdev.
>>>
>>>   - Extra kernel-space switch cost.
>>>
>>>   - Other major costs brought by heavy-weight logic like device_add().
>>
>> Is this a blocker of just optimization?
> 
> Yep, performance is one of motivations of this change.
> 
>>
>>>
>>> - /dev/rpmsgY node can be opened only once. It doesn't make much sense
>>>     that a dynamically created device node can be opened only once.
>>
>>
>> I assume this is blocker with the fact that you need to open the /dev/rpmsg<x>
>> to create the endpoint.
> 
> Yes. You have to open /dev/rpmsgX which is generated by legacy ioctl to
> instantiate a new endpoint.
> 
>>
>>
>>>
>>> - For some container application such as docker, a client can't access
>>>   host's dev unless specified explicitly. But in case of /dev/rpmsgY, which
>>>   is generated dynamically and whose existence is unknown for clients in
>>>   advance, this uAPI based on device node doesn't fit well.
>>
>> does this could be solve in userspace parsing /sys/class/rpmsg/ directory to
>> retreive the device?
> 
> Hardly, because client still can't access /dev/rpmsgX which is generated
> by host _after_ client is launched.


This part is not clear to me; could you provide more details?
I cannot figure out why a client can access /dev/rpmsg_ctrlX but not /dev/rpmsgX.


> 
>>
>> You could face same kind of random instantiation for serial peripherals ( UART;
>> USb, I2C,...) based on a device tree enumeration. I suppose that user space
>> use to solve this.
>>
>>>
>>> An anonymous inode based approach is introduced to address the issues above.
>>> Rather than generating device node and opening it, rpmsg code just creates
>>> an anonymous inode representing eptdev and return the fd to userspace.
>>
>> A drawback is that you need to share fb passed between processes.
> 
> Fd is the abstraction of an unique endpoint device, it holds true for
> both legacy and new approach.
> 
> So I guess what you mean is that /dev/rpmsgX is global to all so other process
> can access it?
> 
> But /dev/rpmsgX is designed to be opened only once, it's implemented as
> singleton pattern.
> 
> static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
> {
> ...
>         if (eptdev->ept) {
>                 mutex_unlock(&eptdev->ept_lock);
>                 return -EBUSY;
>         }
> ...
>         eptdev->ept = ept;
> ...
> }
> 
> [...]
>  
>>> 	printf("loop[%d]\n", loop);
>>>
>>> 	gettimeofday(&start, NULL);
>>>
>>> 	while (loop--) {
>>
>> Do you need to create /close Endpoint sevral times in your real use case with
>> high timing
>> constraint?
> 
> No, it's just a silly benchmark demo, large sample reduces noise statistically.
> 
>>
>>> 		fd_info.fd = -1;
>>> 		fd_info.flags = O_RDWR | O_CLOEXEC | O_NONBLOCK;
>>> 		ret = ioctl(fd, RPMSG_CREATE_EPT_FD_IOCTL, &fd_info);
>>> 		if (ret < 0 || fd_info.fd < 0) {
>>> 			printf("ioctl[RPMSG_CREATE_EPT_FD_IOCTL] failed, ret[%d]\n", ret);
>>> 		}
>>>
>>
>>
>>> 		ret = ioctl(fd_info.fd, RPMSG_DESTROY_EPT_IOCTL, &info);
>>> 		if (ret < 0) {
>>> 			printf("new ioctl[RPMSG_DESTROY_EPT_IOCTL] failed, ret[%d]\n", ret);
>>> 		}
>>>
>>> 		close(fd_info.fd);
>>
>> It seems strange to me to use ioctl() for opening and close() for closing, from
>> a symmetry point of view.
> 
> Sorry to hear that. But no, it's a pretty normal skill in kernel codebase
> , I had to copy some examples from reply to other reviewer[1].

I missed this one, apologize for the duplication.

> 
> anon_inode_get_{fd,file} are used extensively in kernel for returning a new
> fd to userspace which is associated with an unique data structure in kernel
> space, in different ways:
> 
> - via ioctl(), some examples are:
> 
>  - KVM ioctl(s)
>    - KVM_CREATE_VCPU -> kvm_vm_ioctl_create_vcpu
>    - KVM_GET_STATS_FD -> kvm_vcpu_ioctl_get_stats_fd
>    - KVM_CREATE_DEVICE -> kvm_ioctl_create_device
>    - KVM_CREATE_VM -> kvm_dev_ioctl_create_vm
> 
>  - DMA buf/fence/sync ioctls
>    - DMA_BUF_IOCTL_EXPORT_SYNC_FILE -> dma_buf_export_sync_file
>    - SW_SYNC_IOC_CREATE_FENCE -> sw_sync_ioctl_create_fence
>    - Couples of driver implement DMA buf by using anon file _implicitly_:
>      - UDMABUF_CREATE -> udmabuf_ioctl_create
>      - DMA_HEAP_IOCTL_ALLOC -> dma_heap_ioctl_allocate
> 
>  - gpiolib ioctls:
>    - GPIO_GET_LINEHANDLE_IOCTL -> linehandle_create
>    - GPIO_V2_GET_LINE_IOCTL
> 
>  -  IOMMUFD ioctls:
> 
>  -  VFIO Ioctls:
> 
>  - ....
> 
> 
> - via other specific syscalls:
>  - epoll_create1
>  - bpf
>  - perf_event_open
>  - inotify_init
>  - ...

If we put the optimization aspect aside, what seems strange to me is that the
purpose of rpmsg_char was to expose a FS character device to user space. If we
need tobypass the use of /dev/rpmsgX, does it make sense to support an anonymous
inode in this driver?  I am clearly not legitimate to answer this question...


Thanks,
Arnaud

> 
> [1] https://lore.kernel.org/all/20250530125008.GA5355@wendao-VirtualBox/
> 
>>
>> Regarding your implementation, I wonder if we could keep the /dev/rpmsg<x>
>> device with specific open() and close() file operations associated with your new
>> ioctl.
>>
>> - The ioctl would create the endpoint.
>> - The open() and close() operations would simply manage the file descriptor and
>> increment/decrement a counter to prevent premature endpoint destruction.
>>
>>
>> Regards,
>> Arnaud
>>
> 
> [...]
> 
> Thanks,
> 
> 	Dawei
