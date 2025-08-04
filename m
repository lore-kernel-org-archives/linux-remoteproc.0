Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEAD202961;
	Mon,  4 Aug 2025 21:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754342091; cv=none; b=sIBG2n5csbyff7zOQuEBLYa3eAW/43j2OSX/+Rfc27nn//I5vt2t+uSiwTlUrX9wNxJ4ZgJMouwvkNScwEfZsXyQZwHd6RQwa0NDJNHMna5qScEO0HtW+X4Q1B/JdCzefPPyFmywpdoFrwdeGkYil/9yIpV+tmDw8Fyzr1TL6cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754342091; c=relaxed/simple;
	bh=aq/DxusihwomxxX6DYJw5zQy0FuHmPCkgLNIR1TPiJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OWYO23p/w3IiVmmy0YiHE55bZQOHRqvhvNO647Dv9UbK71FjHmRqMZPiikn3/rWgeDusJIDhNpCKEBwnqCnT/WOj1FiwcZz6L+7aY9SIt0hbupWuR52+iCAR028YRnJ74U95R/foIjj0W4nALqbmWfzw8aCIKD8foyrT5Fm4GvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xh70KJFH; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xh70KJFH"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 574LERiA3892237;
	Mon, 4 Aug 2025 16:14:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754342067;
	bh=gV0PT7HDrym1N5u5T/S0eICWSthViFzX0JNnjcZvT7k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xh70KJFHyb2kmzUMgASGDRrAKDEgVKMlSwT1dLBnXdbtyN5w1lUEEwRtDivEfK/9U
	 5Hgx10pj0iv7f7OeZcQ+DNpNda7eXeYDK9jpuUWNfsGPaEKM6tSImuhv/mQ2EKPhNm
	 L2XWbNyTeNEzU9ibyu1lJLDlkueT76SCq/vmQitM=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 574LERVj2947449
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 4 Aug 2025 16:14:27 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 4
 Aug 2025 16:14:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 4 Aug 2025 16:14:26 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 574LEQAX743563;
	Mon, 4 Aug 2025 16:14:26 -0500
Message-ID: <f74d44d5-c263-4d82-b1d5-7e542e47672b@ti.com>
Date: Mon, 4 Aug 2025 16:14:26 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: System can not go into suspend when remoteproc is probed on AM62X
To: Hiago De Franco <hiagofranco@gmail.com>
CC: Beleswar Prasad Padhi <b-padhi@ti.com>, <linux-remoteproc@vger.kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suman Anna <s-anna@ti.com>, <linux-kernel@vger.kernel.org>,
        Hiago De Franco <hiago.franco@toradex.com>
References: <20250726143908.ayug6dedkmzulldx@hiagonb>
 <d6ac080c-9a13-49eb-9cf5-1723df613548@ti.com>
 <20250729180420.svxtcukjlgg5sv6p@hiagonb>
 <yz2x2ywvmms6xgdvefqwr6ioi5cateagf2egqjnug7ozkcatx6@f652ifqzrm33>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <yz2x2ywvmms6xgdvefqwr6ioi5cateagf2egqjnug7ozkcatx6@f652ifqzrm33>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 8/4/25 2:31 PM, Hiago De Franco wrote:
