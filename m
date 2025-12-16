Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C05B34B18F
	for <linux-remoteproc@vger.kernel.org>; Tue, 16 Dec 2025 14:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765895189; cv=none; b=jbOtwy44puR0g9kGbs8ldDhY4NtlrpBKGtB/3AEZ5FngcfHqwTElxbmnvJKYzU5l1NV+lkrtSkTxNo0TUYe6WAlo2HMQHdGqEdIZulWeRd3GE53t6EjVA+/DwGIWSQDLpPAqFahCszYBaaDZC8dFACgxPS+nIyaSpmvtbAM7uhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765895189; c=relaxed/simple;
	bh=kJNBYcTs6qCWKtWWJD2RAI0KmEFOfelbbMVX/BaE5So=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=huqoAbfKiivvp0fkHQG84s9cVTtMGiPNaMN58F0Bxjh4fEy3Yh9GD3FeLUgnfJGhBaY2ub7lyK3kzkwdQHbCzUmYOlHDkwdiOtxVIbAAJtcoOl6S+DjOA1rrA1VQ742DwkH6NPJ4gbSYBzjNXoxHikSCfwmMrWA2m5wkV4Ta120=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=KNV+mIOi; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="KNV+mIOi"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dVzkl3sVvz9tMQ;
	Tue, 16 Dec 2025 15:26:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1765895183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tKivxpBcemiHps4ixWpxeIqOzE1+k2W7e7y2mSvVhYk=;
	b=KNV+mIOi61LeH5n5c7phHOmLFZBPQ8cD9aA7b0GCqhkphl2X2Ofv0UselyENUoff5M2kV1
	Qlk4i1Ej73zi44jfEh/sdKPWmvOOhIkT2DwrP80+LZBg8HSFvlWbIanWZbcgTIoM/I1NnW
	PqphA0zP/eJ7kr1L+3lfemQI/8aF8DNr/XieSkenMQYLmXNqTpW4Wc4yRT3tAkE+5/49GV
	xix8y5hOSMRcpkccl/E3qxMDwQCYwE0GwUbp86avFWhSgcVpovo6abnYgiEDPyJdDYgbpa
	IGQg4L6sHzN5gqdWSRb6SExoixVUmWqVG0nSX2xmv4Bzr+xzqlYr/rJVw5O9Jw==
Message-ID: <88d6fd7a-5e6d-41ff-8ff0-f65d57354abc@mailbox.org>
Date: Tue, 16 Dec 2025 15:26:21 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [v3 PATCH] remoteproc: xlnx: Use high-prio workqueue instead of
 system wq
To: tanmay.shah@amd.com, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
 linux-remoteproc@vger.kernel.org
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20251204104009.129483-1-stefan.roese@mailbox.org>
 <b8951794-f720-49a9-9b21-1971a364c956@amd.com>
 <fcd670a1-75c9-4a18-89cf-52c12ff0c07c@mailbox.org>
 <747f8248-bbd8-4580-bc57-3efda9f50eb0@oss.qualcomm.com>
 <d78ab175-e235-4f14-9b36-199209f0da9c@mailbox.org>
 <1adb380c-4b57-4799-8e3f-f9ba5d14eb18@amd.com>
Content-Language: en-US
From: Stefan Roese <stefan.roese@mailbox.org>
In-Reply-To: <1adb380c-4b57-4799-8e3f-f9ba5d14eb18@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 86c322bb7e23779299f
X-MBO-RS-META: g4ubi33qmtx1k7njwn4mnr3ogo9exn3x

Hi Tanmay,

sorry for the delay. Please find some comments below...

On 12/10/25 19:28, Tanmay Shah wrote:
> Hello, please check my comments below:
> 
> On 12/10/25 2:29 AM, Stefan Roese wrote:
>> Hi Tanmay,
>>
>> On 12/10/25 03:51, Zhongqiu Han wrote:
>>> On 12/5/2025 8:06 PM, Stefan Roese wrote:
>>>> Hi Tanmay,
>>>>
>>>> On 12/4/25 17:45, Tanmay Shah wrote:
>>>>> Hello,
>>>>>
>>>>> Thank You for your patch. Please find my comments below.
>>>>>
>>>>> On 12/4/25 4:40 AM, Stefan Roese wrote:
>>>>>> Testing on our ZynqMP platform has shown, that some R5 messages might
>>>>>> get dropped under high CPU load. This patch creates a new high-prio
>>>>>
> 
> This commit text should be fixed. Messages are not dropped by Linux, but 
> R5 can't send new messages as rx vq is not processed by Linux.

Agreed. I will change the commit message in the next patch revision.

