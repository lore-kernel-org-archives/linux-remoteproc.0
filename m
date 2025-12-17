Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246C93644DD
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 10:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765967789; cv=none; b=WrqztE+Fbve+g/26e26wFRU40TzkaHl4akjMCG6z/pAgu0R+q+sr4WI7vrlvhcyVENm6d35JjoCxI5Aw+Ac3I4sZa1xsY9RS2CatgJuSdA/y8MZ/9en23pvvEWEUPhYINPUe0RkCLFygWMuBtgFLgJfY5qPX6AFl+gLE0W77BLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765967789; c=relaxed/simple;
	bh=z0negQp6tQNW/vNsZYAh/S3PO+D0X9gwwx7Tey3maNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hGl8m3VczRSKZjMvYyRN0qD7HG1VaQx6sTCUL9wXxXUn6u3gLWy4faoIzIKyhux+Fof2RWVw7rWSGGm0w7P/FBcQuTH9hlzaYsZ02YmfSQ1caITEM0xd9WMMoB8LWw6v+ne88PzUyfvreV5oQKa/rkvgcud2p13uSn3ZbvY6hyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rTjWj2Kr; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rTjWj2Kr"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dWVNy3v6sz9t74;
	Wed, 17 Dec 2025 11:27:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1765967266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cvuKHlzX/N/fnA9wihCdlOWHpKw6dQ2YFS7Fam+/+tU=;
	b=rTjWj2Kr0jZAJA9ERq/ssCtH06X2KaEIVv8AQ90hjtJXWGEdOVS7ogNc35sTBuAZ70E3Dn
	fkgPIDmuNocu7rSr4bdqX+GygDiB06j0BHhOMpVXZnupRjXHFynQ8cq2TcwnH2zdW4G0DO
	w29MCDAaVQzmzvP3Qw2/bz/LxNL7Ba6DQJepFIMq4zBa755GBFMRovspBzvCwsQr2iefhl
	dbi6SWWaCJc+L0UVMoMZPt6p7/FQyaqiYm4GeMkhUsSvDRin2QUTl/ndHy2g4dHt/7hrS8
	rETP8dql4N7QS+mD0W8JqkSdZceW7v0kZYWfwTJbVnKBfsg8qPJ/j7qcLXkHKw==
Message-ID: <f4071b82-e4bf-49f3-81e7-7a03f4976027@mailbox.org>
Date: Wed, 17 Dec 2025 11:27:44 +0100
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
Content-Language: en-US
From: Stefan Roese <stefan.roese@mailbox.org>
In-Reply-To: <aUHTbCVdG6i1hA8Q@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 39a869a256975128753
X-MBO-RS-META: fktij1zdnt3hkw7djwst7xpfgg6yf4e6

Hi Mathieu,

