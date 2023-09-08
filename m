Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB4AEE8012
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Sep 2023 15:04:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237799AbjIHPEU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 8 Sep 2023 11:04:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233245AbjIHPEU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Sep 2023 11:04:20 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC6A31FC6
        for <linux-remoteproc@vger.kernel.org>; Fri,  8 Sep 2023 08:04:10 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38898jaw016971;
        Fri, 8 Sep 2023 17:04:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        message-id:date:mime-version:subject:to:cc:references:from
        :in-reply-to:content-type:content-transfer-encoding; s=
        selector1; bh=W/vtyMI92lJrEsUOX31XkdxVO8ScNcRaRGbWV0gnCSc=; b=ce
        UF+Q8F/9cm3kK34tbBffVdSULZi6QqTM9rcfZit+yh4IZs24zi106yHIPBjDNMYp
        33Cc33YTcR3QnQaUhk5nrxwG93DFiLTceT62sO4cZGOn09KJ0LGzoWgi6PRNln3a
        Zpx7z0y00s8OGHE+MoL0mtMWv/EZLbdl1Ciad7O7keM3LSWaQf/pd6gJ+qLwBL3A
        i94D4c2vkOCRlHeQHZ/kzvyY5aRcJvpViPsGq2fmagkqQ8pKTxQhn0TuBxC1HYvT
        xaKosL2vtsHl0YqgNEWpFB9kqa+u6JJW6BfERZKmYRq2H4qlJHGB37uG8bF+XSA7
        YSoFj/3B9Lssx0PVUE3g==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sutffutwe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 08 Sep 2023 17:04:06 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8E74D100052;
        Fri,  8 Sep 2023 17:04:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 864122823E6;
        Fri,  8 Sep 2023 17:04:04 +0200 (CEST)
Received: from [10.252.26.200] (10.252.26.200) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 8 Sep
 2023 17:04:03 +0200
Message-ID: <a47f8cea-5dc4-cdb2-9c2d-daf84c6853e3@foss.st.com>
Date:   Fri, 8 Sep 2023 17:04:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
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
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <00d5edfd-808f-51ac-0233-ce8489c6722c@klingt.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.26.200]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_12,2023-09-05_01,2023-05-22_02
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 9/5/23 03:33, Tim Blechmann wrote:
>>>> when we cannot get a tx buffer (`get_a_tx_buf`) `rpmsg_upref_sleepers`
>>>> enables tx-complete interrupt.
>>>> however if the interrupt is executed after `get_a_tx_buf` and before
>>>> `rpmsg_upref_sleepers` we may mis the tx-complete interrupt and sleep
>>>> for the full 15 seconds.
>>>
>>>
>>> Is there any reason why your co-processor is unable to release the TX RPMSG
>>> buffers for 15 seconds? If not, you should first determine the reason why it is
>>> stalled.
>>
>> Arnaud's concern is valid.  If the remote processor can't consume a buffer
>> within 15 seconds, something is probably wrong.
>>
>> That said, I believe your assesment of the situation is correct.  *If* the TX
>> callback is disabled and there is no buffer available, there is a window of
>> opportunity between calls to get_a_tx_buf() and rpmsg_upref_sleepers() for an
>> interrupt to arrive in function rpmsg_send_offchannel_raw().
> 
> the remote processor certainly releases the tx buffer and according to my
> tracing the `vring_interrupt` fires immediately before `rpmsg_send` enters the
> `rpmsg_upref_sleepers`.


If I well understood your point, the issue occur in following race condition

- all the Tx buffers are used
- in rpmsg_send_offchannel_raw() function, we try to get a buffer using
get_a_tx_buf(vrp) that returns NULL
- rpmsg_xmit_done is called as a Tx buffer is released by the remote processor
  and now free
- in rpmsg_send_offchannel_raw() rpmsg_upref_sleepers is called

At this point you are nothing happen until 15 second because rpmsg_xmit_done is
never called  again that would wake up the waitqueue to call get_a_tx_buf()

I'm right?

If yes what is not clear to me is that wait_event_interruptible_timeout() seems
to test the condition (so call get_a_tx_buf()) before entering in sleep[1]. A
free TX buffer should be found at this step.

[1]https://elixir.bootlin.com/linux/latest/source/include/linux/wait.h#L534

Regards,
Arnaud

> 
> after applying this patch we haven't been able to reproduce the 15s timeout
> anymore, whereas before we could easily reproduce it with certain workloads.
> 
>> 3) This patch gets applied when rc1 comes out so that it has 6 or 7 weeks to
>> soak.  No error are locks are reported due to this patch during that time.
> 
> mentioning locks: i was a bit uncertain about a good way to implement the retry,
> since both `rpmsg_upref_sleepers` and `get_a_tx_buf` both acquire the same
> mutex. i briefly considered to add `get_a_tx_buf` into `rpmsg_upref_sleepers` to
> avoid locking the same mutex multiple times, though it adds a bit of complexity
> to the implementation and harms readability a bit.
> are there any recommendations on this topic or are (likely non-contended) locks
> not expensive enough to justify the added complexity?
> 
> thanks,
> tim
> 
> 
>>
>>>
>>> Regards,
>>> Arnaud
>>>
>>>>
>>>> in this case, so we re-try once before we really start to sleep
>>>>
>>>> Signed-off-by: Tim Blechmann <tim@klingt.org>
>>>> ---
>>>>   drivers/rpmsg/virtio_rpmsg_bus.c | 24 +++++++++++++++---------
>>>>   1 file changed, 15 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c
>>>> b/drivers/rpmsg/virtio_rpmsg_bus.c
>>>> index 905ac7910c98..2a9d42225e60 100644
>>>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>>>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>>>> @@ -587,21 +587,27 @@ static int rpmsg_send_offchannel_raw(struct
>>>> rpmsg_device *rpdev,
>>>>         /* no free buffer ? wait for one (but bail after 15 seconds) */
>>>>       while (!msg) {
>>>>           /* enable "tx-complete" interrupts, if not already enabled */
>>>>           rpmsg_upref_sleepers(vrp);
>>>>   -        /*
>>>> -         * sleep until a free buffer is available or 15 secs elapse.
>>>> -         * the timeout period is not configurable because there's
>>>> -         * little point in asking drivers to specify that.
>>>> -         * if later this happens to be required, it'd be easy to add.
>>>> -         */
>>>> -        err = wait_event_interruptible_timeout(vrp->sendq,
>>>> -                    (msg = get_a_tx_buf(vrp)),
>>>> -                    msecs_to_jiffies(15000));
>>>> +        /* make sure to retry to grab tx buffer before we start waiting */
>>>> +        msg = get_a_tx_buf(vrp);
>>>> +        if (msg) {
>>>> +            err = 0;
>>>> +        } else {
>>>> +            /*
>>>> +             * sleep until a free buffer is available or 15 secs elapse.
>>>> +             * the timeout period is not configurable because there's
>>>> +             * little point in asking drivers to specify that.
>>>> +             * if later this happens to be required, it'd be easy to add.
>>>> +             */
>>>> +            err = wait_event_interruptible_timeout(vrp->sendq,
>>>> +                        (msg = get_a_tx_buf(vrp)),
>>>> +                        msecs_to_jiffies(15000));
>>>> +        }
>>>>             /* disable "tx-complete" interrupts if we're the last sleeper */
>>>>           rpmsg_downref_sleepers(vrp);
>>>>             /* timeout ? */
>>>>           if (!err) {
>>
> 
