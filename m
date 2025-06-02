Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B399213AA31;
	Mon,  2 Jun 2025 09:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748854858; cv=none; b=nCbd1JA5KklDpT0PPPltyjUrBSdAPFZVwI3fDUsDHGAfwOSpE0l9tLI7kh4LaiLsRvKYG/64iDnGuXvxcpfY+ET6nMtwTJsNCnCOZWbklS0myYFTpGhD2QCOJsrwZ5dBMdBDNEibDSZX1tOEaTsgAIy+JQJ2B6Sc0J9ytutvHZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748854858; c=relaxed/simple;
	bh=BcrFlaN0DUSc4XMSGVel1jTYhQ2Rep8XFTvxQKHq5GY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WBC+L1JoEfIgU06t3JBWm3kAlwsnAwR+4J6XVXl+nFbLPqdGqTGd0ePD3Zv8n2NK+8cXd6VWv5/h7k96xYr+7flQzTEJyUFrbEniiW7CfyKsFAl1On+ksSJA0SjsuhxmCzVY399cRoFYQGh/EqeQ/EcG+FH0+bDT6Ip3gU/os0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TyfeeaTT; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TyfeeaTT"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55290NAC3198912;
	Mon, 2 Jun 2025 04:00:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748854823;
	bh=ic9euyyuVWJr6eusG8wsLT5gPn6K8vh92egg+XHV9Gc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TyfeeaTTmt132lYJ3PNV7vkmAlgfwMX6T0ZlW2CpqUw4NUKVG6mRKvYknJoIxoGq8
	 knJeHnCjaw1Z9J9rCYwyrVt7q+ec/YdHQ1Qoqa5H46UO1Koc0W4FfcRKTwtfPAmV1l
	 ejoy5LVp7YfKMtQ66K/grvga/tVtw1dhf+SEHRQQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55290NEa2848944
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 2 Jun 2025 04:00:23 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Jun 2025 04:00:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Jun 2025 04:00:23 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55290KSL2681428;
	Mon, 2 Jun 2025 04:00:21 -0500
Message-ID: <77dd25e4-a807-4a7f-902a-7b362f2ce6c0@ti.com>
Date: Mon, 2 Jun 2025 14:30:20 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] rpmsg: ctrl: Introduce RPMSG_CREATE_EPT_FD_IOCTL
 uAPI
To: Dawei Li <dawei.li@linux.dev>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <set_pte_at@outlook.com>
References: <20250519150823.62350-1-dawei.li@linux.dev>
 <20250519150823.62350-4-dawei.li@linux.dev>
 <7e983702-6662-465d-86ac-d515849d731d@ti.com>
 <20250530125008.GA5355@wendao-VirtualBox>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <20250530125008.GA5355@wendao-VirtualBox>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Dawei,

On 30/05/25 18:20, Dawei Li wrote:
> HI Beleswar,
>
> Thanks for reviewing.
>
> On Fri, May 30, 2025 at 03:15:28PM +0530, Beleswar Prasad Padhi wrote:
>> Hi Dawei,
>>
>> On 19/05/25 20:38, Dawei Li wrote:
>>> Implement RPMSG_CREATE_EPT_FD_IOCTL, new uAPI for rpmsg ctrl, which
>>> shares most of operations of RPMSG_CREATE_EPT_IOCTL except that it
>>> returns fd representing eptdev to userspace directly.
>>>
>>> Possible calling procedures for userspace are:
>>> - fd = open("/dev/rpmsg_ctrlX")
>>> - ioctl(fd, RPMSG_CREATE_EPT_FD_IOCTL, &info);
>>> - fd_ep = info.fd
>>
>> We are returning a new fd to userspace from inside an IOCTL itself. Is this a
>> standard way of doing things in Kernel space? (see below related comment)
> Yes, anon_get_{fd,file} are used extensively in kernel for returning a new
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


Thank you for the extensive list of examples!

>
>>> - operations on fd_ep(write, read, poll ioctl)
>>> - ioctl(fd_ep, RPMSG_DESTROY_EPT_IOCTL)
>>> - close(fd_ep)
>>
>> Can we rely on the userspace to close() the fd_ep? (if not done, could be a
>> memory leak..).. Opposed to fd, which we can rely on the userspace to
>> close() since they initiated the open() call. I am just trying to understand if
>> this is a standard way of doing things...
> Good question.
>
> When userland gets a fd from kernel, it's userland's duty to manage and release
> the resource when it's done with it, because kernel never knows when the fd and
> its resourcen are not needed by userland except process is on exiting. The fact
> remains true no matter how fd is generated from kernel:
> - open()
> - ioctl()
> - Other syscalls(epoll_create1, e.g, as listed above)
>
> As a result, kernel & driver provide fops->release() to achieve resource
> release when fd is not needed for userland, some callers of it maybe:
> - Userland call close() explicitly
> - Kernel does the dirty job when user process exits(if some fds are
>   still opened):
>   - Userland call exit() explicitly.
>   - User process was killed by some signals.
>
> Maybe some comments/docs are needed in uAPI?


Perhaps yes. It makes sense to me now. Thanks for addressing my queries!

>
>>> - close(fd)
>>>
> [snip]
>
>>> +
>>> +	if (cmd == RPMSG_CREATE_EPT_IOCTL || cmd == RPMSG_CREATE_DEV_IOCTL ||
>>> +	    cmd == RPMSG_RELEASE_DEV_IOCTL) {
>>> +		if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
>>> +			return -EFAULT;
>>> +
>>> +		memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
>>> +		chinfo.name[RPMSG_NAME_SIZE - 1] = '\0';
>>> +		chinfo.src = eptinfo.src;
>>> +		chinfo.dst = eptinfo.dst;
>>> +	} else if (cmd == RPMSG_CREATE_EPT_FD_IOCTL) {
>>
>> Maybe we can put this 'else if condition' in the first 'if' and treat other
>> conditions under 'else', as 'RPMSG_CREATE_EPT_FD_IOCTL' is the only
>> ioctl with a different struct type.
> Good point! I will try to address it in next respin.


Thanks,
Beleswar

>
>> Thanks,
>> Beleswar
>>
>>> +		if (copy_from_user(&ept_fd_info, argp, sizeof(ept_fd_info)))
>>> +			return -EFAULT;
>>> +
>>> +		memcpy(chinfo.name, ept_fd_info.name, RPMSG_NAME_SIZE);
>>> +		chinfo.name[RPMSG_NAME_SIZE - 1] = '\0';
>>> +		chinfo.src = ept_fd_info.src;
>>> +		chinfo.dst = ept_fd_info.dst;
>>> +	}
>>>  
> [snip]
>
> Thanks,
>
> 	Dawei
