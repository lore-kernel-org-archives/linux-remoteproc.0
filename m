Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E961BF24;
	Tue, 17 Sep 2024 09:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726564412; cv=none; b=Y76EudE4iZXfQeVA/PbXDap/+lJsfCwZDv3JvHvd7VbxOULf/VUbyvmi0fpcNLAc3n7DdYJwmOS916m1jeHl+c96OmrdrLeWN/24s6JgANnUdWyhDBBAL8/lvrTnXKkw1Ny1wt4iEGCk4qIVDf4OJdnupUU7UpQaYSvv1kIJQ78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726564412; c=relaxed/simple;
	bh=6/OLByoDzveSqJBd0TPDUyGmMGjU+kMwYYGf7+mu7/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Dr2qRSLN6qaav9pVlRNCkaAw8jdLhNJfFsshC03WcIopOFnAo6xpmeriojOg2rlW2cx8FsVbxY3+rIl3SC3HpKWmYbiRJ8leacnaSFb5xjXxYj3MuX2LwmRM+hkl6cd353vB+EEEc47rcXnrj76PginXcylv1dRhQaGhrZ2N5kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=G1MxRMLT; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="G1MxRMLT"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48H9DF0t100526;
	Tue, 17 Sep 2024 04:13:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1726564396;
	bh=haCvIBuxMfLosDZcuVbHqyCIdBhFxTI09sjk9zdTuJ8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=G1MxRMLTcuMSRw/U+DCq1mijlWliAXnbIfxJ09FX2n1kvq7niL8DY4s5NjGuvPysK
	 Hs5v8RpEcubeXSij7kih/2xlmwbYf3ZD2iDTQpTFpPIMbeASYc6mVhFii65oa5WseD
	 F/0OQCl1TS+rBg4krG/Azuc0k/LU3R4hHMQbMywg=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48H9DFOH022932
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Sep 2024 04:13:15 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Sep 2024 04:13:15 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Sep 2024 04:13:15 -0500
Received: from [172.24.19.92] (lt5cd2489kgj.dhcp.ti.com [172.24.19.92])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48H9DBps029766;
	Tue, 17 Sep 2024 04:13:12 -0500
Message-ID: <3ca4b2d1-5c47-4f85-969d-cd61c7ade2dc@ti.com>
Date: Tue, 17 Sep 2024 14:43:11 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] remoteproc: k3-r5: Fix check performed in
 k3_r5_rproc_{mbox_callback/kick}
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, Hari Nagalla <hnagalla@ti.com>,
        Andrew Davis <afd@ti.com>, <andersson@kernel.org>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <u-kumar1@ti.com>
References: <20240916083131.2801755-1-s-vadapalli@ti.com>
 <CANLsYkwTYqfAi+OFg3khMs7VD_PnL=CH-k8HXE71QSdqpR1fvA@mail.gmail.com>
 <fda85c12-e73f-44b8-b66b-1241e417a9b7@ti.com>
 <CANLsYky1Oxu7Fc1-gz53cR+KpO67nDE5LQGj_NV+czOwY2_2CA@mail.gmail.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <CANLsYky1Oxu7Fc1-gz53cR+KpO67nDE5LQGj_NV+czOwY2_2CA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Mathieu,

