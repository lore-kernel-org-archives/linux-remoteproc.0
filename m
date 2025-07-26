Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE9418DB35;
	Sat, 26 Jul 2025 17:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753552114; cv=none; b=pBtEO+oFmuunBeKiIctMgdhYOj7XgVhkfQs5r4rqJLt9jAQO2XoFxJv7qdoMV8XxBle0sqV0/utp/T38r/O+OdmJ5q73HCMV42BqHVTZVSknmr6raBSpO9wFOWwE5NuHRckkmmBgaTX1lSKy/6HrjU3TDphnbf2UciItEywTI94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753552114; c=relaxed/simple;
	bh=5q8g5rfGZsCGgudft++Uuax93QYGOm16yIoz8xprXC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qrOAz/NVqvCT6Y/Uq4woklhzFEfMzwiN61lQmA4PvuZl59kScALCpEbd2ZKkQh9GTJhNTv2Vxpdc5QsMZOJW06RYDaiD2wUI5opyw1tyHa9G8U1XGgS5Xkl4WltulRWYfFOSp1CzC4JUmUG8nyQUK8YgoVi+zFEy2wJcKGyx9F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rVkwSFsR; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rVkwSFsR"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56QHmFbR1970174;
	Sat, 26 Jul 2025 12:48:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753552095;
	bh=lBknySK7LW2PewCh2KbhO6eZ7aIWdrJAlsd0CuKuIQY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rVkwSFsRpmXOJm0mla92SyXDeWLWRZ2D33Pk1ij8/WnoWi5x4tDm5A6COStbYdGCI
	 CxhloO3dSSNeYl7hT0ygIzDRkPemAp11Iw7MRL2i/Cg/kryaJXnr6B5diDq2f6QwHJ
	 AHmFXUqVyi8O8bMkP9JqawXhF2MSI9/paeOQzb8w=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56QHmFbV3183689
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 26 Jul 2025 12:48:15 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 26
 Jul 2025 12:48:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sat, 26 Jul 2025 12:48:15 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56QHmEIH3428333;
	Sat, 26 Jul 2025 12:48:14 -0500
Message-ID: <d6ac080c-9a13-49eb-9cf5-1723df613548@ti.com>
Date: Sat, 26 Jul 2025 12:48:14 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: System can not go into suspend when remoteproc is probed on AM62X
To: Hiago De Franco <hiagofranco@gmail.com>,
        Beleswar Prasad Padhi
	<b-padhi@ti.com>
CC: <linux-remoteproc@vger.kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suman
 Anna <s-anna@ti.com>, <linux-kernel@vger.kernel.org>,
        Hiago De Franco
	<hiago.franco@toradex.com>
