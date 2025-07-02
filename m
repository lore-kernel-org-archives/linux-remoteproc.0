Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366401F5619;
	Wed,  2 Jul 2025 07:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751442658; cv=none; b=CDl3UhwAErcwEA72ayuzriUXqW6F919guNsloS2W47FVqGvChgkcPwP8TBiBuVdJUyNjRrCotfN4LaWsnymyO5cadl6EGf2uK4iBfDmK+EF0Mj6M/OKAKh6qOLxN0bccnQm6TNGik5NS7ro4kIxtTp2i70eYVZK0ZmachzUDWr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751442658; c=relaxed/simple;
	bh=MhH3YYVBH9VOdNh4VoGi/5ItbJtV9wj2TFwiXuVDgnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=egyvjXzT+C7pJm6sxm/bw+4k0SLkh6dl0AY28ILTQez2t22ehvvgRfxHYT9eZIXCUI/VrcmzFUFVMB4j6pfplv7+bqyGyc+9Wi+xaH624TZVjvMS/qvpi2m/9LVIdSeczaSwPvpKZXyLTvNwX84ZZA8lFf/CgifxrH4gJh5OQ28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=JTaAQ5tq; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="JTaAQ5tq"
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5627dfum032247;
	Wed, 2 Jul 2025 09:50:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	I/ZCqBGkaOyVgMTdMl1PUQIOWsZD4M/QSf93rQq0ccA=; b=JTaAQ5tqKtPgkQw3
	dIPKZHMuooSL4bZYq7/7KyQD9oWOyI/UE+CTuKRHuplhITIGsmb8zWnqQh52YZxi
	hURiVUp1Kp/KHmwPgd3wrZTU88JR9zCL1KJR2rjWKAIP2c+8PMW0NTeS7wkY/9+V
	xP1DzeGeVthnPldZ7T6CDYxFOnYo6fWXZIfgNJpy49d81IQgcBLATVJwQumEGhQP
	il+OI/OgO6FRoVHqnHRryOTQwBDm2mmF2YAqFYXe0A6sO9QWj1+HJXtnv1sLNg4X
	lbDRuN4H0R1qHoh6BWb8N1ssdjix0lnysEkl5yK93XmbFnVc5cjsHxhvE4+wFbcW
	qpe+ag==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47jsy4xj7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 09:50:16 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 247014002D;
	Wed,  2 Jul 2025 09:49:27 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DE71BB94E56;
	Wed,  2 Jul 2025 09:49:00 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 09:49:00 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 09:49:00 +0200
Message-ID: <685641cb-d5e0-4f28-87a1-98d2fd84e920@foss.st.com>
Date: Wed, 2 Jul 2025 09:48:59 +0200
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
 <db2d2296-3893-427d-85ec-f64e6c0e1d1d@foss.st.com>
 <20250622041200.GA3703@wendao-VirtualBox>
 <ce95f80b-4a36-457e-aedd-d59a325a711c@foss.st.com>
 <20250701141607.GA5219@wendao-VirtualBox>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <20250701141607.GA5219@wendao-VirtualBox>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01

hello Dawei

