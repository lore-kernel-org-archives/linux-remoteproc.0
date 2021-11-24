Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75469C433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 Nov 2021 15:48:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231546AbhKXPvj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 24 Nov 2021 10:51:39 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:38338 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232464AbhKXPvi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 24 Nov 2021 10:51:38 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AOE3rGw013979;
        Wed, 24 Nov 2021 16:48:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=YJViYSYT8xJ5MsOzsjGblfYI64RbOm4dpXAg04uu3as=;
 b=zmZUI4AQXDqMF8XkfsnZpmOhxHC6v3W97nfzMh+1jCj+PNmTUVVcIQR3qJs0uH+g/br7
 jb1AIceTF0fXvevKa1Sd0HbYTHsRPjlk0X6lyeyB8k8PsaSAQ6Ble5pCu3IrmQEdz71V
 cZp1CPbtynAbieLwKEgLI4Gjx+kHW40g0FCQpSzfJJ8uHpib+cj42wycsEgyKrBJiJty
 CGyaR2mv2vNPqkNVOm5w90WIWWmbIO3T1Pa/l0asn6335TbSo8esAbLhKa77jYfO06E+
 Pw65tmmP0lZD7Y9IciMQtd/E2kOoLjAUO7T62oZdWK8B+xcFHkpAR6FzllfCNyQZXFeV Jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3chdr0byae-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 24 Nov 2021 16:48:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 69C8610002A;
        Wed, 24 Nov 2021 16:48:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D12602A4D7D;
        Wed, 24 Nov 2021 16:48:21 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 24 Nov
 2021 16:48:21 +0100
Subject: Re: [PATCH] rpmsg: virtio: don't let virtio core to validate used
 length
To:     Jason Wang <jasowang@redhat.com>
CC:     "Michael S. Tsirkin" <mst@redhat.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        <linux-remoteproc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20211122160812.25125-1-arnaud.pouliquen@foss.st.com>
 <20211123011340-mutt-send-email-mst@kernel.org>
 <43894114-6d25-98fa-a89f-b720749ba910@foss.st.com>
 <CACGkMEtC9sD2MX20Q3C3ecWH_TXCQMTS1qDLevKhuv=dyR14sQ@mail.gmail.com>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <9dfb7cb7-d4b8-095f-c863-bedbb6b80c4c@foss.st.com>
