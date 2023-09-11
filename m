Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A71CA0EC7
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Sep 2023 21:37:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241771AbjIKV3j (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 11 Sep 2023 17:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243587AbjIKRVM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Sep 2023 13:21:12 -0400
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7EFF1A5
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Sep 2023 10:21:05 -0700 (PDT)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38BEuDNj005136;
        Mon, 11 Sep 2023 19:20:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        message-id:date:mime-version:subject:to:cc:references:from
        :in-reply-to:content-type:content-transfer-encoding; s=
        selector1; bh=cb7d9hEgVTuzOOiDozRe1zbvQk6Uxe/0EKa7JkDW0Js=; b=m8
        4gPTx/OSGrYtA1YhO83U5hviOPs8pnh37VzT7YtQVKR4PI8/s1tFxSJkOvdx9nnH
        PkYRkcv+IJso0n4EnPpkCX29qFwFO5MFdLwfw9yImVi+HN8+et/sipGpvbiXEHGC
        hO/f1FaP3ScedtzspskcM3f/r8vJRpDU4tyFF5QY1ICCOja/JQgjj1JJdF4cFwTW
        6B+/+LMMnv4mhQbubpvHU+l4XfWW102x4PJ82NMPVJFEIWdimd76IyGk+JC6AL5x
        ESp68QJ+H0ewxXUgchb20kSg5eI4jz8c+xKdNkWFABxIGkq901SKfsARcntmGIVV
        2nyxuzaQuoj8nqzKh3wg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t13nhete3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 19:20:58 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 30EDC10005A;
        Mon, 11 Sep 2023 19:20:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2550B209751;
        Mon, 11 Sep 2023 19:20:56 +0200 (CEST)
Received: from [10.252.3.122] (10.252.3.122) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 19:20:53 +0200
Message-ID: <0ec7f251-36de-f8b6-cfbe-96632519c851@foss.st.com>
Date:   Mon, 11 Sep 2023 19:20:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus - prevent possible race
 condition
Content-Language: en-US
To:     Tim Blechmann <tim@klingt.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Tim Blechmann <tim.blechmann@gmail.com>,
        <linux-remoteproc@vger.kernel.org>
References: <20230904083602.106703-1-tim@klingt.org>
 <64ecb19a-b3d1-0fa1-b015-b34607aee460@foss.st.com> <ZPZBVS3R/oZuUmk5@p14s>
 <00d5edfd-808f-51ac-0233-ce8489c6722c@klingt.org>
 <a47f8cea-5dc4-cdb2-9c2d-daf84c6853e3@foss.st.com>
 <a90701cb-2c4f-9e25-deff-1b4dbd13c922@klingt.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <a90701cb-2c4f-9e25-deff-1b4dbd13c922@klingt.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.3.122]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_13,2023-09-05_01,2023-05-22_02
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 9/9/23 08:28, Tim Blechmann wrote:
>>>>>> when we cannot get a tx buffer (`get_a_tx_buf`) `rpmsg_upref_sleepers`
>>>>>> enables tx-complete interrupt.
>>>>>> however if the interrupt is executed after `get_a_tx_buf` and before
>>>>>> `rpmsg_upref_sleepers` we may mis the tx-complete interrupt and sleep
>>>>>> for the full 15 seconds.
>>>>>
>>>>>
>>>>> Is there any reason why your co-processor is unable to release the TX RPMSG
>>>>> buffers for 15 seconds? If not, you should first determine the reason why
>>>>> it is
>>>>> stalled.
>>>>
>>>> Arnaud's concern is valid.  If the remote processor can't consume a buffer
>>>> within 15 seconds, something is probably wrong.
>>>>
>>>> That said, I believe your assesment of the situation is correct.  *If* the TX
>>>> callback is disabled and there is no buffer available, there is a window of
>>>> opportunity between calls to get_a_tx_buf() and rpmsg_upref_sleepers() for an
>>>> interrupt to arrive in function rpmsg_send_offchannel_raw().
>>>
>>> the remote processor certainly releases the tx buffer and according to my
>>> tracing the `vring_interrupt` fires immediately before `rpmsg_send` enters the
>>> `rpmsg_upref_sleepers`.
>>
>>
>> If I well understood your point, the issue occur in following race condition
>>
>> - all the Tx buffers are used
>> - in rpmsg_send_offchannel_raw() function, we try to get a buffer using
>> get_a_tx_buf(vrp) that returns NULL
>> - rpmsg_xmit_done is called as a Tx buffer is released by the remote processor
>>    and now free
>> - in rpmsg_send_offchannel_raw() rpmsg_upref_sleepers is called
>>
>> At this point you are nothing happen until 15 second because rpmsg_xmit_done is
>> never called  again that would wake up the waitqueue to call get_a_tx_buf()
> 
> yes, this is the behaviour that i've been seeing:
> 
> virtio emits a few times:
> [  404.XXXXXX] No more buffers in queue
> and then
> [  404.588722] remoteproc remoteproc0: vq index 1 is interrupted
> [  404.597249] virtqueue interrupt with no work for 6d53f13a

