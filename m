Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFFEFCA0FF3
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 Sep 2023 16:06:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232712AbjIEQGj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 5 Sep 2023 12:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245012AbjIEBn0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Sep 2023 21:43:26 -0400
X-Greylist: delayed 573 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 04 Sep 2023 18:43:21 PDT
Received: from klingt.org (mail.klingt.org [86.59.21.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8943CC5
        for <linux-remoteproc@vger.kernel.org>; Mon,  4 Sep 2023 18:43:21 -0700 (PDT)
Received: from [192.168.0.107] ([202.184.201.145])
        (authenticated bits=0)
        by klingt.org (8.17.2/8.17.2/Debian-1) with ESMTPSA id 3851Xc4n485665
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Tue, 5 Sep 2023 03:33:40 +0200
Message-ID: <00d5edfd-808f-51ac-0233-ce8489c6722c@klingt.org>
Date:   Tue, 5 Sep 2023 09:33:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Content-Language: en-US
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Tim Blechmann <tim.blechmann@gmail.com>,
        linux-remoteproc@vger.kernel.org
References: <20230904083602.106703-1-tim@klingt.org>
 <64ecb19a-b3d1-0fa1-b015-b34607aee460@foss.st.com> <ZPZBVS3R/oZuUmk5@p14s>
From:   Tim Blechmann <tim@klingt.org>
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus - prevent possible race
 condition
In-Reply-To: <ZPZBVS3R/oZuUmk5@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: inspected by milter-greylist-4.6.4 (klingt.org [86.59.21.178]); Tue, 05 Sep 2023 03:33:41 +0200 (CEST) for IP:'202.184.201.145' DOMAIN:'[202.184.201.145]' HELO:'[192.168.0.107]' FROM:'tim@klingt.org' RCPT:''
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (klingt.org [86.59.21.178]); Tue, 05 Sep 2023 03:33:41 +0200 (CEST)
X-Virus-Scanned: clamav-milter 1.0.2 at es.klingt.org
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

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

the remote processor certainly releases the tx buffer and according to 
my tracing the `vring_interrupt` fires immediately before `rpmsg_send` 
enters the `rpmsg_upref_sleepers`.

after applying this patch we haven't been able to reproduce the 15s 
timeout anymore, whereas before we could easily reproduce it with 
certain workloads.

> 3) This patch gets applied when rc1 comes out so that it has 6 or 7 weeks to
> soak.  No error are locks are reported due to this patch during that time.

mentioning locks: i was a bit uncertain about a good way to implement 
the retry, since both `rpmsg_upref_sleepers` and `get_a_tx_buf` both 
acquire the same mutex. i briefly considered to add `get_a_tx_buf` into 
`rpmsg_upref_sleepers` to avoid locking the same mutex multiple times, 
though it adds a bit of complexity to the implementation and harms 
readability a bit.
are there any recommendations on this topic or are (likely 
non-contended) locks not expensive enough to justify the added complexity?

thanks,
tim


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
>>>   drivers/rpmsg/virtio_rpmsg_bus.c | 24 +++++++++++++++---------
>>>   1 file changed, 15 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
>>> index 905ac7910c98..2a9d42225e60 100644
>>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>>> @@ -587,21 +587,27 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
>>>   
>>>   	/* no free buffer ? wait for one (but bail after 15 seconds) */
>>>   	while (!msg) {
>>>   		/* enable "tx-complete" interrupts, if not already enabled */
>>>   		rpmsg_upref_sleepers(vrp);
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
>>>   		/* disable "tx-complete" interrupts if we're the last sleeper */
>>>   		rpmsg_downref_sleepers(vrp);
>>>   
>>>   		/* timeout ? */
>>>   		if (!err) {
> 