Date:   Wed, 24 Nov 2021 16:48:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CACGkMEtC9sD2MX20Q3C3ecWH_TXCQMTS1qDLevKhuv=dyR14sQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_06,2021-11-24_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 11/24/21 3:12 AM, Jason Wang wrote:
> On Tue, Nov 23, 2021 at 9:31 PM Arnaud POULIQUEN
> <arnaud.pouliquen@foss.st.com> wrote:
>>
>> Hello Mickael, Jason,
>>
>> On 11/23/21 7:15 AM, Michael S. Tsirkin wrote:
>>> On Mon, Nov 22, 2021 at 05:08:12PM +0100, Arnaud Pouliquen wrote:
>>>> For RX virtqueue, the used length is validated in all the three paths
>>>> (big, small and mergeable). For control vq, we never tries to use used
>>>> length. So this patch forbids the core to validate the used length.
>>>
>>> Jason commented on this. This is copy paste from virtio net
>>> where the change was merely an optimization.
>>>
>>
>> Right, I did it too fast last night (European time) to share the regression as
>> soon as possible.
>> For that, I copied and pasted the first commit I found related to the problem.
>> Need to rework this.
>>
>>>> Without patch the rpmsg client sample does not work.
>>>
>>> Hmm that's not enough of a description. Could you please
>>> provide more detail? Does rpmsg device set used length to a
>>> value > dma read buffer size? what kind of error message
>>> do you get? what are the plans to fix the device?
>>
>> Let's me explain the context.
>> I run the rpmsg client sample test to communicate with a remote processor
>> that runs a Zephyr FW designed to answer to the Linux kernel driver sample.
>>
>> The Zephyr is relying on OpenAMP library to implement the RPMsg and VirtIO layers.
>>
>> In TX direction (Linux to Zephyr) 8 buffers of 512 bytes are allocated.
>> The first 8 RPMsg sent are OK. But when virtio loop back the the TX buffer index
>> 0 (so already used and free one time) the following error occurs in
>> virtqueue_get_buf_ctx_split[1]:
>> " virtio_rpmsg_bus virtio0: output:used len 28 is larger than in buflen 0"
>>
>> I have investigated the problem further today. Here is my analysis
>>
>> rpmsg_send_offchannel_raw
>> -> virtqueue_add_outbuf
>>    -> virtqueue_add
>>       -> virtqueue_add_split
>>          Here we use the "out_sgs" (in_sgs == 0)
>>          buflen is not incremented in loop [2]
>>          We don't enter in loop [3] as "in_sgs == 0"
>>          consequence is that vq->buflen[head] is set to 0 [4]
>>
>> [1]
>> https://elixir.bootlin.com/linux/v5.16-rc2/source/drivers/virtio/virtio_ring.c#L799
>> [2]
>> https://elixir.bootlin.com/linux/v5.16-rc2/source/drivers/virtio/virtio_ring.c#L551
>> [3]
>> https://elixir.bootlin.com/linux/v5.16-rc2/source/drivers/virtio/virtio_ring.c#L567
>> [4]
>> https://elixir.bootlin.com/linux/v5.16-rc2/source/drivers/virtio/virtio_ring.c#L622
>>
>>
>> An alternative to fix the issue is to set buflen in loop 2, but I'm not enough
>> expert to ensure that this will not have any side effect...
>>
>> @@ -559,10 +559,11 @@ static inline int virtqueue_add_split(struct virtqueue *_vq,
>>                          * table since it use stream DMA mapping.
>>                          */
>>                         i = virtqueue_add_desc_split(_vq, desc, i, addr, sg->length,
>>                                                      VRING_DESC_F_NEXT,
>>                                                      indirect);
>> +                       buflen += sg->length;
> 
> This is not what spec what:
> 
> "Each entry in the ring is a pair: id indicates the head entry of the
> descriptor chain describing the buffer (this matches an entry placed
> in the available ring by the guest earlier), and len the total of
> bytes written into the buffer."
> 
> For TX, the used length should be 0.
> 
>>                 }
>>         }
>>         for (; n < (out_sgs + in_sgs); n++) {
>>
>> So can you tell me if you prefer me to send a V2 updating the commit message or
>> a new message to fix virtio_ring (or both)?
> 
> See above, for the driver side, the suppress_used_validation is
> sufficient. For the device side, it needs to be fixed (0 for TX used
> length) too.

I confirm that set len to 0 in virtq_used_elem struct, when release the
in-buffer on device (remote processor) side, fixes the issue.

Need to improve the behaviour in OpenAMP lib but for legacy support of the
different Virtio libraries the suppress_used_validation seems necessary. I will
send a V2 with an update of the commit message

Thanks,
Arnaud

> 
> Thanks
> 
>>
>> Thanks,
>> Arnaud
>>
>>>
>>>> Fixes: 939779f5152d ("virtio_ring: validate used buffer length")
>>>>
>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>> Cc: Jason Wang <jasowang@redhat.com>
>>>> Cc: Michael S. Tsirkin <mst@redhat.com>
>>>> ---
>>>> base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
>>>> ---
>>>>  drivers/rpmsg/virtio_rpmsg_bus.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
>>>> index 9c112aa65040..5f73f19c2c38 100644
>>>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>>>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>>>> @@ -1054,6 +1054,7 @@ static struct virtio_driver virtio_ipc_driver = {
>>>>      .feature_table_size = ARRAY_SIZE(features),
>>>>      .driver.name    = KBUILD_MODNAME,
>>>>      .driver.owner   = THIS_MODULE,
>>>> +    .suppress_used_validation = true,
>>>>      .id_table       = id_table,
>>>>      .probe          = rpmsg_probe,
>>>>      .remove         = rpmsg_remove,
>>>> --
>>>> 2.17.1
>>>
>>
> 