> Hi Andrew,
> 
> On Tue, Jul 29, 2025 at 03:04:20PM -0300, Hiago De Franco wrote:
>> On Sat, Jul 26, 2025 at 12:48:14PM -0500, Andrew Davis wrote:
>>> On 7/26/25 9:39 AM, Hiago De Franco wrote:
>>>> Hi Andrew, Beleswar,
>>>>
>>>> On Fri, Jul 25, 2025 at 02:29:22PM -0500, Andrew Davis wrote:
>>>>>
>>>>> So the issue then looks to be this message we send here when we setup
>>>>> the mailbox[0]. This mailbox setup is done during probe() for the K3
>>>>> rproc drivers now (mailbox setup used to be done during
>>>>> rproc_{start,attach}() before [1]). Moving mailbox setup to probe
>>>>> is correct, but we should have factored out the test message sending
>>>>> code out of mailbox setup so it could have been left in
>>>>> rproc_{start,attach}(). That way we only send this message if the
>>>>> core is going to be started, no sense in sending that message if
>>>>> we are not even going to run the core..
>>>>>
>>>>> Fix might be as simple as [2] (not tested, if this works feel free
>>>>> to send as a fix)
>>>>
>>>> I tested the patch and it works, thanks!
>>>>
>>>>>
>>>>> Andrew
>>>>>
>>>>> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/remoteproc/ti_k3_common.c#n176
>>>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3f11cfe890733373ddbb1ce8991ccd4ee5e79e1
>>>>> [2]
>>>>>
>>>>> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
>>>>> index a70d4879a8bea..657a200fa9040 100644
>>>>> --- a/drivers/remoteproc/ti_k3_common.c
>>>>> +++ b/drivers/remoteproc/ti_k3_common.c
>>>>> @@ -198,6 +198,22 @@ int k3_rproc_reset(struct k3_rproc *kproc)
>>>>>    }
>>>>>    EXPORT_SYMBOL_GPL(k3_rproc_reset);
>>>>> +static int k3_rproc_ping(struct k3_rproc *kproc)
>>>>> +{
>>>>> +       /*
>>>>> +        * Ping the remote processor, this is only for sanity-sake for now;
>>>>> +        * there is no functional effect whatsoever.
>>>>> +        *
>>>>> +        * Note that the reply will _not_ arrive immediately: this message
>>>>> +        * will wait in the mailbox fifo until the remote processor is booted.
>>>>> +        */
>>>>> +       int ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
>>>>> +       if (ret < 0)
>>>>> +               dev_err(kproc->dev, "mbox_send_message failed (%pe)\n", ERR_PTR(ret));
>>>>> +
>>>>> +       return ret;
>>>>> +}
>>>>> +
>>>>>    /* Release the remote processor from reset */
>>>>>    int k3_rproc_release(struct k3_rproc *kproc)
>>>>>    {
>>>>> @@ -221,6 +237,8 @@ int k3_rproc_release(struct k3_rproc *kproc)
>>>>>           if (ret)
>>>>>                   dev_err(dev, "module-reset deassert failed (%pe)\n", ERR_PTR(ret));
>>>>> +       k3_rproc_ping(kproc);
>>>>> +
>>>>>           return ret;
>>>>>    }
>>>>>    EXPORT_SYMBOL_GPL(k3_rproc_release);
>>>>> @@ -243,20 +261,6 @@ int k3_rproc_request_mbox(struct rproc *rproc)
>>>>>                   return dev_err_probe(dev, PTR_ERR(kproc->mbox),
>>>>>                                        "mbox_request_channel failed\n");
>>>>> -       /*
>>>>> -        * Ping the remote processor, this is only for sanity-sake for now;
>>>>> -        * there is no functional effect whatsoever.
>>>>> -        *
>>>>> -        * Note that the reply will _not_ arrive immediately: this message
>>>>> -        * will wait in the mailbox fifo until the remote processor is booted.
>>>>> -        */
>>>>> -       ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
>>>>> -       if (ret < 0) {
>>>>> -               dev_err(dev, "mbox_send_message failed (%pe)\n", ERR_PTR(ret));
>>>>> -               mbox_free_channel(kproc->mbox);
>>>>> -               return ret;
>>>>> -       }
>>>>> -
>>>>>           return 0;
>>>>>    }
>>>>>    EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
>>>>> @@ -397,7 +401,12 @@ EXPORT_SYMBOL_GPL(k3_rproc_stop);
>>>>>     * remote core. This callback is invoked only in IPC-only mode and exists
>>>>>     * because rproc_validate() checks for its existence.
>>>>>     */
>>>>> -int k3_rproc_attach(struct rproc *rproc) { return 0; }
>>>>> +int k3_rproc_attach(struct rproc *rproc)
>>>>> +{
>>>>> +       k3_rproc_ping(rproc->priv);
>>>>> +
>>>>> +       return 0;
>>>>> +}
>>>>>    EXPORT_SYMBOL_GPL(k3_rproc_attach);
>>>>>    /*
>>>>>
>>>>
>>>> On Sat, Jul 26, 2025 at 07:47:34PM +0530, Beleswar Prasad Padhi wrote:
>>>>>>
>>>>>> So the issue then looks to be this message we send here when we setup
>>>>>> the mailbox[0]. This mailbox setup is done during probe() for the K3
>>>>>> rproc drivers now (mailbox setup used to be done during
>>>>>> rproc_{start,attach}() before [1]). Moving mailbox setup to probe
>>>>>> is correct, but we should have factored out the test message sending
>>>>>> code out of mailbox setup so it could have been left in
>>>>>> rproc_{start,attach}().
>>>>>
>>>>>
>>>>> Or, how about we don't send that test mbox message at all. It does not
>>>>> actually check if the remoteproc was able to receive and respond to the
>>>>> message. It only verifies if the write to the mbox queue was successful. And
>>>>> most firmwares anyways don't reply to that mailbox-level echo message.
>>>>
>>>> I was thinking about the same.
>>>>
>>>> I tested the patch and it indeed works, however when I boot the remote
>>>> core with a hello world firwmare from the TI MCU SDK (with IPC enabled
>>>> with the sysconfig), the ping is sent but M4 never replies to it, which
>>>> at the end causes an unread message to stay there. Later, if I stop the
>>>> remote processor, I can not got into suspend mode again because of this
>>>> message.
>>>>
>>>> So I believe we should never send the message or clear the mailbox when
>>>> the remote processor is stopped, but I was not able to find a way to
>>>> clear the mailbox. So, is it ok if we never send the ping?
>>>>
>>>
>>> So right now it is okay to not send that ping, and in the past I've
>>> thought about removing it (it is a bit of a legacy hold-over from
>>> the OMAP RProc driver. Back then we would send other messages like
>>> suspend and shutdown requests, you can see the different messages
>>> here[0]. Actually using those messages never got upstream, only the
>>> ping message part did.
>>>
>>> For K3 we want to start making use of all these other messages and
>>> upstream the support for the same. So removing the ping test message
>>> felt like a step backwards as it is a good placeholder for the more
>>> important messages we want to send later. But as said, removing it
>>> is probably fine for now.
>>>
>>> The second thing on the roadmap is to better deal with messages left
>>> in the mailbox queue when we try to suspend. Basically on suspend the
>>> mailbox IP is powered down and all messages waiting will be lost, this
>>> can cause issues. Instead of blocking suspend, one other option would
>>> be to attempt to read out these messages and restore them on resume.
>>> This state saving would match what most other IP drivers. This would
>>> fix issues like the above were the firmware doesn't consume a message
>>> for whatever reason. But until we implement that, either we throw out
>>> messages on suspend, or we block suspend.
>>
>> Got it, thanks for you explanation Andrew. I am out this week, so next
>> week I will propose a patch so we can turn around this issue.
>>
>> Thanks!
>>
>> Hiago.
> 
> Sorry for the delay, I am back this week, I was testing the patches and
> removing the ping was not enough, there is one extra message being sent,
> which is the k3_rproc_kick() from ti_k3_common.c. This one is a callback
> from remoteproc_virtio.c.
> 

So tracing back, looks like this message will be added to the mailbox
when Linux tries to start communication with the remote core, and that
happens if the firmware advertises vrings in its resource table.

> I belive this one is necessary to make the firmware works, but with the
> hello world demo, I still have the issue where I can not go into suspend

Which "hello world demo" is this? In Zephyr, we do not add the VDEV to
the resource table if the firmware does not intend to communicate[0].
But MCU+SDK firmware might add these unconditionally, I'm not sure. You
could check what is in the table with:

$ readelf -x .resource_table <your_firmware.elf>

and empty one might look like:

> Hex dump of section '.resource_table':
>   0xa3100000 01000000 00000000 00000000 00000000 ................

one with VDEV will be much longer.

Andrew

[0] https://github.com/zephyrproject-rtos/zephyr/blob/main/lib/open-amp/resource_table.h#L34

> mode. Removing both mbox_send_message() calls makes the suspend work
> again:
> 
> root@verdin-am62-15479173:~# dmesg | grep -i -E "remoteproc|rproc|omap-mailbox|hfranco"
> [    0.000000] Kernel command line: root=PARTUUID=096221e5-02 ro rootwait console=tty1 console=ttyS2,115200 dyndb
> g="file ti_k3_common.c +p; file remotecore_proc.c +p; file remoteproc_virtio.c +p"
> [   10.520920] omap-mailbox 29000000.mailbox: omap mailbox rev 0x66fc9100
> [   10.711357] k3-m4-rproc 5000000.m4fss: assigned reserved memory node m4f-dma-memory@9cb00000
> [   10.753040] k3-m4-rproc 5000000.m4fss: configured M4F for remoteproc mode
> [   10.793640] remoteproc remoteproc0: 5000000.m4fss is available
> [   10.856735] remoteproc remoteproc0: powering up 5000000.m4fss
> [   10.895961] remoteproc remoteproc0: Booting fw image am62-mcu-m4f0_0-fw, size 451080
> [   11.000752] rproc-virtio rproc-virtio.4.auto: assigned reserved memory node m4f-dma-memory@9cb00000
> [   11.101614] rproc-virtio rproc-virtio.4.auto: registered virtio0 (type 7)
> [   11.151665] remoteproc remoteproc0: remote processor 5000000.m4fss is now up
> [   12.123724] remoteproc remoteproc1: 30074000.pru is available
> [   12.171118] remoteproc remoteproc2: 30078000.pru is available
> [   12.337287] remoteproc remoteproc0: vring0: va 00000000cabe42be qsz 256 notifyid 0
> [   12.337337] remoteproc remoteproc0: vring1: va 00000000a651968a qsz 256 notifyid 1
> [   12.348543] remoteproc remoteproc0: kicking vq index: 0
> [   12.348559] hfranco: sending msg 0x0, name mbox-m4-0
> [ 2514.508396] remoteproc remoteproc0: stopped remote processor 5000000.m4fss
> [ 2518.010399] omap-mailbox 29000000.mailbox: fifo 1 has unexpected unread messages
> [ 2518.010433] omap-mailbox 29000000.mailbox: PM: dpm_run_callback(): platform_pm_suspend returns -16
> [ 2518.010461] omap-mailbox 29000000.mailbox: PM: failed to suspend: error -16
> 
> In this case, I was wondering if we should drop the messages for now,
> until we have the routine to save the messages first. Any suggestion you
> might have?
> 
> Thanks for the help,
> Hiago.
> 
>>
>>>
>>> Andrew
>>>
>>> [0] drivers/remoteproc/omap_remoteproc.h
>>>
>>>> Best regards,
>>>> Hiago.
>>>>
>>>>>
>>>>> Thanks,
>>>>> Beleswar
>>>>>
>>>>>> That way we only send this message if the
>>>>>> core is going to be started, no sense in sending that message if
>>>>>> we are not even going to run the core..
>>>>>>
>>>>>> Fix might be as simple as [2] (not tested, if this works feel free
>>>>>> to send as a fix)
>>>>>>
>>>>>> Andrew
>>>>>>
>>>>>> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/remoteproc/ti_k3_common.c#n176
>>>>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3f11cfe890733373ddbb1ce8991ccd4ee5e79e1
>>>>>> [2]
>>>>>>
>>>>>> diff --git a/drivers/remoteproc/ti_k3_common.c
>>>>>> b/drivers/remoteproc/ti_k3_common.c
>>>>>> index a70d4879a8bea..657a200fa9040 100644
>>>>>> --- a/drivers/remoteproc/ti_k3_common.c
>>>>>> +++ b/drivers/remoteproc/ti_k3_common.c
>>>>>> @@ -198,6 +198,22 @@ int k3_rproc_reset(struct k3_rproc *kproc)
>>>>>>    }
>>>>>>    EXPORT_SYMBOL_GPL(k3_rproc_reset);
>>>>>>
>>>>>> +static int k3_rproc_ping(struct k3_rproc *kproc)
>>>>>> +{
>>>>>> +       /*
>>>>>> +        * Ping the remote processor, this is only for sanity-sake for
>>>>>> now;
>>>>>> +        * there is no functional effect whatsoever.
>>>>>> +        *
>>>>>> +        * Note that the reply will _not_ arrive immediately: this
>>>>>> message
>>>>>> +        * will wait in the mailbox fifo until the remote processor is
>>>>>> booted.
>>>>>> +        */
>>>>>> +       int ret = mbox_send_message(kproc->mbox, (void
>>>>>> *)RP_MBOX_ECHO_REQUEST);
>>>>>> +       if (ret < 0)
>>>>>> +               dev_err(kproc->dev, "mbox_send_message failed (%pe)\n",
>>>>>> ERR_PTR(ret));
>>>>>> +
>>>>>> +       return ret;
>>>>>> +}
>>>>>> +
>>>>>>    /* Release the remote processor from reset */
>>>>>>    int k3_rproc_release(struct k3_rproc *kproc)
>>>>>>    {
>>>>>> @@ -221,6 +237,8 @@ int k3_rproc_release(struct k3_rproc *kproc)
>>>>>>           if (ret)
>>>>>>                   dev_err(dev, "module-reset deassert failed (%pe)\n",
>>>>>> ERR_PTR(ret));
>>>>>>
>>>>>> +       k3_rproc_ping(kproc);
>>>>>> +
>>>>>>           return ret;
>>>>>>    }
>>>>>>    EXPORT_SYMBOL_GPL(k3_rproc_release);
>>>>>> @@ -243,20 +261,6 @@ int k3_rproc_request_mbox(struct rproc *rproc)
>>>>>>                   return dev_err_probe(dev, PTR_ERR(kproc->mbox),
>>>>>>                                        "mbox_request_channel failed\n");
>>>>>>
>>>>>> -       /*
>>>>>> -        * Ping the remote processor, this is only for sanity-sake for
>>>>>> now;
>>>>>> -        * there is no functional effect whatsoever.
>>>>>> -        *
>>>>>> -        * Note that the reply will _not_ arrive immediately: this
>>>>>> message
>>>>>> -        * will wait in the mailbox fifo until the remote processor is
>>>>>> booted.
>>>>>> -        */
>>>>>> -       ret = mbox_send_message(kproc->mbox, (void
>>>>>> *)RP_MBOX_ECHO_REQUEST);
>>>>>> -       if (ret < 0) {
>>>>>> -               dev_err(dev, "mbox_send_message failed (%pe)\n",
>>>>>> ERR_PTR(ret));
>>>>>> -               mbox_free_channel(kproc->mbox);
>>>>>> -               return ret;
>>>>>> -       }
>>>>>> -
>>>>>>           return 0;
>>>>>>    }
>>>>>>    EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
>>>>>> @@ -397,7 +401,12 @@ EXPORT_SYMBOL_GPL(k3_rproc_stop);
>>>>>>     * remote core. This callback is invoked only in IPC-only mode and
>>>>>> exists
>>>>>>     * because rproc_validate() checks for its existence.
>>>>>>     */
>>>>>> -int k3_rproc_attach(struct rproc *rproc) { return 0; }
>>>>>> +int k3_rproc_attach(struct rproc *rproc)
>>>>>> +{
>>>>>> +       k3_rproc_ping(rproc->priv);
>>>>>> +
>>>>>> +       return 0;
>>>>>> +}
>>>>>>    EXPORT_SYMBOL_GPL(k3_rproc_attach);
>>>>>>
>>>>>>    /*
>>>>>>
>>>

