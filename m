Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804ED1822F1;
	Wed, 26 Jun 2024 14:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719413160; cv=pass; b=Wpoga1Db6fnRy/PIocnlDx9gUi5yosiq8uAHAJQ15ux4TqsMbBIAZYrwd2FK3LYfpbXYahWpHN518QskvZu960TshEIl3tUFFhKQLHeQ5yzV20osFbMCsiUO9gfBpnzxBJa6f6dcOW1oOqfAjKobqXDKmVKSdnLw+dO9uICeJzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719413160; c=relaxed/simple;
	bh=B0wIR+DNYlDksmSVoZWLnMUOiWz5ip9Uyw3InWe4zp8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=b2Ed3hDCJYzhM2lf36O7A/w7HH9v4DKJgMos06E9aaCl2Arh3WiH1zNaYCWxGy2OD+FO6DjNrNt0bBp4BhJHxYDbDCJwF6ME7HVFTuXXsqnLGeLOzT/yM5cAQIps8/1IgjfPvnMj6Xw6UM+rUG2y2rrO54Ee3JklIGOiZ/OG3OM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ibv-augsburg.net; spf=none smtp.mailfrom=ibv-augsburg.net; dkim=pass (2048-bit key) header.d=ibv-augsburg.net header.i=@ibv-augsburg.net header.b=HKvR/UtR; dkim=permerror (0-bit key) header.d=ibv-augsburg.net header.i=@ibv-augsburg.net header.b=TrBnMcMu; arc=pass smtp.client-ip=85.215.255.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ibv-augsburg.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ibv-augsburg.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibv-augsburg.net header.i=@ibv-augsburg.net header.b="HKvR/UtR";
	dkim=permerror (0-bit key) header.d=ibv-augsburg.net header.i=@ibv-augsburg.net header.b="TrBnMcMu"
ARC-Seal: i=1; a=rsa-sha256; t=1719412790; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=cI2qRxlGJxz6qfKuxHXdHwYQq+O+cJOmQXGEOKx0A+xy9AVS6HWARzSPfsRDK23z2N
    icYUgIt6lXnXkD9YTAmw04KKVBrRWcp40By7A0ftacUrUabDsnQ+gii6IIUukp8oBX8R
    OPWgvFkF/CA6YzQfKr1s/iy8WU5GXbCrgPAWwOGLgr/09IndmY4en0z8SXO9hbvIcwaD
    1YLMxGzqYBJ60gGTnB5otkCQcIIDKWRNBsd8k4iGsrcp44E4FkmUDOkhZPfhCROB+Suh
    ZVIIufH7OHDe3E9U2XrtcS4IB6m0m4pkyO6yFpU2/oxG4r1jG0oTJiGllldQfqqE+tG+
    zqzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1719412790;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Cc:To:Subject:From:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=2ZHyOO7SRY4zZJCiCUO3Bjijz7x4V3Dbzd1rEJ9eMgQ=;
    b=TaFYAr5LD+w+GXjlgmPWWJAxO/nY9uWebgvr86Uw4Lsns3D1VVKpOWCcMKHc1ycpsB
    KkK0UcsvTpibApeR+M9zD2psxty461Eklkt2gKLUsJ1XeiMmXu7A/F37rQrF1Jm1TzPF
    KTg07PyHdrlLOeUVcNLigqhLVqRj0Ys+U58z93POf3wGKo4Wp2DN1rfaLIqkso/TXkXk
    oxDDGofjI+EltvaFW991K8c+uCEOrtFJciMQq1XQh45GuJAJuyCRZkvGKGiYBaZDE7wc
    Q2rvuYARsjJmDRRu/NUhzcqvkkhx8XcSm9aB+pkZQe9coSzn61cnWUwOjiE7k9bBHOWf
    9epg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1719412790;
    s=strato-dkim-0002; d=ibv-augsburg.net;
    h=In-Reply-To:References:Cc:To:Subject:From:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=2ZHyOO7SRY4zZJCiCUO3Bjijz7x4V3Dbzd1rEJ9eMgQ=;
    b=HKvR/UtRhzy4j4DQvo5+oLhDTQeJAECo9oZBsaJ6dcK8zj2lZsTkLgDHUlJH8DtPu6
    Dlf8SHvRh5j6snnXOXkCIHvtGYIV7/3gwkAkXBLbQfTrmElN5/iGmgsFg+oSG0iFqXzD
    uoVkuS83vM19R8ezWW6sBgO8HMNA9s1V2Ts02TXUrEoTymMEd+LvIlVGmwQX0v1P3A22
    O3R+38FedD7obAf9it3jqLpVjdno3TP19u9HI9+kJQIqmasHsAx7ziTch0jhSHQLDpk0
    qUuJkesZN607Fb0zk0RRUcX6u8V2gN+lkFZMHTDMX/PF1PrOKinw9eS8UQg/Rlr07ySX
    yPdQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1719412790;
    s=strato-dkim-0003; d=ibv-augsburg.net;
    h=In-Reply-To:References:Cc:To:Subject:From:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=2ZHyOO7SRY4zZJCiCUO3Bjijz7x4V3Dbzd1rEJ9eMgQ=;
    b=TrBnMcMuqx/UySJmGyoxwWnYER4TJXAcGT5Pd+nEuiwm4pNdGUDMqU1bdJ9g0mwuyI
    gtn78jo/h21dzfqpGiAQ==
