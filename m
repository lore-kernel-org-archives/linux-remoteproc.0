Return-Path: <SRS0=udoQ=EP=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE3BC5517A
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 06:04:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 865FD206E5
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 06:04:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b7+JoW//"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729524AbgKIGEn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Nov 2020 01:04:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42356 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728951AbgKIGEm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Nov 2020 01:04:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604901880;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UBLQUM1X/0MCddQFRLO/RxxvuYfOPaxQX5b2ahy4mRA=;
        b=b7+JoW//Tgb+xIBmZiFdZ2w01q3l4Gj4I+eg2tccbog2pN4HI3gWncmtn0Ty+v02o5yvJC
        qwqc74ANpS2A48eykU1SPNuuMpZhTpJDxjHJ71P0TG2O+9gZry2LnsKwl65Be5HfZe1yYX
        OQixWwEho6yZr1bdGyX3DKTTJdTKcA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-RLBubNkaMJCIgAKuA2Lw4g-1; Mon, 09 Nov 2020 01:04:38 -0500
X-MC-Unique: RLBubNkaMJCIgAKuA2Lw4g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B24B21882FA1;
        Mon,  9 Nov 2020 06:04:35 +0000 (UTC)
Received: from [10.72.12.244] (ovpn-12-244.pek2.redhat.com [10.72.12.244])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 55C325C5AF;
        Mon,  9 Nov 2020 06:04:26 +0000 (UTC)
Subject: Re: [PATCH virtio] virtio: virtio_console: fix DMA memory allocation
 for rproc serial
To:     Alexander Lobakin <alobakin@pm.me>
Cc:     Amit Shah <amit@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Suman Anna <s-anna@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        virtualization@lists.linux-foundation.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <AOKowLclCbOCKxyiJ71WeNyuAAj2q8EUtxrXbyky5E@cp7-web-042.plabs.ch>
 <004da56d-aad2-3b69-3428-02a14263289b@redhat.com>
 <aXBO8lWEART2MNuWacIKln3qh6wttCtF2oUd7vthkNU@cp3-web-012.plabs.ch>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <b4aaeab1-4e9f-2b38-0124-e0b0ca9c287b@redhat.com>
Date:   Mon, 9 Nov 2020 14:04:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <aXBO8lWEART2MNuWacIKln3qh6wttCtF2oUd7vthkNU@cp3-web-012.plabs.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On 2020/11/5 下午8:22, Alexander Lobakin wrote:
> From: Jason Wang <jasowang@redhat.com>
> Date: Thu, 5 Nov 2020 11:10:24 +0800
>
> Hi Jason,
>
>> On 2020/11/4 下午11:31, Alexander Lobakin wrote:
>>> Since commit 086d08725d34 ("remoteproc: create vdev subdevice with
>>> specific dma memory pool"), every remoteproc has a DMA subdevice
>>> ("remoteprocX#vdevYbuffer") for each virtio device, which inherits
>>> DMA capabilities from the corresponding platform device. This allowed
>>> to associate different DMA pools with each vdev, and required from
>>> virtio drivers to perform DMA operations with the parent device
>>> (vdev->dev.parent) instead of grandparent (vdev->dev.parent->parent).
>>>
>>> virtio_rpmsg_bus was already changed in the same merge cycle with
>>> commit d999b622fcfb ("rpmsg: virtio: allocate buffer from parent"),
>>> but virtio_console did not. In fact, operations using the grandparent
>>> worked fine while the grandparent was the platform device, but since
>>> commit c774ad010873 ("remoteproc: Fix and restore the parenting
>>> hierarchy for vdev") this was changed, and now the grandparent device
>>> is the remoteproc device without any DMA capabilities.
>>> So, starting v5.8-rc1 the following warning is observed:
>>>
>>> [    2.483925] ------------[ cut here ]------------
>>> [    2.489148] WARNING: CPU: 3 PID: 101 at kernel/dma/mapping.c:427 0x80e7eee8
>>> [    2.489152] Modules linked in: virtio_console(+)
>>> [    2.503737]  virtio_rpmsg_bus rpmsg_core
>>> [    2.508903]
>>> [    2.528898] <Other modules, stack and call trace here>
>>> [    2.913043]
>>> [    2.914907] ---[ end trace 93ac8746beab612c ]---
>>> [    2.920102] virtio-ports vport1p0: Error allocating inbufs
>>>
>>> kernel/dma/mapping.c:427 is:
>>>
>>> WARN_ON_ONCE(!dev->coherent_dma_mask);
>>>
>>> obviously because the grandparent now is remoteproc dev without any
>>> DMA caps:
>>>
>>> [    3.104943] Parent: remoteproc0#vdev1buffer, grandparent: remoteproc0
>>>
>>> Fix this the same way as it was for virtio_rpmsg_bus, using just the
>>> parent device (vdev->dev.parent, "remoteprocX#vdevYbuffer") for DMA
>>> operations.
>>> This also allows now to reserve DMA pools/buffers for rproc serial
>>> via Device Tree.
>>>
>>> Fixes: c774ad010873 ("remoteproc: Fix and restore the parenting hierarchy for vdev")
>>> Cc: stable@vger.kernel.org # 5.1+
>>> Signed-off-by: Alexander Lobakin <alobakin@pm.me>
>>> ---
>>>    drivers/char/virtio_console.c | 8 ++++----
>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
>>> index a2da8f768b94..1836cc56e357 100644
>>> --- a/drivers/char/virtio_console.c
>>> +++ b/drivers/char/virtio_console.c
>>> @@ -435,12 +435,12 @@ static struct port_buffer *alloc_buf(struct virtio_device *vdev, size_t buf_size
>>>    		/*
>>>    		 * Allocate DMA memory from ancestor. When a virtio
>>>    		 * device is created by remoteproc, the DMA memory is
>>> -		 * associated with the grandparent device:
>>> -		 * vdev => rproc => platform-dev.
>>> +		 * associated with the parent device:
>>> +		 * virtioY => remoteprocX#vdevYbuffer.
>>>    		 */
>>> -		if (!vdev->dev.parent || !vdev->dev.parent->parent)
>>> +		buf->dev = vdev->dev.parent;
>>> +		if (!buf->dev)
>>>    			goto free_buf;
>>> -		buf->dev = vdev->dev.parent->parent;
>>
>> I wonder it could be the right time to introduce dma_dev for virtio
>> instead of depending on something magic via parent.
> This patch are meant to hit RC window and stable trees as a fix of
> the bug that is present since v5.8-rc1. So any new features are out
> of scope of this particular fix.


Right.


>
> The idea of DMAing through "dev->parent" is that "virtioX" itself is a
> logical dev, not the real one, but its parent *is*. This logic is used
> across the whole tree -- every subsystem creates its own logical device,
> but drivers should always use the backing PCI/platform/etc. devices for
> DMA operations, which represent the real hardware.


Yes, so what I meant is to use different variables for DMA and 
hierarchy. So it's the responsibility of the lower layer to pass a 
correct "dma_dev" to the upper layer instead of depending parent.

Anyway for this patch.

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks


>
>> (Btw I don't even notice that there's transport specific code in virtio
>> console, it's better to avoid it)
>>
>> Thanks
> Thanks,
> Al
>
>>>    		/* Increase device refcnt to avoid freeing it */
>>>    		get_device(buf->dev);

