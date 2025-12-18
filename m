Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B64D2D5419
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Dec 2025 15:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070291; cv=none; b=MJID2TWN+oR8lqe77Ka4hHg+VpyIFLZ6HdhxCL3qUEhebpkAGIFC50zqLfPhU6oj0moLeEVdClOhY2Hv1qrouQTJk5bimro0yTTV2cJyrVyEZbUhgRF/K70ZAUMwATBYq7upxM+Ei1o61j1XO9CNJ8PWvb4JBbHwzgMKajgL/C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070291; c=relaxed/simple;
	bh=wM6mtQ42kLrbIFFIS6ybd6wPAxn6eUxJB6OQRbWw5jo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kDxR5mSOpbKwqd7syKrovE5r1wr2s28R42a8GLD73IGjXtzHDFkPn+8SUC0wfBopsCwusPpols0cUobk1mi5NW6GffyPLfJg5msD1x81YF6wsUT8b1RgkRNR/QiFD6Z30tlZ7DHasSOY4dOISXPHDDA2VXLWzt074Lo+IkLXvcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=uS/3vuUU; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="uS/3vuUU"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dXDLS40jyz9sl4;
	Thu, 18 Dec 2025 15:58:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1766069888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AnvcTzf4eQpHltEa9TSncPW/58ngk5FSKG9RRcyxl2Q=;
	b=uS/3vuUU8E1M7wUbPCA8bB8JZjyUCTYzF7k1Nk1RdFTmpZvA5KhYJdZQmHVUy0jUdH3U20
	uv+XoWFdpMINaa6nFj3cQjUJAYxfyZHEKJz8WqsV/jhs0tVa5/KISEFiyfQTWz9xk3AFMz
	8GKz8hnVSFPpFhCydOWSLA3S8OKjx8BfHqkCi9zRKD4dJSDYWasbZHJVOvMYzXkSr71JUx
	NxzPJKaL+h2Wno5b6yrAKlKF35x3lZcdAKUNpKD5yvyh9c7XQViVHz3k7GtCZwsWD+5SVW
	pHvuBE3sbl0vH1TWY9igccmmme1pvntj+3jpk00uAkS0EY7Vb0luJ4LCZX2FTw==
Message-ID: <3e7f54e7-9287-47ee-9252-9fa13e028634@mailbox.org>
Date: Thu, 18 Dec 2025 15:58:06 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [v3 PATCH] remoteproc: xlnx: Use high-prio workqueue instead of
 system wq
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Tanmay Shah <tanmay.shah@amd.com>,
 Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
 linux-remoteproc@vger.kernel.org
References: <20251204104009.129483-1-stefan.roese@mailbox.org>
 <b8951794-f720-49a9-9b21-1971a364c956@amd.com>
 <fcd670a1-75c9-4a18-89cf-52c12ff0c07c@mailbox.org>
 <747f8248-bbd8-4580-bc57-3efda9f50eb0@oss.qualcomm.com>
 <d78ab175-e235-4f14-9b36-199209f0da9c@mailbox.org>
 <1adb380c-4b57-4799-8e3f-f9ba5d14eb18@amd.com> <aT9g4FcdJdec01_q@p14s>
 <ae1fd2a4-e35d-4907-a08c-a469adf6e96e@mailbox.org> <aUHTbCVdG6i1hA8Q@p14s>
 <f4071b82-e4bf-49f3-81e7-7a03f4976027@mailbox.org> <aUMh-B5IPtFfjS-7@p14s>
Content-Language: en-US
From: Stefan Roese <stefan.roese@mailbox.org>
In-Reply-To: <aUMh-B5IPtFfjS-7@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 8b95774f4ffead81c35
X-MBO-RS-META: ej5ncug5b777mc35718csnnut7q8akbb

Hi Mathieu,