On 7/1/25 16:16, Dawei Li wrote:
> Hi Arnaud,
> 
> Thanks for the reply.
> 
> On Mon, Jun 30, 2025 at 09:54:40AM +0200, Arnaud POULIQUEN wrote:
>> Hello Dawei,
>>
>> Sorry for the late answer.
>>
>> On 6/22/25 06:12, Dawei Li wrote:
>>> Hi Arnaud,
>>>
>>> Thanks for the reply.
>>>
>>> On Fri, Jun 20, 2025 at 09:52:03AM +0200, Arnaud POULIQUEN wrote:
>>>>
>>>>
>>>> On 6/19/25 16:43, Dawei Li wrote:
>>>>> Hi Arnaud, 
>>>>> Thanks for review.
>>>>>
>>>>> On Wed, Jun 18, 2025 at 03:07:36PM +0200, Arnaud POULIQUEN wrote:
>>>>>> Hello Dawei,
>>>>>>
>>>>>>
>>>>>> Please find a few comments below. It is not clear to me which parts of your
>>>>>> implementation are mandatory and which are optional "nice-to-have" optimizations.
>>>>>
>>>>> It's more like an improvement.
>>>>>
>>>>>>
>>>>>> Based on (potentially erroneous) hypothesis, you will find a suggestion for an
>>>>>> alternative to the anonymous inode approach, which does not seem to be a common
>>>>>> interface.
>>>>>
>>>>> AFAIC, annoymous inode is a common interface and used extensivly in kernel development.
>>>>> Some examples below.
>>>>>
>>>>>>
>>>>>>
>>>>>> On 6/9/25 17:15, Dawei Li wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> This is V4 of series which introduce new uAPI(RPMSG_CREATE_EPT_FD_IOCTL)
>>>>>>> for rpmsg subsystem.
>>>>>>>
>>>>>>> Current uAPI implementation for rpmsg ctrl & char device manipulation is
>>>>>>> abstracted in procedures below:
>>>>>>> - fd = open("/dev/rpmsg_ctrlX")
>>>>>>> - ioctl(fd, RPMSG_CREATE_EPT_IOCTL, &info); /dev/rpmsgY devnode is
>>>>>>>   generated.
>>>>>>> - fd_ep = open("/dev/rpmsgY", O_RDWR) 
>>>>>>> - operations on fd_ep(write, read, poll ioctl)
>>>>>>> - ioctl(fd_ep, RPMSG_DESTROY_EPT_IOCTL)
>>>>>>> - close(fd_ep)
>>>>>>> - close(fd)
>>>>>>>
>>>>>>> This /dev/rpmsgY abstraction is less favorable for:
>>>>>>> - Performance issue: It's time consuming for some operations are
>>>>>>> invovled:
>>>>>>>   - Device node creation.
>>>>>>>     Depends on specific config, especially CONFIG_DEVTMPFS, the overall
>>>>>>>     overhead is based on coordination between DEVTMPFS and userspace
>>>>>>>     tools such as udev and mdev.
>>>>>>>
>>>>>>>   - Extra kernel-space switch cost.
>>>>>>>
>>>>>>>   - Other major costs brought by heavy-weight logic like device_add().
>>>>>>
>>>>>> Is this a blocker of just optimization?
>>>>>
>>>>> Yep, performance is one of motivations of this change.
>>>>>
>>>>>>
>>>>>>>
>>>>>>> - /dev/rpmsgY node can be opened only once. It doesn't make much sense
>>>>>>>     that a dynamically created device node can be opened only once.
>>>>>>
>>>>>>
>>>>>> I assume this is blocker with the fact that you need to open the /dev/rpmsg<x>
>>>>>> to create the endpoint.
>>>>>
>>>>> Yes. You have to open /dev/rpmsgX which is generated by legacy ioctl to
>>>>> instantiate a new endpoint.
>>>>>
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> - For some container application such as docker, a client can't access
>>>>>>>   host's dev unless specified explicitly. But in case of /dev/rpmsgY, which
>>>>>>>   is generated dynamically and whose existence is unknown for clients in
>>>>>>>   advance, this uAPI based on device node doesn't fit well.
>>>>>>
>>>>>> does this could be solve in userspace parsing /sys/class/rpmsg/ directory to
>>>>>> retreive the device?
>>>>>
>>>>> Hardly, because client still can't access /dev/rpmsgX which is generated
>>>>> by host _after_ client is launched.
>>>>
>>>>
>>>> This part is not clear to me; could you provide more details?
>>>> I cannot figure out why a client can access /dev/rpmsg_ctrlX but not /dev/rpmsgX.
>>>
>>> Well, let's take docker as example:
>>
>>>
>>> For docker, when a client is launched and it wants to access host's
>>> device, it must make explicit request when it's launched:
>>>
>>> docker run --device=/dev/xxx
>>>
>>> Let's presume that xxx is /dev/rpmsgX generated dynamically by _host_.
>>> Docker command above knows nothing about these rpmsg nodes which are
>>> generated by host _after_ client is launched. And yes, parsing> /sys/class/rpmsg may acquire info about rpmsg devices, but client still
>>> can't access /dev/rpmsgX.
>>
>> One extra question:Are you using RPMsg over virtio?
>>
>> If yes, do you test the RPMsg name service (NS) announcement, that might also
>> address your needs.
>>
>> The principle is that the remote processor sends a name service announcement to
>> Linux, which probes the rpmsg character device and creates the /dev/rpmsgX
>> device in a predefined order known by the remote processor.
>> In such a case, the /dev/rpmsgX usage would be determined by the remote
>> processor itself.
>>
>> Another advantage is that the RPMsg channel creation is not driven by either the
>> host or the client. In such case host does no need to define/kwnow RPMSg
>> endpoint addresses.
>>
>> You still need to call the open() file system operation, but this should be done
>> one time during Docker client initialization.
> 
> NS is nice, but perhaps it's not the approach for some cases.
> 
> For offloading/accelerator scenarios, ACPU is responsible for making all
> the important decisions, including creations of endpoints. Because all
> the user-awared software stack is running on ACPU, and if you want to
> create a endpoint _dynamically_, it must be from user's command which is
> from ACPU.
> 
> And this series is more about how rpmsg_char and rpmsg_ctrl coordinate
> themselves about creating dynamic rpmsg endpoints in a more simple
> and efficient way.
> 
> And the whole point of series is "When you want to return a fd to
> userspace which represents an instance of data structure in kernel, you
> don't implement it as character device". Maybe some quotes from Christian[1]
> can describe it better[1]:
> 
> "I'm not sure why people are so in love with character device based apis.
> It's terrible. It glues everything to devtmpfs which isn't namespacable
> in any way. It's terrible to delegate and extremely restrictive in terms
> of extensiblity if you need additional device entries (aka the loop
> driver folly)."
> 
> [1] https://lkml.org/lkml/2025/6/24/639

