Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DEFCA5531
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Sep 2023 10:10:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239536AbjIMKKu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 13 Sep 2023 06:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239570AbjIMKKt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 Sep 2023 06:10:49 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D52C1996
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Sep 2023 03:10:45 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38D7Dk50002545;
        Wed, 13 Sep 2023 12:10:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        message-id:date:mime-version:subject:to:cc:references:from
        :in-reply-to:content-type:content-transfer-encoding; s=
        selector1; bh=HAZZ5g/Rt1EvW+N9Z3Ihax1wOHqF1xQtuWx8vvypjXQ=; b=LM
        kx5upY9AaB7JJCXQ1bzhsX9yIzuvwJwvc9panEHF3WhGPYFNBBsZ2Z47WqXnCH/A
        UntMRyNJDAqL1m6xFqBCtUPw6KdhvypJXZMqEkbnr6az+12f8PIvwEFHwirCZtct
        5FFp45XmzHqJsMbcEr5rsHi9xJBH4XZTn6cjKwtYOv3Ib3xlMPnOGeLOA9F0vFAX
        A8kiZ/klnRnEyKziIg+LRq1JYKO8gQsCsY16sB83DS+ML0hrM2wpbJJaIDE8iVaO
        XP0G4NrR19mGZtcXVjj1aj4bO+6uBm9iiGpjgJRximJi3PLl00mGEmfRQj4GTNmU
        8thY06jwKhAldAEZ5Hvw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t2y7ntrd4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Sep 2023 12:10:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2EACA100057;
        Wed, 13 Sep 2023 12:10:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 208E5233C83;
        Wed, 13 Sep 2023 12:10:40 +0200 (CEST)
Received: from [10.252.24.233] (10.252.24.233) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 13 Sep
 2023 12:10:39 +0200
Message-ID: <9f6f19ad-1985-7e37-d89e-16ba239ad6a4@foss.st.com>
Date:   Wed, 13 Sep 2023 12:10:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus - prevent possible race
 condition
Content-Language: en-US
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Tim Blechmann <tim.blechmann@gmail.com>,
        <linux-remoteproc@vger.kernel.org>, Tim Blechmann <tim@klingt.org>
References: <20230904083602.106703-1-tim@klingt.org>
 <64ecb19a-b3d1-0fa1-b015-b34607aee460@foss.st.com> <ZPZBVS3R/oZuUmk5@p14s>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <ZPZBVS3R/oZuUmk5@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.24.233]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-13_04,2023-09-05_01,2023-05-22_02
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 9/4/23 22:43, Mathieu Poirier wrote:
> On Mon, Sep 04, 2023 at 03:52:56PM +0200, Arnaud POULIQUEN wrote:
>> Hello Tim,
>>
>> On 9/4/23 10:36, Tim Blechmann wrote:
>>> when we cannot get a tx buffer (`get_a_tx_buf`) `rpmsg_upref_sleepers`
>>> enables tx-complete interrupt.
>>> however if the interrupt is executed after `get_a_tx_buf` and before
>>> `rpmsg_upref_sleepers` we may mis the tx-complete interrupt and sleep
>>> for the full 15 seconds.
>>
>>
>> Is there any reason why your co-processor is unable to release the TX RPMSG
>> buffers for 15 seconds? If not, you should first determine the reason why it is
>> stalled.
> 
> Arnaud's concern is valid.  If the remote processor can't consume a buffer
> within 15 seconds, something is probably wrong.
> 
> That said, I believe your assesment of the situation is correct.  *If* the TX
> callback is disabled and there is no buffer available, there is a window of
> opportunity between calls to get_a_tx_buf() and rpmsg_upref_sleepers() for an
> interrupt to arrive in function rpmsg_send_offchannel_raw().  
> 
> From here three things need to happen:
> 
> 1) You send another version of this patch with a changelong that uses proper
> english, i.e capital letters when they are needed and no spelling mistake.
> 
> 2) Arnaud confirms our suspicions.

Seems to me that this patch is useless
- wait_event_interruptible_timeout() function already seems
to test the condition (so call get_a_tx_buf()) before entering in sleep[1].
- ftraces show that vq interrupt is not called during the 15-second period.
  So it is a normal behavior that the vrp->sendq is never waked-up.

Tim needs to analyze the reason why no mailbox interrupt occurs.

[1]https://elixir.bootlin.com/linux/latest/source/include/linux/wait.h#L534


> 
> 3) This patch gets applied when rc1 comes out so that it has 6 or 7 weeks to
> soak.  No error are locks are reported due to this patch during that time. 
> 
>>
>> Regards,
>> Arnaud
>>
>>>
>>> in this case, so we re-try once before we really start to sleep
>>>
>>> Signed-off-by: Tim Blechmann <tim@klingt.org>
>>> ---
>>>  drivers/rpmsg/virtio_rpmsg_bus.c | 24 +++++++++++++++---------
>>>  1 file changed, 15 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
>>> index 905ac7910c98..2a9d42225e60 100644
>>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>>> @@ -587,21 +587,27 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
>>>  
>>>  	/* no free buffer ? wait for one (but bail after 15 seconds) */
>>>  	while (!msg) {
>>>  		/* enable "tx-complete" interrupts, if not already enabled */
>>>  		rpmsg_upref_sleepers(vrp);
>>>  
>>> -		/*
>>> -		 * sleep until a free buffer is available or 15 secs elapse.
>>> -		 * the timeout period is not configurable because there's
>>> -		 * little point in asking drivers to specify that.
>>> -		 * if later this happens to be required, it'd be easy to add.
>>> -		 */
>>> -		err = wait_event_interruptible_timeout(vrp->sendq,
>>> -					(msg = get_a_tx_buf(vrp)),
>>> -					msecs_to_jiffies(15000));
>>> +		/* make sure to retry to grab tx buffer before we start waiting */
>>> +		msg = get_a_tx_buf(vrp);
>>> +		if (msg) {
>>> +			err = 0;
>>> +		} else {
>>> +			/*
>>> +			 * sleep until a free buffer is available or 15 secs elapse.
>>> +			 * the timeout period is not configurable because there's
>>> +			 * little point in asking drivers to specify that.
>>> +			 * if later this happens to be required, it'd be easy to add.
>>> +			 */
>>> +			err = wait_event_interruptible_timeout(vrp->sendq,
>>> +						(msg = get_a_tx_buf(vrp)),
>>> +						msecs_to_jiffies(15000));
>>> +		}
>>>  
>>>  		/* disable "tx-complete" interrupts if we're the last sleeper */
>>>  		rpmsg_downref_sleepers(vrp);
>>>  
>>>  		/* timeout ? */
>>>  		if (!err) {
