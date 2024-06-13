Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10EF145A05;
	Thu, 13 Jun 2024 12:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718281388; cv=none; b=W5sIGvQqCfATYf9570meFaieyzqiVCLqWB+bxRZxCKIBNUYz2nAhsR27aiMkC3JJNDjbhRbCM9DQSg/00W2FLyjCUgcDP0aZWZcUvwAF65XtW51LZw26JUYJicyDdzwwPG0PMlkeWIYhkKugdBOeamHPFbl/xCbGRjtFM3prOLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718281388; c=relaxed/simple;
	bh=7BhglA9P1ktApG4exvx07jkQ2/kEZPDx3zbnhN9Zbjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FAMTWcQecIKwTGmQI4aFhXJTbx4J3rD34IkJUrpRs64FRrSZ66IlnQUx+Lg/Fxa+msztOGJ9SFODwClxZX2wy7X6b+9pr6v/c9kt679YpnY5kjpuy2gF8OelXaMXw4sY4myuO1iHZwU4yIhw4o50E5XMeRYfYqeSLgsJ9+wY764=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rWr+RYog; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rWr+RYog"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45DCMwxn027663;
	Thu, 13 Jun 2024 07:22:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718281378;
	bh=L70UNxdpaq0S2wJPrq0c1IXObwK10+BK3AYf6wz/scc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rWr+RYogOHS6KQGFq65jT4uAdN0Dq72bXcDtwvzFkX3PJgOSJ7ysXNL09uPLtvsin
	 DNk5jNnaPBxUTqQix74q9HIdirkv/+FWHpi/2Kw9EOgdOHajz8lpjLskyEYn+maedp
	 nL8k2nfsMaJXMN736KJ5iPF/fq+2A3IYII1OVdJU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45DCMw74001144
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Jun 2024 07:22:58 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Jun 2024 07:22:57 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Jun 2024 07:22:57 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45DCMvMT007951;
	Thu, 13 Jun 2024 07:22:57 -0500
Message-ID: <4d7c1525-a3d1-48f3-9e9c-eb61527a1b23@ti.com>
Date: Thu, 13 Jun 2024 07:22:57 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] OMAP mailbox FIFO removal
To: Dominic Rath <dominic.rath@ibv-augsburg.net>,
        Jassi Brar
	<jassisinghbrar@gmail.com>, Hari Nagalla <hnagalla@ti.com>,
        Nick Saulnier
	<nsaulnier@ti.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240410135942.61667-1-afd@ti.com>
 <b5c8d134-edcb-4a1a-8940-b26047c9b79d@ibv-augsburg.net>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <b5c8d134-edcb-4a1a-8940-b26047c9b79d@ibv-augsburg.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 6/13/24 2:58 AM, Dominic Rath wrote:
> Hello Andrew,
> 
> On 10.04.2024 15:59, Andrew Davis wrote:
>> Changes for v2:
>>   - Use threaded irq as suggested by Hari and to
>>       fix possible "scheduling while atomic" issue
> 
> sorry for beeing late, I noticed this already got merged.
> 
> I was wondering what the reason was for ending up with the
> threaded irq.
> 
> In your v1 thread your final conclusion appeared to be
> 
>> So for now I just kept this using the regular IRQ context as before.
> 
> We looked into this some time ago, and noticed that the IRQ approach caused problems in the virtio/rpmsg code. I'd like to understand if your change was for the same reason, or something else we missed before.
> 

It is most likely the same reason. Seems despite its name, rproc_vq_interrupt() cannot
be called from an IRQ/atomic context. As the following backtrace shows, that function
calls down into functions which are not IRQ safe. So we needed to keep it threaded:

[    5.389374] BUG: scheduling while atomic: (udev-worker)/232/0x00010002
[    5.395917] Modules linked in: videobuf2_dma_contig videobuf2_memops videobuf2_v4l2 phy_j721e_wiz display_connector omap_mailbox(+) videodev tps6594_i2c(+) videobuf2_common phy_can_transceiver at24 cd6
[    5.433562] CPU: 0 PID: 232 Comm: (udev-worker) Not tainted 6.10.0-rc1-next-20240528-dirty #10
[    5.442158] Hardware name: Texas Instruments AM69 SK (DT)
[    5.447540] Call trace:
[    5.449976]  dump_backtrace+0x94/0xec
[    5.453640]  show_stack+0x18/0x24
[    5.456944]  dump_stack_lvl+0x78/0x90
[    5.460598]  dump_stack+0x18/0x24
[    5.463900]  __schedule_bug+0x50/0x68
[    5.467552]  __schedule+0x80c/0xb0c
[    5.471029]  schedule+0x34/0x104
[    5.474243]  schedule_preempt_disabled+0x24/0x40
[    5.478845]  rwsem_down_write_slowpath+0x31c/0x56c
[    5.483622]  down_write+0x90/0x94
[    5.486924]  kernfs_add_one+0x3c/0x148
[    5.490661]  kernfs_create_dir_ns+0x50/0x94
[    5.494830]  sysfs_create_dir_ns+0x70/0x10c
[    5.498999]  kobject_add_internal+0x98/0x26c
[    5.503254]  kobject_add+0x9c/0x10c
[    5.506729]  device_add+0xc0/0x790
[    5.510120]  rpmsg_register_device_override+0x10c/0x1c0
[    5.515333]  rpmsg_register_device+0x14/0x20
[    5.519590]  virtio_rpmsg_create_channel+0xb0/0x104
[    5.524452]  rpmsg_create_channel+0x28/0x60
[    5.528622]  rpmsg_ns_cb+0x100/0x1dc
[    5.532185]  rpmsg_recv_done+0x114/0x2e4
[    5.536094]  vring_interrupt+0x68/0xa4
[    5.539833]  rproc_vq_interrupt+0x2c/0x48
[    5.543830]  k3_r5_rproc_mbox_callback+0x84/0x90 [ti_k3_r5_remoteproc]
[    5.550348]  mbox_chan_received_data+0x1c/0x2c
[    5.554779]  mbox_interrupt+0xa0/0x17c [omap_mailbox]
[    5.559820]  __handle_irq_event_percpu+0x48/0x13c
[    5.564511]  handle_irq_event+0x4c/0xac

Andrew

> Regards,
> 
> Dominic
