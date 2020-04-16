Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727816AbgDPRvA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Apr 2020 13:51:00 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 318D6C061A0C
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Apr 2020 10:51:00 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id w1so21949685iot.7
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Apr 2020 10:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200416140307.GA25561@ubuntu>
In-Reply-To: <20200416140307.GA25561@ubuntu>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 16 Apr 2020 11:50:48 -0600
Message-ID: <CANLsYky6hdPnerfYvZk6SdO2supVPSr7Sa_x4-UsJ6Y5bgTfHQ@mail.gmail.com>
Subject: Re: RPMSG over VirtIO under KVM
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc: linux-remoteproc <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Good day Guennadi,

On Thu, 16 Apr 2020 at 08:06, Guennadi Liakhovetski
<guennadi.liakhovetski@linux.intel.com> wrote:
>
> Hi,
>
> It has been proposed to port the VirtIO SOF driver [1], used to
> implement audio support under Linux, running in a KVM guest, to use
> RPMSG to communicate with the SOF vhost driver, running on the Linux
> host. On one hand I see an rpmsg-virtio driver, which should make such
> a port possible, on the other hand I don't see a single VirtIO driver
> in the kernel, using RPMSG for Linux virtualisation.

Above you wrote "rpmsg-virtio" driver, which I take to mean the code
found in file virtio_rpmsg_bus.c [1].  The code in [1] centers around
the communication between an application processor and some form of
remote processor (micro controller or dsp).  The "virtio" part of the
name refers to the underlying infrastructure put in place to
communicate with the remote processor, all coming from the virtio
space.  Here instead of using the virtio mechanic to communicate
between a host and a guest, it is used to communicate with a remote
processor.

I came to the same conclusion a while back - as of today no virtio
drivers are using RPMSG to communicate between host and guest.  I
suppose nobody needed it or implemented their own schemes.

[1].  https://elixir.bootlin.com/linux/v5.7-rc1/source/drivers/rpmsg/virtio_rpmsg_bus.c

>
> Hence my questions: is this a good idea? Is there anything in the
> kernel VirtIO RPMSG implementation, that would make this impossible?

I don't see why it wouldn't be a good idea, nor what would technically
prevent such a thing from happening.  Two things work in your favour:
1) the RPMSG foundation has been tailored to be used over different
kinds of hardware and 2) an existing implementation is already using
virtioqueues.

I suggest to start looking at function rpmsg_register_device(), used
by different RPMSG drivers - the magic is really in the RPMSG
operations (struct rpmsg_device_ops) that are used to abstract the HW
implementation.

Regards,
Mathieu

>
> Thanks
> Guennadi
>
> [1] https://thesofproject.github.io/latest/developer_guides/virtualization/virtualization.html
