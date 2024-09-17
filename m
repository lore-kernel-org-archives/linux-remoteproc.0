Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4F216133E;
	Tue, 17 Sep 2024 09:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726566021; cv=none; b=Sm1s3h1LAfh1mgwTii3QY51CqVa4oH9c7Gc3KbFC2Nld0c1byTV1tN1SIi0HqhRERGL1vEjkSZNamwfgiP2vBPrftsCdzY0QhkxoOmYdnIR5Wl92QC1Ays8WVopebleTdyG+ENCn/swIs5j44MaxvO2YZVyexvgOyfn4I6pmg0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726566021; c=relaxed/simple;
	bh=P0T0fsjedBJ/mFJriTdYoQ0qCDv8seU6l4f4zpGqa/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZmiMLsp2CDda4ipz+1NM4fYYcnNrGclPQG018qJztIJGszFsfQsnUj2gPZh46zOLB27WVRAuRSXr2nA3U0wPlblOhuTET54y6gOqh8XlbPdJHzFXfqs2axZcp3vjWu5SUhKnYmJIOHkzVKn7QOI7uRvjnC6VMuYM0Kv6Eyk/Aqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=SNks2fau; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="SNks2fau"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48H9eCeR106185;
	Tue, 17 Sep 2024 04:40:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1726566012;
	bh=rVVmQPcwTSus71ETasIqw7oZH8e1wL19MfvMqR3xvj8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=SNks2fauBEt/CaNQWHz1ZAD4l8jLYw7V4P2ZYYQBZtnOKAJszUkNCTyLSbybZpOPR
	 xBcXPMB/wewt3fmM6fh7Tqv8vebwMktG1E+Har7zJITvxTZ0JK7jBaMnCjEvgNMwtN
	 uxH6gypwmy5UzJvvP2k+JsoRWsg1x+JdkwUSosCU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48H9eCO0029608;
	Tue, 17 Sep 2024 04:40:12 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Sep 2024 04:40:12 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Sep 2024 04:40:12 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48H9e9j4058142;
	Tue, 17 Sep 2024 04:40:10 -0500
Message-ID: <c8b2e851-a247-4a90-acb5-a774d131b561@ti.com>
Date: Tue, 17 Sep 2024 15:10:08 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] remoteproc: k3-r5: Fix check performed in
 k3_r5_rproc_{mbox_callback/kick}
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Kumar, Udit"
	<u-kumar1@ti.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, Hari Nagalla <hnagalla@ti.com>,
        Andrew Davis <afd@ti.com>, <andersson@kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
References: <20240916083131.2801755-1-s-vadapalli@ti.com>
 <CANLsYkwTYqfAi+OFg3khMs7VD_PnL=CH-k8HXE71QSdqpR1fvA@mail.gmail.com>
 <fda85c12-e73f-44b8-b66b-1241e417a9b7@ti.com>
 <CANLsYky1Oxu7Fc1-gz53cR+KpO67nDE5LQGj_NV+czOwY2_2CA@mail.gmail.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <CANLsYky1Oxu7Fc1-gz53cR+KpO67nDE5LQGj_NV+czOwY2_2CA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Mathieu,

On 17/09/24 14:07, Mathieu Poirier wrote:
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


Apologies for causing this trouble, Mathieu. I have accumulated various 
use-cases of the driver, including this, and hereon will keep in mind 
while posting further patches.

>
>> Couple of solutions for this race around condition (in mine preference
>> order)
>>
> This is for the TI team to discuss _and_ test thoroughly.  From hereon
> and until I see things improve, all patches from TI will need to be
> tagged with R-B and T-B tags (collected on the mailing lists) from two
> different individuals before I look at them.


Understood, that is a fair ask. Hereon, I will also attach my test logs 
for all the usecases I've tested a patch with, to give more visibility 
on the testing done.

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
