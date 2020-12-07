Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B39C433FE
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Dec 2020 15:37:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F3E923730
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Dec 2020 15:37:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbgLGPgy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 7 Dec 2020 10:36:54 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33716 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgLGPgx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 7 Dec 2020 10:36:53 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B7FZKxu017657;
        Mon, 7 Dec 2020 09:35:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607355320;
        bh=VhuHw0P+MX1t2vSSQW445EqNb0eCt6ymuZnRYivU99g=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=kQFR0O9Siv8zPegzZMPxRTrc0xKJLFYjGOMXYNIgx+ZecCgX7jjiDg1b4wNz1XDd7
         GBdKmkLHu41nvv0ApyYx/4Hr1DvXEJshY/Zrh9XIN5gcUShvhjspvp+K7YCjf0amJ8
         9lyUzjIyMU7ctLcFs7wUak4QiCOzPQT6YRlCuJOY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B7FZKX9039992
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Dec 2020 09:35:20 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Dec
 2020 09:35:19 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Dec 2020 09:35:19 -0600
Received: from [10.250.235.36] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B7FZBrg120804;
        Mon, 7 Dec 2020 09:35:13 -0600
Subject: Re: [PATCH v7 0/8] rpmsg: Make RPMSG name service modular
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh@kernel.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jason Wang <jasowang@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        <virtualization@lists.linux-foundation.org>
References: <20201120214245.172963-1-mathieu.poirier@linaro.org>
 <20201123160610.GA19108@ubuntu> <20201202110555.GA65230@ubuntu>
 <20201202203954.GC1282360@xps15> <20201203204218.GA13001@ubuntu>
 <CANLsYkzDiWtyNvYm8a_MBgz=cryb2mNNUwVA9=K2yrO3XTa-xA@mail.gmail.com>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <72a5b1fb-2db9-882a-8029-b574fd6338e2@ti.com>
Date:   Mon, 7 Dec 2020 21:05:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANLsYkzDiWtyNvYm8a_MBgz=cryb2mNNUwVA9=K2yrO3XTa-xA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

+Lorenzo, Bjorn, Rob

Hi Guennadi,

On 04/12/20 11:21 pm, Mathieu Poirier wrote:
> I am adding Vincent Whitchurch and the virtualization mailing list...
> 
> On Thu, 3 Dec 2020 at 13:42, Guennadi Liakhovetski
> <guennadi.liakhovetski@linux.intel.com> wrote:
>>
>> (adding vhost maintainers and the author of [1])
>>
>> Hi,
>>
>> I'm working on an Audio DSP virtualisation solution [2] and the next
>> step in its upstreaming should be an RPMsg vhost implementation, based
>> on [3], which contains a simple addition to the current library-style
>> vhost API. Later in [1] a different approach has been presented,
>> converting the vhost framework to a proper bus-type and device driver.
>> Therefore my questions:
>>
>> 1. if the latter approach is prefered, should we expect follow up
>> versions of [1] and their upstreaming?
>> 2. judging by the size and complexity of [1] would it maybe be
>> preferable to first extract a minimum patch set just to add vhost
>> rpmsg? Looking at the patch set it should be doable and not too
>> difficult? Kishon, would it be something you could submit?
> 
> To me that is the best approach.  It might be best for you to do the
> work and credit Kishon where needed.

Yeah, my focus right now is to get my NTB patch series upstreamed [A],
So I might not be able to get to this any sooner. As Mathieu suggested,
I recommend you to pick the generic parts of my series that doesn't
involve PCI or NTB or VHOST MMIO.

The following patches in my series should get the generic vhost
infrastructure part up.

0001-vhost-Make-_feature_-bits-a-property-of-vhost-device.patch
0002-vhost-Introduce-standard-Linux-driver-model-in-VHOST.patch
0003-vhost-Add-ops-for-the-VHOST-driver-to-configure-VHOS.patch

0006-vhost-Introduce-configfs-entry-for-configuring-VHOST.patch

0008-rpmsg-virtio_rpmsg_bus-Disable-receive-virtqueue-cal.patch
0009-rpmsg-Introduce-configfs-entry-for-configuring-rpmsg.patch
0010-rpmsg-virtio_rpmsg_bus-Add-Address-Service-Notificat.patch
0011-rpmsg-virtio_rpmsg_bus-Move-generic-rpmsg-structure-.patch

0014-rpmsg-Add-VHOST-based-remote-processor-messaging-bus.patch
0015-samples-rpmsg-Setup-delayed-work-to-send-message.patch
0016-samples-rpmsg-Wait-for-address-to-be-bound-to-rpdev-.patch
0017-rpmsg.txt-Add-Documentation-to-configure-rpmsg-using.patch

Let me know if you have any questions or need further clarifications.

Thank you for working on this.

Best Regards,
Kishon