>>>>> Here, I would like to understand what it means by "R5 messages 
>>>>> might get dropped"
>>>>>
>>>>> Even under high CPU load, the messages from R5 are stored in the 
>>>>> virtqueues. If Linux doesn't read it, then it is not really lost/ 
>>>>> dropped.
>>>>>
>>>>> Could you please explain your use case in detail and how the 
>>>>> testing is conducted?
>>>>
>>>> Our use-case is, that we send ~4k messages per second from the R5 to
>>>> Linux - sometimes even a bit more. Normally these messages are received
>>>> okay and no messages are dropped. Sometimes, under "high CPU load"
>>>> scenarios it happens, that the R5 has to drop messages, as there is no
>>>> free space in the RPMsg buffer, which is 256 entries AFAIU. Resulting
>>>> from the Linux driver not emptying the RX queue.
>>>>
> 
> Thanks for the details. Your understanding is correct.
> 
>>>> Could you please elaborate on these virtqueues a bit? Especially why no
>>>> messages drop should happen because of these virtqueues?
>>>
>>> AFAIK, as a transport layer based on virtqueue, rpmsg is reliable once a
>>> message has been successfully enqueued. The observed "drop" here appears
>>> to be on the R5 side, where the application discards messages when no
>>> entry buffer is available.
>>
>> Correct.
>>
>>> In the long run, while improving the Linux side is recommended,
>>
>> Yes, please.
>>
>>> it could
>>> also be helpful for the R5 side to implement strategies such as an
>>> application-level buffer and retry mechanisms.
>>
>> We already did this. We've added an additional buffer mechanism to the
>> R5, which improved this "message drop situation" a bit. Still it did not
>> fix it for all our high message rate situations - still resulting in
>> frame drops on the R5 side (the R5 is a bit resource restricted).
>>
>> Improving the responsiveness on the Linux side seems to be the best way
>> for us to deal with this problem.
>>
> 
> I agree to this. However, Just want to understand and cover full picture 
> here.
> 
> On R5 side, I am assuming open-amp library is used for the RPMsg 
> communication.
> 
> rpmsg_send() API will end up here: https://github.com/OpenAMP/open-amp/ 
> blob/be5770f30516505c1a4d35efcffff9fb547f7dcf/lib/rpmsg/rpmsg_virtio.c#L384
> 
> Here, if the new buffer is not available, then R5 is supposed to wait 
> for 1ms before sending a new message. After 1ms, R5 will try to get 
> buffer again, and this continues for 15 seconds. This is the default 
> mechanism.
> 
> This mechanism is used in your case correctly ?

We use rpmsg_trysend() to send data (messages):
- that means we try to write a message to vq
- if it fails (queue full), we just add it to a software ringbuffer
   (and try to send it on the next cycle)
- we cannot wait for a message queue to get "not full", because data to
   write to rpmsg vq arrives cyclic each [ms] (so we cannot wait for
   rpmsg sending to be done)

> Alternatively you can register platform specific wait mechanism via this 
> callback: https://github.com/OpenAMP/open-amp/blob/ 
> be5770f30516505c1a4d35efcffff9fb547f7dcf/lib/include/openamp/ 
> rpmsg_virtio.h#L42
> 
> Few questions for further understanding:
> 
> 1) As per your use case, 4k per second data transfer rate must be 
> maintained all the time? And this is achieved with this patch?

Yes, the 4k messages / sec arrive from an external (sensor) system
which is then forwarded from r5 to a53. So therefore it means it has to
be maintained all the time, as we have no control over the external
sensor originating these messages.

> Even after having the high priority queue, if someone wants to achieve 
> 8k per seconds or 16k per seconds data transfer rate, at some point we 
> will hit this issue again.

Agreed. This current "solution" by using a high-prio workqueue will
very likely not fix all use-cases - especially when the message rate
increases even more for a longer time. This is not to be expected in
our system though. We have run longer tests on our system w/o any
message drops (on the r5 side of course) with this patch applied.

> The reliable solution would be to keep the data transfer rate 
> reasonable, and have solid re-try mechanism.

AFAIU, we do have a "solid re-try mechanism" implemented with this
software ringbuffer that we added, as mentioned above. Still the
resources on the r5 side are somewhat limited and we can't increase
this ringbuffer size much more. Additionally we have some requirements
that the messages are received on the Linux a53 side not too much
delayed. IMHO this patch with "improved message receiving" in Linux
seems to be the best solution for us.

> I am okay to take this patch in after addressing comments below but, 
> please make sure all above things are r5 side is working as well.

Okay. Thanks for all your comments and input so far.

Thanks,
Stefan