Difficult to understand the scheduling with your trace. Could you enable ftrace to
observe it (mailbox interrupts,rpmsg and virtio functions)
> 
>> If yes what is not clear to me is that wait_event_interruptible_timeout() seems
>> to test the condition (so call get_a_tx_buf()) before entering in sleep[1]. A
>> free TX buffer should be found at this step.
>>
>> [1]https://elixir.bootlin.com/linux/latest/source/include/linux/wait.h#L534
> 
> hmm, interesting. but that would imply a timing issue where calling get_a_tx_buf
> twice somehow makes a difference as opposed to calling it only once.
> 
> would the "interrupt with no work" point to a different cause for the issue that
> we are seeing?

Look like you have not released the buffer on remote side so no buffer in vring
used list.

Do you use the zero copy (rpmsg_hold_rx_buffer) on remote processor?
If yes, please check that you have following fix:
https://github.com/OpenAMP/open-amp/commit/2b6a38a9c6890869960ed41d6a1dc9930c079e0d

> 
>>
>> Regards,
>> Arnaud
>>
>>>
>>> after applying this patch we haven't been able to reproduce the 15s timeout
>>> anymore, whereas before we could easily reproduce it with certain workloads.
>>>
>>>> 3) This patch gets applied when rc1 comes out so that it has 6 or 7 weeks to
>>>> soak.  No error are locks are reported due to this patch during that time.
>>>
>>> mentioning locks: i was a bit uncertain about a good way to implement the retry,
>>> since both `rpmsg_upref_sleepers` and `get_a_tx_buf` both acquire the same
>>> mutex. i briefly considered to add `get_a_tx_buf` into `rpmsg_upref_sleepers` to
>>> avoid locking the same mutex multiple times, though it adds a bit of complexity
>>> to the implementation and harms readability a bit.
>>> are there any recommendations on this topic or are (likely non-contended) locks
>>> not expensive enough to justify the added complexity?
>>>
>>> thanks,
>>> tim
>>>
>>>
>>>>
>>>>>
>>>>> Regards,
>>>>> Arnaud
>>>>>
>>>>>>
>>>>>> in this case, so we re-try once before we really start to sleep
>>>>>>
>>>>>> Signed-off-by: Tim Blechmann <tim@klingt.org>
>>>>>> ---
>>>>>>    drivers/rpmsg/virtio_rpmsg_bus.c | 24 +++++++++++++++---------
>>>>>>    1 file changed, 15 insertions(+), 9 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c
>>>>>> b/drivers/rpmsg/virtio_rpmsg_bus.c
>>>>>> index 905ac7910c98..2a9d42225e60 100644
>>>>>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>>>>>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>>>>>> @@ -587,21 +587,27 @@ static int rpmsg_send_offchannel_raw(struct
>>>>>> rpmsg_device *rpdev,
>>>>>>          /* no free buffer ? wait for one (but bail after 15 seconds) */
>>>>>>        while (!msg) {
>>>>>>            /* enable "tx-complete" interrupts, if not already enabled */
>>>>>>            rpmsg_upref_sleepers(vrp);
>>>>>>    -        /*
>>>>>> -         * sleep until a free buffer is available or 15 secs elapse.
>>>>>> -         * the timeout period is not configurable because there's
>>>>>> -         * little point in asking drivers to specify that.
>>>>>> -         * if later this happens to be required, it'd be easy to add.
>>>>>> -         */
>>>>>> -        err = wait_event_interruptible_timeout(vrp->sendq,
>>>>>> -                    (msg = get_a_tx_buf(vrp)),
>>>>>> -                    msecs_to_jiffies(15000));
>>>>>> +        /* make sure to retry to grab tx buffer before we start waiting */
>>>>>> +        msg = get_a_tx_buf(vrp);
>>>>>> +        if (msg) {
>>>>>> +            err = 0;
>>>>>> +        } else {
>>>>>> +            /*
>>>>>> +             * sleep until a free buffer is available or 15 secs elapse.
>>>>>> +             * the timeout period is not configurable because there's
>>>>>> +             * little point in asking drivers to specify that.
>>>>>> +             * if later this happens to be required, it'd be easy to add.
>>>>>> +             */
>>>>>> +            err = wait_event_interruptible_timeout(vrp->sendq,
>>>>>> +                        (msg = get_a_tx_buf(vrp)),
>>>>>> +                        msecs_to_jiffies(15000));
>>>>>> +        }
>>>>>>              /* disable "tx-complete" interrupts if we're the last sleeper */
>>>>>>            rpmsg_downref_sleepers(vrp);
>>>>>>              /* timeout ? */
>>>>>>            if (!err) {
>>>>
>>>
>>