[A] -> http://lore.kernel.org/r/20201111153559.19050-1-kishon@ti.com

> 
>> 3. or would it be preferable to keep vhost in its present form, use
>> [3] for rpmsg support and re-implement [1] based on a different
>> vhost / vringh approach?
>>
>> Thanks
>> Guennadi
>>
>> [1] https://www.spinics.net/lists/kvm/msg219632.html
>> [2] https://mailman.alsa-project.org/pipermail/sound-open-firmware/2020-April/003766.html
>> [3] https://www.spinics.net/lists/linux-virtualization/msg43359.html
>>
>> On Wed, Dec 02, 2020 at 01:39:54PM -0700, Mathieu Poirier wrote:
>>> Good day,
>>>
>>> On Wed, Dec 02, 2020 at 12:05:55PM +0100, Guennadi Liakhovetski wrote:
>>>> Hi Mathieu,
>>>>
>>>> I'd like to resume reviewing and begin upstreaming of the next steps of
>>>> my Audio DSP Virtualisation work, based on this your patch set. How
>>>
>>> I'm all for it too.
>>>
>>>> confident are we that it's going to be upstreamed in its present form?
>>>> What's the plan to push it to "next?"
>>>>
>>>
>>> I thought we were pretty unanimous that something like what Kishon did was the
>>> way to go.
>>>
>>>> Thanks
>>>> Guennadi
>>>>
>>>> On Mon, Nov 23, 2020 at 05:06:10PM +0100, Guennadi Liakhovetski wrote:
>>>>> Hi Mathieu,
>>>>>
>>>>> Thanks for bringing all the stuff together and for polishing it!
>>>>>
>>>>> For the entire series:
>>>>>
>>>>> Tested-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
>>>>> Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
>>>>>
>>>>> Thanks
>>>>> Guennadi
>>>>>
>>>>> On Fri, Nov 20, 2020 at 02:42:37PM -0700, Mathieu Poirier wrote:
>>>>>> This revision addresses comments received from the previous revision,
>>>>>> i.e V6.  Please see details below.
>>>>>>
>>>>>> It starts by making the RPMSG protocol transport agnostic by
>>>>>> moving the headers it uses to generic types and using those in the
>>>>>> current implementation.  From there it re-uses the work that Arnaud
>>>>>> published[1] to make the name service modular.
>>>>>>
>>>>>> Tested on stm32mp157 with the RPMSG client sample application.  Applies
>>>>>> cleanly on rpmsg-next.
>>>>>>
>>>>>> Thanks,
>>>>>> Mathieu
>>>>>>
>>>>>> [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=338335
>>>>>>
>>>>>> -------
>>>>>> New for V7:
>>>>>> - Fixed error path in rpmsg_probe() as reported by Guennadi
>>>>>>
>>>>>> Arnaud Pouliquen (4):
>>>>>>   rpmsg: virtio: Rename rpmsg_create_channel
>>>>>>   rpmsg: core: Add channel creation internal API
>>>>>>   rpmsg: virtio: Add rpmsg channel device ops
>>>>>>   rpmsg: Turn name service into a stand alone driver
>>>>>>
>>>>>> Mathieu Poirier (4):
>>>>>>   rpmsg: Introduce __rpmsg{16|32|64} types
>>>>>>   rpmsg: virtio: Move from virtio to rpmsg byte conversion
>>>>>>   rpmsg: Move structure rpmsg_ns_msg to header file
>>>>>>   rpmsg: Make rpmsg_{register|unregister}_device() public
>>>>>>
>>>>>>  drivers/rpmsg/Kconfig            |   9 ++
>>>>>>  drivers/rpmsg/Makefile           |   1 +
>>>>>>  drivers/rpmsg/rpmsg_core.c       |  44 ++++++++
>>>>>>  drivers/rpmsg/rpmsg_internal.h   |  14 ++-
>>>>>>  drivers/rpmsg/rpmsg_ns.c         | 126 +++++++++++++++++++++
>>>>>>  drivers/rpmsg/virtio_rpmsg_bus.c | 186 +++++++++++--------------------
>>>>>>  include/linux/rpmsg.h            |  63 ++++++++++-
>>>>>>  include/linux/rpmsg/byteorder.h  |  67 +++++++++++
>>>>>>  include/linux/rpmsg/ns.h         |  45 ++++++++
>>>>>>  include/uapi/linux/rpmsg_types.h |  11 ++
>>>>>>  10 files changed, 439 insertions(+), 127 deletions(-)
>>>>>>  create mode 100644 drivers/rpmsg/rpmsg_ns.c
>>>>>>  create mode 100644 include/linux/rpmsg/byteorder.h
>>>>>>  create mode 100644 include/linux/rpmsg/ns.h
>>>>>>  create mode 100644 include/uapi/linux/rpmsg_types.h
>>>>>>
>>>>>> --
>>>>>> 2.25.1
>>>>>>