Thank you for all your explanations! It is always very interesting to understand
the different ways to use RPMsg.

In the end, I don't see any problem with your series. The possibility of using
an anonymous inode seems valid to me.

I am just wondering whether this should be implemented in the rpmsg_char driver
or in a new driver, addressing this question to Mathieu and Bjorn.


Regards,
Arnaud

> 
> Thanks,
> 
> 	Dawei
> 
>>
>> Regards
>> Arnaud
>>
>>
>>>
>>>>
>>>>
>>>>>
>>>>>>
>>>>>> You could face same kind of random instantiation for serial peripherals ( UART;
>>>>>> USb, I2C,...) based on a device tree enumeration. I suppose that user space
>>>>>> use to solve this.
>>>>>>
>>>>>>>
>>>>>>> An anonymous inode based approach is introduced to address the issues above.
>>>>>>> Rather than generating device node and opening it, rpmsg code just creates
>>>>>>> an anonymous inode representing eptdev and return the fd to userspace.
>>>>>>
>>>>>> A drawback is that you need to share fb passed between processes.
>>>>>
>>>>> Fd is the abstraction of an unique endpoint device, it holds true for
>>>>> both legacy and new approach.
>>>>>
>>>>> So I guess what you mean is that /dev/rpmsgX is global to all so other process
>>>>> can access it?
>>>>>
>>>>> But /dev/rpmsgX is designed to be opened only once, it's implemented as
>>>>> singleton pattern.
>>>>>
>>>>> static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>>>>> {
>>>>> ...
>>>>>         if (eptdev->ept) {
>>>>>                 mutex_unlock(&eptdev->ept_lock);
>>>>>                 return -EBUSY;
>>>>>         }
>>>>> ...
>>>>>         eptdev->ept = ept;
>>>>> ...
>>>>> }
>>>>>
>>>>> [...]
>>>>>  
>>>>>>> 	printf("loop[%d]\n", loop);
>>>>>>>
>>>>>>> 	gettimeofday(&start, NULL);
>>>>>>>
>>>>>>> 	while (loop--) {
>>>>>>
>>>>>> Do you need to create /close Endpoint sevral times in your real use case with
>>>>>> high timing
>>>>>> constraint?
>>>>>
>>>>> No, it's just a silly benchmark demo, large sample reduces noise statistically.
>>>>>
>>>>>>
>>>>>>> 		fd_info.fd = -1;
>>>>>>> 		fd_info.flags = O_RDWR | O_CLOEXEC | O_NONBLOCK;
>>>>>>> 		ret = ioctl(fd, RPMSG_CREATE_EPT_FD_IOCTL, &fd_info);
>>>>>>> 		if (ret < 0 || fd_info.fd < 0) {
>>>>>>> 			printf("ioctl[RPMSG_CREATE_EPT_FD_IOCTL] failed, ret[%d]\n", ret);
>>>>>>> 		}
>>>>>>>
>>>>>>
>>>>>>
>>>>>>> 		ret = ioctl(fd_info.fd, RPMSG_DESTROY_EPT_IOCTL, &info);
>>>>>>> 		if (ret < 0) {
>>>>>>> 			printf("new ioctl[RPMSG_DESTROY_EPT_IOCTL] failed, ret[%d]\n", ret);
>>>>>>> 		}
>>>>>>>
>>>>>>> 		close(fd_info.fd);
>>>>>>
>>>>>> It seems strange to me to use ioctl() for opening and close() for closing, from
>>>>>> a symmetry point of view.
>>>>>
>>>>> Sorry to hear that. But no, it's a pretty normal skill in kernel codebase
>>>>> , I had to copy some examples from reply to other reviewer[1].
>>>>
>>>> I missed this one, apologize for the duplication.
>>>>
>>>>>
>>>>> anon_inode_get_{fd,file} are used extensively in kernel for returning a new
>>>>> fd to userspace which is associated with an unique data structure in kernel
>>>>> space, in different ways:
>>>>>
>>>>> - via ioctl(), some examples are:
>>>>>
>>>>>  - KVM ioctl(s)
>>>>>    - KVM_CREATE_VCPU -> kvm_vm_ioctl_create_vcpu
>>>>>    - KVM_GET_STATS_FD -> kvm_vcpu_ioctl_get_stats_fd
>>>>>    - KVM_CREATE_DEVICE -> kvm_ioctl_create_device
>>>>>    - KVM_CREATE_VM -> kvm_dev_ioctl_create_vm
>>>>>
>>>>>  - DMA buf/fence/sync ioctls
>>>>>    - DMA_BUF_IOCTL_EXPORT_SYNC_FILE -> dma_buf_export_sync_file
>>>>>    - SW_SYNC_IOC_CREATE_FENCE -> sw_sync_ioctl_create_fence
>>>>>    - Couples of driver implement DMA buf by using anon file _implicitly_:
>>>>>      - UDMABUF_CREATE -> udmabuf_ioctl_create
>>>>>      - DMA_HEAP_IOCTL_ALLOC -> dma_heap_ioctl_allocate
>>>>>
>>>>>  - gpiolib ioctls:
>>>>>    - GPIO_GET_LINEHANDLE_IOCTL -> linehandle_create
>>>>>    - GPIO_V2_GET_LINE_IOCTL
>>>>>
>>>>>  -  IOMMUFD ioctls:
>>>>>
>>>>>  -  VFIO Ioctls:
>>>>>
>>>>>  - ....
>>>>>
>>>>>
>>>>> - via other specific syscalls:
>>>>>  - epoll_create1
>>>>>  - bpf
>>>>>  - perf_event_open
>>>>>  - inotify_init
>>>>>  - ...
>>>>
>>>> If we put the optimization aspect aside, what seems strange to me is that the
>>>> purpose of rpmsg_char was to expose a FS character device to user space. If we
>>>> need tobypass the use of /dev/rpmsgX, does it make sense to support an anonymous
>>>> inode in this driver?  I am clearly not legitimate to answer this question...
>>>
>>> You have every right to do so, after all, it's purely a technical
>>> discussion :).
>>>
>>> I admit it's bit confusing to add annoymous inode logic to a file named
>>> rpmsg_char.c which implies 'character' device. That's why I rename API
>>> following Mathieu's comment:
>>>   - __rpmsg_chrdev_eptdev_alloc ->  rpmsg_eptdev_alloc
>>>   - __rpmsg_chrdev_eptdev_add ->  rpmsg_eptdev_add
>>>
>>> As to topic how these two uAPI(s) co-exist and affect each other. This
>>> change is based on rules:
>>>
>>> 1. Never break existing uAPI.
>>> 2. Try best to reuse existing codebase.
>>> 3. Userspace can choose whatever approach they want to.
>>>
>>> Thanks,
>>>
>>> 	Dawei
>>>>
>>>>
>>>> Thanks,
>>>> Arnaud
>>>>
>>>>>
>>>>> [1] https://lore.kernel.org/all/20250530125008.GA5355@wendao-VirtualBox/
>>>>>
>>>>>>
>>>>>> Regarding your implementation, I wonder if we could keep the /dev/rpmsg<x>
>>>>>> device with specific open() and close() file operations associated with your new
>>>>>> ioctl.
>>>>>>
>>>>>> - The ioctl would create the endpoint.
>>>>>> - The open() and close() operations would simply manage the file descriptor and
>>>>>> increment/decrement a counter to prevent premature endpoint destruction.
>>>>>>
>>>>>>
>>>>>> Regards,
>>>>>> Arnaud
>>>>>>
>>>>>
>>>>> [...]
>>>>>
>>>>> Thanks,
>>>>>
>>>>> 	Dawei