On 12/16/25 22:47, Mathieu Poirier wrote:
> On Tue, Dec 16, 2025 at 03:34:18PM +0100, Stefan Roese wrote:
>> Hi Mathieu,
>>
>> On 12/15/25 02:14, Mathieu Poirier wrote:
>>> On Wed, Dec 10, 2025 at 12:28:52PM -0600, Tanmay Shah wrote:
>>>> Hello, please check my comments below:
>>>>
>>>> On 12/10/25 2:29 AM, Stefan Roese wrote:
>>>>> Hi Tanmay,
>>>>>
>>>>> On 12/10/25 03:51, Zhongqiu Han wrote:
>>>>>> On 12/5/2025 8:06 PM, Stefan Roese wrote:
>>>>>>> Hi Tanmay,
>>>>>>>
>>>>>>> On 12/4/25 17:45, Tanmay Shah wrote:
>>>>>>>> Hello,
>>>>>>>>
>>>>>>>> Thank You for your patch. Please find my comments below.
>>>>>>>>
>>>>>>>> On 12/4/25 4:40 AM, Stefan Roese wrote:
>>>>>>>>> Testing on our ZynqMP platform has shown, that some R5 messages might
>>>>>>>>> get dropped under high CPU load. This patch creates a new high-prio
>>>>>>>>
>>>>
>>>> This commit text should be fixed. Messages are not dropped by Linux, but R5
>>>> can't send new messages as rx vq is not processed by Linux.
>>>>
>>>
>>> I agree.
>>>>>>>> Here, I would like to understand what it means by "R5
>>>>>>>> messages might get dropped"
>>>>>>>>
>>>>>>>> Even under high CPU load, the messages from R5 are stored in
>>>>>>>> the virtqueues. If Linux doesn't read it, then it is not
>>>>>>>> really lost/ dropped.
>>>>>>>>
>>>>>>>> Could you please explain your use case in detail and how the
>>>>>>>> testing is conducted?
>>>>>>>
>>>>>>> Our use-case is, that we send ~4k messages per second from the R5 to
>>>>>>> Linux - sometimes even a bit more. Normally these messages are received
>>>>>>> okay and no messages are dropped. Sometimes, under "high CPU load"
>>>>>>> scenarios it happens, that the R5 has to drop messages, as there is no
>>>>>>> free space in the RPMsg buffer, which is 256 entries AFAIU. Resulting
>>>>>>> from the Linux driver not emptying the RX queue.
>>>>>>>
>>>>
>>>> Thanks for the details. Your understanding is correct.
>>>>
>>>>>>> Could you please elaborate on these virtqueues a bit? Especially why no
>>>>>>> messages drop should happen because of these virtqueues?
>>>>>>
>>>>>> AFAIK, as a transport layer based on virtqueue, rpmsg is reliable once a
>>>>>> message has been successfully enqueued. The observed "drop" here appears
>>>>>> to be on the R5 side, where the application discards messages when no
>>>>>> entry buffer is available.
>>>>>
>>>>> Correct.
>>>>>
>>>>>> In the long run, while improving the Linux side is recommended,
>>>>>
>>>>> Yes, please.
>>>>>
>>>>>> it could
>>>>>> also be helpful for the R5 side to implement strategies such as an
>>>>>> application-level buffer and retry mechanisms.
>>>>>
>>>>> We already did this. We've added an additional buffer mechanism to the
>>>>> R5, which improved this "message drop situation" a bit. Still it did not
>>>>> fix it for all our high message rate situations - still resulting in
>>>>> frame drops on the R5 side (the R5 is a bit resource restricted).
>>>>>
>>>>> Improving the responsiveness on the Linux side seems to be the best way
>>>>> for us to deal with this problem.
>>>>>
>>>>
>>>> I agree to this. However, Just want to understand and cover full picture
>>>> here.
>>>>
>>>> On R5 side, I am assuming open-amp library is used for the RPMsg
>>>> communication.
>>>>
>>>> rpmsg_send() API will end up here: https://github.com/OpenAMP/open-amp/blob/be5770f30516505c1a4d35efcffff9fb547f7dcf/lib/rpmsg/rpmsg_virtio.c#L384
>>>>
>>>> Here, if the new buffer is not available, then R5 is supposed to wait for
>>>> 1ms before sending a new message. After 1ms, R5 will try to get buffer
>>>> again, and this continues for 15 seconds. This is the default mechanism.
>>>>
>>>> This mechanism is used in your case correctly ?
>>>>
>>>> Alternatively you can register platform specific wait mechanism via this
>>>> callback: https://github.com/OpenAMP/open-amp/blob/be5770f30516505c1a4d35efcffff9fb547f7dcf/lib/include/openamp/rpmsg_virtio.h#L42
>>>>
>>>> Few questions for further understanding:
>>>>
>>>> 1) As per your use case, 4k per second data transfer rate must be maintained
>>>> all the time? And this is achieved with this patch?
>>>>
>>>> Even after having the high priority queue, if someone wants to achieve 8k
>>>> per seconds or 16k per seconds data transfer rate, at some point we will hit
>>>> this issue again.
>>>>
>>>
>>> Right, I also think this patch is not the right solution.
>>
>> Hmmm. My understanding of Tanmays's comments is somewhat different. He
>> is not "against" this patch in general AFAIU. Please see my reply with
>> a more detailed description of our system setup and it's message flow
>> and limitations that I just sent a few minutes ago.
>>
> 
> Regardless of how we spin things around, this patch is about running out of
> resource (CPU cycles and memory).  It is only a matter of time before this
> solution becomes obsolete.
> 
> The main issue here is that we are adding a priority workqueue for everyone
> using this driver, which may have unwanted side effects.  Please add a kernel
> module parameter to control what kind of workqueue is to be used.

Okay, will do.

Thanks,
Stefan