On 12/17/25 22:34, Mathieu Poirier wrote:
> On Wed, Dec 17, 2025 at 11:27:44AM +0100, Stefan Roese wrote:
>> Hi Mathieu,
>>
>> On 12/16/25 22:47, Mathieu Poirier wrote:
>>> On Tue, Dec 16, 2025 at 03:34:18PM +0100, Stefan Roese wrote:
>>>> Hi Mathieu,
>>>>
>>>> On 12/15/25 02:14, Mathieu Poirier wrote:
>>>>> On Wed, Dec 10, 2025 at 12:28:52PM -0600, Tanmay Shah wrote:
>>>>>> Hello, please check my comments below:
>>>>>>
>>>>>> On 12/10/25 2:29 AM, Stefan Roese wrote:
>>>>>>> Hi Tanmay,
>>>>>>>
>>>>>>> On 12/10/25 03:51, Zhongqiu Han wrote:
>>>>>>>> On 12/5/2025 8:06 PM, Stefan Roese wrote:
>>>>>>>>> Hi Tanmay,
>>>>>>>>>
>>>>>>>>> On 12/4/25 17:45, Tanmay Shah wrote:
>>>>>>>>>> Hello,
>>>>>>>>>>
>>>>>>>>>> Thank You for your patch. Please find my comments below.
>>>>>>>>>>
>>>>>>>>>> On 12/4/25 4:40 AM, Stefan Roese wrote:
>>>>>>>>>>> Testing on our ZynqMP platform has shown, that some R5 messages might
>>>>>>>>>>> get dropped under high CPU load. This patch creates a new high-prio
>>>>>>>>>>
>>>>>>
>>>>>> This commit text should be fixed. Messages are not dropped by Linux, but R5
>>>>>> can't send new messages as rx vq is not processed by Linux.
>>>>>>
>>>>>
>>>>> I agree.
>>>>>>>>>> Here, I would like to understand what it means by "R5
>>>>>>>>>> messages might get dropped"
>>>>>>>>>>
>>>>>>>>>> Even under high CPU load, the messages from R5 are stored in
>>>>>>>>>> the virtqueues. If Linux doesn't read it, then it is not
>>>>>>>>>> really lost/ dropped.
>>>>>>>>>>
>>>>>>>>>> Could you please explain your use case in detail and how the
>>>>>>>>>> testing is conducted?
>>>>>>>>>
>>>>>>>>> Our use-case is, that we send ~4k messages per second from the R5 to
>>>>>>>>> Linux - sometimes even a bit more. Normally these messages are received
>>>>>>>>> okay and no messages are dropped. Sometimes, under "high CPU load"
>>>>>>>>> scenarios it happens, that the R5 has to drop messages, as there is no
>>>>>>>>> free space in the RPMsg buffer, which is 256 entries AFAIU. Resulting
>>>>>>>>> from the Linux driver not emptying the RX queue.
>>>>>>>>>
>>>>>>
>>>>>> Thanks for the details. Your understanding is correct.
>>>>>>
>>>>>>>>> Could you please elaborate on these virtqueues a bit? Especially why no
>>>>>>>>> messages drop should happen because of these virtqueues?
>>>>>>>>
>>>>>>>> AFAIK, as a transport layer based on virtqueue, rpmsg is reliable once a
>>>>>>>> message has been successfully enqueued. The observed "drop" here appears
>>>>>>>> to be on the R5 side, where the application discards messages when no
>>>>>>>> entry buffer is available.
>>>>>>>
>>>>>>> Correct.
>>>>>>>
>>>>>>>> In the long run, while improving the Linux side is recommended,
>>>>>>>
>>>>>>> Yes, please.
>>>>>>>
>>>>>>>> it could
>>>>>>>> also be helpful for the R5 side to implement strategies such as an
>>>>>>>> application-level buffer and retry mechanisms.
>>>>>>>
>>>>>>> We already did this. We've added an additional buffer mechanism to the
>>>>>>> R5, which improved this "message drop situation" a bit. Still it did not
>>>>>>> fix it for all our high message rate situations - still resulting in
>>>>>>> frame drops on the R5 side (the R5 is a bit resource restricted).
>>>>>>>
>>>>>>> Improving the responsiveness on the Linux side seems to be the best way
>>>>>>> for us to deal with this problem.
>>>>>>>
>>>>>>
>>>>>> I agree to this. However, Just want to understand and cover full picture
>>>>>> here.
>>>>>>
>>>>>> On R5 side, I am assuming open-amp library is used for the RPMsg
>>>>>> communication.
>>>>>>
>>>>>> rpmsg_send() API will end up here: https://github.com/OpenAMP/open-amp/blob/be5770f30516505c1a4d35efcffff9fb547f7dcf/lib/rpmsg/rpmsg_virtio.c#L384
>>>>>>
>>>>>> Here, if the new buffer is not available, then R5 is supposed to wait for
>>>>>> 1ms before sending a new message. After 1ms, R5 will try to get buffer
>>>>>> again, and this continues for 15 seconds. This is the default mechanism.
>>>>>>
>>>>>> This mechanism is used in your case correctly ?
>>>>>>
>>>>>> Alternatively you can register platform specific wait mechanism via this
>>>>>> callback: https://github.com/OpenAMP/open-amp/blob/be5770f30516505c1a4d35efcffff9fb547f7dcf/lib/include/openamp/rpmsg_virtio.h#L42
>>>>>>
>>>>>> Few questions for further understanding:
>>>>>>
>>>>>> 1) As per your use case, 4k per second data transfer rate must be maintained
>>>>>> all the time? And this is achieved with this patch?
>>>>>>
>>>>>> Even after having the high priority queue, if someone wants to achieve 8k
>>>>>> per seconds or 16k per seconds data transfer rate, at some point we will hit
>>>>>> this issue again.
>>>>>>
>>>>>
>>>>> Right, I also think this patch is not the right solution.
>>>>
>>>> Hmmm. My understanding of Tanmays's comments is somewhat different. He
>>>> is not "against" this patch in general AFAIU. Please see my reply with
>>>> a more detailed description of our system setup and it's message flow
>>>> and limitations that I just sent a few minutes ago.
>>>>
>>>
>>> Regardless of how we spin things around, this patch is about running out of
>>> resource (CPU cycles and memory).  It is only a matter of time before this
>>> solution becomes obsolete.
>>>
>>> The main issue here is that we are adding a priority workqueue for everyone
>>> using this driver, which may have unwanted side effects.  Please add a kernel
>>> module parameter to control what kind of workqueue is to be used.
>>
>> Okay, will do.
> 
> Please see this patchset [1] Tanmay is currently working on.  I would much
> rather see that solution put to work than playing with workqueue priorities.
> 
> [1]. "[RFC PATCH 0/2] Enhance RPMsg buffer management"

Thanks for the notice. I'll take a look at it and if possible give it
a try and will report back.

Thanks,
Stefan