On 9/17/2024 2:07 PM, Mathieu Poirier wrote:
> On Mon, 16 Sept 2024 at 23:20, Kumar, Udit <u-kumar1@ti.com> wrote:
>> On 9/16/2024 8:50 PM, Mathieu Poirier wrote:
>>> On Mon, 16 Sept 2024 at 02:31, Siddharth Vadapalli <s-vadapalli@ti.com> wrote:
>>>> Commit f3f11cfe8907 ("remoteproc: k3-r5: Acquire mailbox handle during
>>>> probe routine") introduced a check in the "k3_r5_rproc_mbox_callback()" and
>>>> "k3_r5_rproc_kick()" callbacks, causing them to exit if the remote core's
>>>> state is "RPROC_DETACHED". However, the "__rproc_attach()" function that is
>>>> responsible for attaching to a remote core, updates the state of the remote
>>>> core to "RPROC_ATTACHED" only after invoking "rproc_start_subdevices()".
>>>>
>>>> The "rproc_start_subdevices()" function triggers the probe of the Virtio
>>>> RPMsg devices associated with the remote core, which require that the
>>>> "k3_r5_rproc_kick()" and "k3_r5_rproc_mbox_callback()" callbacks are
>>>> functional. Hence, drop the check in the callbacks.
>>> Honestly, I am very tempted to just revert f3f11cfe8907 and ea1d6fb5b571.
>>
>> Please don't :) , it will break rproc in general for k3 devices.
>>
> Why not - it is already broken anyway.  Reverting the patches will
> force TI to actually think about the feature in terms of design,
> completeness and testing.  The merge window opened on Sunday - I'm not
> going to merge whack-a-mole patches and hope the right fix comes
> along.

Now, I am not advocating here to revert or not.

But where we stand currently

1-  Without this patch, IPC is broken in general.

2-  With this patch, IPC is conditionally broken.

In either case, we need to fix it.

your call to revert or keep it.


>
>> Couple of solutions for this race around condition (in mine preference
>> order)
>>
> This is for the TI team to discuss _and_ test thoroughly.  From hereon
> and until I see things improve, all patches from TI will need to be
> tagged with R-B and T-B tags (collected on the mailing lists) from two
> different individuals before I look at them.

Sure we will take care of above

and fair ask on R-B and T-B tags

>
>> 1) In
>> https://elixir.bootlin.com/linux/v6.11/source/drivers/remoteproc/ti_k3_r5_remoteproc.c#L190
>> have a check , if probe in is progress or not
>>
>> 2)
>> https://elixir.bootlin.com/linux/v6.11/source/drivers/remoteproc/ti_k3_r5_remoteproc.c#L1205
>> -- correct the state to ON or something else
>>
>> 3) Move condition
>> https://elixir.bootlin.com/linux/v6.11/source/drivers/remoteproc/remoteproc_core.c#L1360
>> before rproc_start_subdevices
>> <https://elixir.bootlin.com/linux/v6.11/C/ident/rproc_start_subdevices>
>> calling
>>
>>
>>
>>>> Fixes: f3f11cfe8907 ("remoteproc: k3-r5: Acquire mailbox handle during probe routine")
>>>> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>>>> ---
>>>>
>>>> Hello,
>>>>
>>>> Since the commit being fixed is not yet a part of Mainline Linux, this
>>>> patch is based on linux-next tagged next-20240913.
>>>>
>>>> An alternative to this patch will be a change to the "__rproc_attach()"
>>>> function in the "remoteproc_core.c" driver with
>>>> rproc->state = RPROC_ATTACHED;
>>>> being set after "rproc_attach_device()" is invoked, but __before__
>>>> invoking "rproc_start_subdevices()". Since this change will be performed
>>>> in the common Remoteproc Core, it appeared to me that fixing it in the
>>>> TI remoteproc driver is the correct approach.
>>>>
>>>> The equivalent of this patch for ti_k3_dsp_remoteproc.c might also be
>>>> required, which I shall post if the current patch is acceptable.
>>>>
>>>> Kindly review and share your feedback on this patch.
>>>>
>>>> Regards,
>>>> Siddharth.
>>>>
>>>>    drivers/remoteproc/ti_k3_r5_remoteproc.c | 8 --------
>>>>    1 file changed, 8 deletions(-)
>>>>
>>>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>>> index 747ee467da88..4894461aa65f 100644
>>>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>>> @@ -194,10 +194,6 @@ static void k3_r5_rproc_mbox_callback(struct mbox_client *client, void *data)
>>>>           const char *name = kproc->rproc->name;
>>>>           u32 msg = omap_mbox_message(data);
>>>>
>>>> -       /* Do not forward message from a detached core */
>>>> -       if (kproc->rproc->state == RPROC_DETACHED)
>>>> -               return;
>>>> -
>>>>           dev_dbg(dev, "mbox msg: 0x%x\n", msg);
>>>>
>>>>           switch (msg) {
>>>> @@ -233,10 +229,6 @@ static void k3_r5_rproc_kick(struct rproc *rproc, int vqid)
>>>>           mbox_msg_t msg = (mbox_msg_t)vqid;
>>>>           int ret;
>>>>
>>>> -       /* Do not forward message to a detached core */
>>>> -       if (kproc->rproc->state == RPROC_DETACHED)
>>>> -               return;
>>>> -
>>>>           /* send the index of the triggered virtqueue in the mailbox payload */
>>>>           ret = mbox_send_message(kproc->mbox, (void *)msg);
>>>>           if (ret < 0)
>>>> --
>>>> 2.40.1
>>>>