References: <20250726143908.ayug6dedkmzulldx@hiagonb>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250726143908.ayug6dedkmzulldx@hiagonb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 7/26/25 9:39 AM, Hiago De Franco wrote:
> Hi Andrew, Beleswar,
> 
> On Fri, Jul 25, 2025 at 02:29:22PM -0500, Andrew Davis wrote:
>>
>> So the issue then looks to be this message we send here when we setup
>> the mailbox[0]. This mailbox setup is done during probe() for the K3
>> rproc drivers now (mailbox setup used to be done during
>> rproc_{start,attach}() before [1]). Moving mailbox setup to probe
>> is correct, but we should have factored out the test message sending
>> code out of mailbox setup so it could have been left in
>> rproc_{start,attach}(). That way we only send this message if the
>> core is going to be started, no sense in sending that message if
>> we are not even going to run the core..
>>
>> Fix might be as simple as [2] (not tested, if this works feel free
>> to send as a fix)
> 
> I tested the patch and it works, thanks!
> 
>>
>> Andrew
>>
>> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/remoteproc/ti_k3_common.c#n176
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3f11cfe890733373ddbb1ce8991ccd4ee5e79e1
>> [2]
>>
>> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
>> index a70d4879a8bea..657a200fa9040 100644
>> --- a/drivers/remoteproc/ti_k3_common.c
>> +++ b/drivers/remoteproc/ti_k3_common.c
>> @@ -198,6 +198,22 @@ int k3_rproc_reset(struct k3_rproc *kproc)
>>   }
>>   EXPORT_SYMBOL_GPL(k3_rproc_reset);
>> +static int k3_rproc_ping(struct k3_rproc *kproc)
>> +{
>> +       /*
>> +        * Ping the remote processor, this is only for sanity-sake for now;
>> +        * there is no functional effect whatsoever.
>> +        *
>> +        * Note that the reply will _not_ arrive immediately: this message
>> +        * will wait in the mailbox fifo until the remote processor is booted.
>> +        */
>> +       int ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
>> +       if (ret < 0)
>> +               dev_err(kproc->dev, "mbox_send_message failed (%pe)\n", ERR_PTR(ret));
>> +
>> +       return ret;
>> +}
>> +
>>   /* Release the remote processor from reset */
>>   int k3_rproc_release(struct k3_rproc *kproc)
>>   {
>> @@ -221,6 +237,8 @@ int k3_rproc_release(struct k3_rproc *kproc)
>>          if (ret)
>>                  dev_err(dev, "module-reset deassert failed (%pe)\n", ERR_PTR(ret));
>> +       k3_rproc_ping(kproc);
>> +
>>          return ret;
>>   }
>>   EXPORT_SYMBOL_GPL(k3_rproc_release);
>> @@ -243,20 +261,6 @@ int k3_rproc_request_mbox(struct rproc *rproc)
>>                  return dev_err_probe(dev, PTR_ERR(kproc->mbox),
>>                                       "mbox_request_channel failed\n");
>> -       /*
>> -        * Ping the remote processor, this is only for sanity-sake for now;
>> -        * there is no functional effect whatsoever.
>> -        *
>> -        * Note that the reply will _not_ arrive immediately: this message
>> -        * will wait in the mailbox fifo until the remote processor is booted.
>> -        */
>> -       ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
>> -       if (ret < 0) {
>> -               dev_err(dev, "mbox_send_message failed (%pe)\n", ERR_PTR(ret));
>> -               mbox_free_channel(kproc->mbox);
>> -               return ret;
>> -       }
>> -
>>          return 0;
>>   }
>>   EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
>> @@ -397,7 +401,12 @@ EXPORT_SYMBOL_GPL(k3_rproc_stop);
>>    * remote core. This callback is invoked only in IPC-only mode and exists
>>    * because rproc_validate() checks for its existence.
>>    */
>> -int k3_rproc_attach(struct rproc *rproc) { return 0; }
>> +int k3_rproc_attach(struct rproc *rproc)
>> +{
>> +       k3_rproc_ping(rproc->priv);
>> +
>> +       return 0;
>> +}
>>   EXPORT_SYMBOL_GPL(k3_rproc_attach);
>>   /*
>>
> 
> On Sat, Jul 26, 2025 at 07:47:34PM +0530, Beleswar Prasad Padhi wrote:
>>>
>>> So the issue then looks to be this message we send here when we setup
>>> the mailbox[0]. This mailbox setup is done during probe() for the K3
>>> rproc drivers now (mailbox setup used to be done during
>>> rproc_{start,attach}() before [1]). Moving mailbox setup to probe
>>> is correct, but we should have factored out the test message sending
>>> code out of mailbox setup so it could have been left in
>>> rproc_{start,attach}().
>>
>>
>> Or, how about we don't send that test mbox message at all. It does not
>> actually check if the remoteproc was able to receive and respond to the
>> message. It only verifies if the write to the mbox queue was successful. And
>> most firmwares anyways don't reply to that mailbox-level echo message.
> 
> I was thinking about the same.
> 
> I tested the patch and it indeed works, however when I boot the remote
> core with a hello world firwmare from the TI MCU SDK (with IPC enabled
> with the sysconfig), the ping is sent but M4 never replies to it, which
> at the end causes an unread message to stay there. Later, if I stop the
> remote processor, I can not got into suspend mode again because of this
> message.
> 
> So I believe we should never send the message or clear the mailbox when
> the remote processor is stopped, but I was not able to find a way to
> clear the mailbox. So, is it ok if we never send the ping?
> 

So right now it is okay to not send that ping, and in the past I've
thought about removing it (it is a bit of a legacy hold-over from
the OMAP RProc driver. Back then we would send other messages like
suspend and shutdown requests, you can see the different messages
here[0]. Actually using those messages never got upstream, only the
ping message part did.

For K3 we want to start making use of all these other messages and
upstream the support for the same. So removing the ping test message
felt like a step backwards as it is a good placeholder for the more
important messages we want to send later. But as said, removing it
is probably fine for now.

The second thing on the roadmap is to better deal with messages left
in the mailbox queue when we try to suspend. Basically on suspend the
mailbox IP is powered down and all messages waiting will be lost, this
can cause issues. Instead of blocking suspend, one other option would
be to attempt to read out these messages and restore them on resume.
This state saving would match what most other IP drivers. This would
fix issues like the above were the firmware doesn't consume a message
for whatever reason. But until we implement that, either we throw out
messages on suspend, or we block suspend.

Andrew

[0] drivers/remoteproc/omap_remoteproc.h

> Best regards,
> Hiago.
> 
>>
>> Thanks,
>> Beleswar
>>
>>> That way we only send this message if the
>>> core is going to be started, no sense in sending that message if
>>> we are not even going to run the core..
>>>
>>> Fix might be as simple as [2] (not tested, if this works feel free
>>> to send as a fix)
>>>
>>> Andrew
>>>
>>> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/remoteproc/ti_k3_common.c#n176
>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3f11cfe890733373ddbb1ce8991ccd4ee5e79e1
>>> [2]
>>>
>>> diff --git a/drivers/remoteproc/ti_k3_common.c
>>> b/drivers/remoteproc/ti_k3_common.c
>>> index a70d4879a8bea..657a200fa9040 100644
>>> --- a/drivers/remoteproc/ti_k3_common.c
>>> +++ b/drivers/remoteproc/ti_k3_common.c
>>> @@ -198,6 +198,22 @@ int k3_rproc_reset(struct k3_rproc *kproc)
>>>   }
>>>   EXPORT_SYMBOL_GPL(k3_rproc_reset);
>>>
>>> +static int k3_rproc_ping(struct k3_rproc *kproc)
>>> +{
>>> +       /*
>>> +        * Ping the remote processor, this is only for sanity-sake for
>>> now;
>>> +        * there is no functional effect whatsoever.
>>> +        *
>>> +        * Note that the reply will _not_ arrive immediately: this
>>> message
>>> +        * will wait in the mailbox fifo until the remote processor is
>>> booted.
>>> +        */
>>> +       int ret = mbox_send_message(kproc->mbox, (void
>>> *)RP_MBOX_ECHO_REQUEST);
>>> +       if (ret < 0)
>>> +               dev_err(kproc->dev, "mbox_send_message failed (%pe)\n",
>>> ERR_PTR(ret));
>>> +
>>> +       return ret;
>>> +}
>>> +
>>>   /* Release the remote processor from reset */
>>>   int k3_rproc_release(struct k3_rproc *kproc)
>>>   {
>>> @@ -221,6 +237,8 @@ int k3_rproc_release(struct k3_rproc *kproc)
>>>          if (ret)
>>>                  dev_err(dev, "module-reset deassert failed (%pe)\n",
>>> ERR_PTR(ret));
>>>
>>> +       k3_rproc_ping(kproc);
>>> +
>>>          return ret;
>>>   }
>>>   EXPORT_SYMBOL_GPL(k3_rproc_release);
>>> @@ -243,20 +261,6 @@ int k3_rproc_request_mbox(struct rproc *rproc)
>>>                  return dev_err_probe(dev, PTR_ERR(kproc->mbox),
>>>                                       "mbox_request_channel failed\n");
>>>
>>> -       /*
>>> -        * Ping the remote processor, this is only for sanity-sake for
>>> now;
>>> -        * there is no functional effect whatsoever.
>>> -        *
>>> -        * Note that the reply will _not_ arrive immediately: this
>>> message
>>> -        * will wait in the mailbox fifo until the remote processor is
>>> booted.
>>> -        */
>>> -       ret = mbox_send_message(kproc->mbox, (void
>>> *)RP_MBOX_ECHO_REQUEST);
>>> -       if (ret < 0) {
>>> -               dev_err(dev, "mbox_send_message failed (%pe)\n",
>>> ERR_PTR(ret));
>>> -               mbox_free_channel(kproc->mbox);
>>> -               return ret;
>>> -       }
>>> -
>>>          return 0;
>>>   }
>>>   EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
>>> @@ -397,7 +401,12 @@ EXPORT_SYMBOL_GPL(k3_rproc_stop);
>>>    * remote core. This callback is invoked only in IPC-only mode and
>>> exists
>>>    * because rproc_validate() checks for its existence.
>>>    */
>>> -int k3_rproc_attach(struct rproc *rproc) { return 0; }
>>> +int k3_rproc_attach(struct rproc *rproc)
>>> +{
>>> +       k3_rproc_ping(rproc->priv);
>>> +
>>> +       return 0;
>>> +}
>>>   EXPORT_SYMBOL_GPL(k3_rproc_attach);
>>>
>>>   /*
>>>