X-RZG-AUTH: ":KGMJfE6heLGk8b3w7Oa1fDtXwBjeDczIOHPRx8yNRKhFG/cxcP9JMCwOG/8exKYuJH3BToJAML1PywPd"
Received: from [172.26.1.108]
    by smtp.strato.de (RZmta 50.5.0 DYNA|AUTH)
    with ESMTPSA id N07c8805QEdoI9Z
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 26 Jun 2024 16:39:50 +0200 (CEST)
Message-ID: <5980f22f-44ef-4984-8912-163ca4773568@ibv-augsburg.net>
Date: Wed, 26 Jun 2024 16:39:49 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Dominic Rath <dominic.rath@ibv-augsburg.net>
Subject: Re: [PATCH v2 00/13] OMAP mailbox FIFO removal
To: Andrew Davis <afd@ti.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Hari Nagalla <hnagalla@ti.com>, Nick Saulnier <nsaulnier@ti.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240410135942.61667-1-afd@ti.com>
 <b5c8d134-edcb-4a1a-8940-b26047c9b79d@ibv-augsburg.net>
 <4d7c1525-a3d1-48f3-9e9c-eb61527a1b23@ti.com>
In-Reply-To: <4d7c1525-a3d1-48f3-9e9c-eb61527a1b23@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13.06.2024 14:22, Andrew Davis wrote:
>> We looked into this some time ago, and noticed that the IRQ approach 
>> caused problems in the virtio/rpmsg code. I'd like to understand if 
>> your change was for the same reason, or something else we missed before.
>>
> 
> It is most likely the same reason. Seems despite its name, 
> rproc_vq_interrupt() cannot
> be called from an IRQ/atomic context. As the following backtrace shows, 
> that function
> calls down into functions which are not IRQ safe. So we needed to keep 
> it threaded:
> 
> [    5.389374] BUG: scheduling while atomic: (udev-worker)/232/0x00010002
> [    5.395917] Modules linked in: videobuf2_dma_contig videobuf2_memops 
> videobuf2_v4l2 phy_j721e_wiz display_connector omap_mailbox(+) videodev 
> tps6594_i2c(+) videobuf2_common phy_can_transceiver at24 cd6
> [    5.433562] CPU: 0 PID: 232 Comm: (udev-worker) Not tainted 
> 6.10.0-rc1-next-20240528-dirty #10
> [    5.442158] Hardware name: Texas Instruments AM69 SK (DT)
> [    5.447540] Call trace:
> [    5.449976]  dump_backtrace+0x94/0xec
> [    5.453640]  show_stack+0x18/0x24
> [    5.456944]  dump_stack_lvl+0x78/0x90
> [    5.460598]  dump_stack+0x18/0x24
> [    5.463900]  __schedule_bug+0x50/0x68
> [    5.467552]  __schedule+0x80c/0xb0c
> [    5.471029]  schedule+0x34/0x104
> [    5.474243]  schedule_preempt_disabled+0x24/0x40
> [    5.478845]  rwsem_down_write_slowpath+0x31c/0x56c
> [    5.483622]  down_write+0x90/0x94
> [    5.486924]  kernfs_add_one+0x3c/0x148
> [    5.490661]  kernfs_create_dir_ns+0x50/0x94
> [    5.494830]  sysfs_create_dir_ns+0x70/0x10c
> [    5.498999]  kobject_add_internal+0x98/0x26c
> [    5.503254]  kobject_add+0x9c/0x10c
> [    5.506729]  device_add+0xc0/0x790
> [    5.510120]  rpmsg_register_device_override+0x10c/0x1c0
> [    5.515333]  rpmsg_register_device+0x14/0x20
> [    5.519590]  virtio_rpmsg_create_channel+0xb0/0x104
> [    5.524452]  rpmsg_create_channel+0x28/0x60
> [    5.528622]  rpmsg_ns_cb+0x100/0x1dc
> [    5.532185]  rpmsg_recv_done+0x114/0x2e4
> [    5.536094]  vring_interrupt+0x68/0xa4
> [    5.539833]  rproc_vq_interrupt+0x2c/0x48
> [    5.543830]  k3_r5_rproc_mbox_callback+0x84/0x90 [ti_k3_r5_remoteproc]
> [    5.550348]  mbox_chan_received_data+0x1c/0x2c
> [    5.554779]  mbox_interrupt+0xa0/0x17c [omap_mailbox]
> [    5.559820]  __handle_irq_event_percpu+0x48/0x13c
> [    5.564511]  handle_irq_event+0x4c/0xac
> 

I looked into this a bit more closely, together with the colleague who 
implemented our internal workaround, and we came up with one more concern:

Have you considered that this synchronous path from the (threaded) IRQ 
draining the mailbox down to the (potentially blocking) rpmsg_* calls 
might let the hardware mailbox grow full?

 From what I remember the vring (?) has room for 512 messages, but the 
hardware mailbox on e.g. the AM64x can only handle four messages. At 
least with the current implementation on TI's MCU+ SDK running on the 
R5f that could cause the R5f to block, waiting for room in the hardware 
mailbox, while there are plenty of vring buffers available.

Best Regards,

Dominic
