Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3F0284B42;
	Tue, 22 Apr 2025 14:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745331720; cv=none; b=ZnO3AahFNkW+gmFOLHpqN1IVGl0JyFrLibHq4w6RRauaITmpGBveTw3UhdnXFhXwGpguu6OF0jpftiTuZqk/Zx+Fyusb2VCGMGRY82EdEgbUTIpCrZ42YyqF7VhfaIZ/eFS+FjvbbPz9qzYdJ9fuPUaT6awyoaDFD9tXf7h1Y6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745331720; c=relaxed/simple;
	bh=XOEH5rrNBtaClK6UaInBfUmRXv+vwOzjPr7oo98KS1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=B2SvcSFex0GRjo9Nq1eBxhNW1nV0EUb/azw7ypGUJlWlr+dCOIgndQBm6tt+I+Tg8S+wafYSfiODL4XRJE6rHwVNWD7sfn0yLQgvLvOuD7mAHpbvi0e0GilKKUcMAGsGsfNC+lw2/dNX6VikfAt2H8AHzD314O7Pa1x3WSJGQR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=D1bDAc6r; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="D1bDAc6r"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MELlCJ1921269
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 09:21:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745331707;
	bh=fBjEUugOh3JesEo3NU08eZuqdxR4wkP3ncsye57gb+U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=D1bDAc6rPVG3ncCj99Gdc9n3tqmSI8zc5oL8cmIw6MRhmaGFjk2xKmvB6tkemn16s
	 sACdVSTDQ79m1CtcIFD6hdQcPnAqkJZb61AcN9lM5gUSrizrWzpcb2MxC7rcAM+hhF
	 GjoNQnRRjo6nn7OiioJ9XOe+KMTWVU2a9gXNleqI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MELldp118113
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 09:21:47 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 09:21:47 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 09:21:47 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MELkIx010494;
	Tue, 22 Apr 2025 09:21:47 -0500
Message-ID: <5a64069d-f586-4894-b81d-b7b131fceafc@ti.com>
Date: Tue, 22 Apr 2025 09:21:46 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 15/33] remoteproc: k3: Refactor rproc_reset()
 implementation into common driver
To: Beleswar Prasad Padhi <b-padhi@ti.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250417182001.3903905-1-b-padhi@ti.com>
 <20250417182001.3903905-16-b-padhi@ti.com>
 <00ba399d-7a26-4ced-8f77-334839bb54c6@ti.com>
 <f34d7439-fa13-4359-ae20-e88449591d4b@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <f34d7439-fa13-4359-ae20-e88449591d4b@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 4/22/25 12:53 AM, Beleswar Prasad Padhi wrote:
> Hi Andrew,
> 
> On 21/04/25 20:12, Andrew Davis wrote:
>> On 4/17/25 1:19 PM, Beleswar Padhi wrote:
>>> The rproc_reset() implementations in TI K3 DSP and M4 remoteproc drivers
>>> assert reset in the same way. Refactor the above function into the
>>> ti_k3_common.c driver as k3_rproc_reset() and use it throughout DSP and
>>> M4 drivers for resetting the remote processor.
>>>
>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>> ---
>>> v10: Changelog:
>>> 1. Split [v9 12/26] into [v10 14/33] and [v10 15/33] patches.
>>>
>>> Link to v9:
>>> https://lore.kernel.org/all/20250317120622.1746415-13-b-padhi@ti.com/
>>>
>>>    drivers/remoteproc/ti_k3_common.c         | 25 ++++++++++++++++++++
>>>    drivers/remoteproc/ti_k3_common.h         |  1 +
>>>    drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 ++---------------------
>>>    drivers/remoteproc/ti_k3_m4_remoteproc.c  | 16 +++----------
>>>    4 files changed, 31 insertions(+), 39 deletions(-)
>>>
>>> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
>>> index aace308b49b0e..19bb6c337af77 100644
>>> --- a/drivers/remoteproc/ti_k3_common.c
>>> +++ b/drivers/remoteproc/ti_k3_common.c
>>> @@ -105,5 +105,30 @@ void k3_rproc_kick(struct rproc *rproc, int vqid)
>>>    }
>>>    EXPORT_SYMBOL_GPL(k3_rproc_kick);
>>>    +/* Put the remote processor into reset */
>>> +int k3_rproc_reset(struct k3_rproc *kproc)
>>> +{
>>> +    struct device *dev = kproc->dev;
>>> +    int ret;
>>> +
>>> +    if (kproc->data->uses_lreset) {
>>> +        ret = reset_control_assert(kproc->reset);
>>> +        if (ret)
>>> +            dev_err(dev, "local-reset assert failed (%pe)\n", ERR_PTR(ret));
>>> +        return ret;
>>> +    }
>>> +
>>> +    ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
>>> +                            kproc->ti_sci_id);
>>> +    if (ret) {
>>> +        dev_err(dev, "module-reset assert failed (%pe)\n", ERR_PTR(ret));
>>> +        if (reset_control_deassert(kproc->reset))
>>> +            dev_warn(dev, "local-reset deassert back failed\n");
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +EXPORT_SYMBOL_GPL(k3_rproc_reset);
>>> +
>>>    MODULE_LICENSE("GPL");
>>>    MODULE_DESCRIPTION("TI K3 common Remoteproc code");
>>> diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
>>> index 6ae7ac4ec5696..f3400fc774766 100644
>>> --- a/drivers/remoteproc/ti_k3_common.h
>>> +++ b/drivers/remoteproc/ti_k3_common.h
>>> @@ -90,4 +90,5 @@ struct k3_rproc {
>>>      void k3_rproc_mbox_callback(struct mbox_client *client, void *data);
>>>    void k3_rproc_kick(struct rproc *rproc, int vqid);
>>> +int k3_rproc_reset(struct k3_rproc *kproc);
>>>    #endif /* REMOTEPROC_TI_K3_COMMON_H */
>>> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>>> index 0a8c9e61393d2..f8a5282df5b71 100644
>>> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>>> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>>> @@ -24,30 +24,6 @@
>>>      #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK    (SZ_16M - 1)
>>>    -/* Put the DSP processor into reset */
>>> -static int k3_dsp_rproc_reset(struct k3_rproc *kproc)
>>> -{
>>> -    struct device *dev = kproc->dev;
>>> -    int ret;
>>> -
>>> -    if (kproc->data->uses_lreset) {
>>> -        ret = reset_control_assert(kproc->reset);
>>> -        if (ret)
>>> -            dev_err(dev, "local-reset assert failed (%pe)\n", ERR_PTR(ret));
>>> -        return ret;
>>> -    }
>>> -
>>> -    ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
>>> -                            kproc->ti_sci_id);
>>> -    if (ret) {
>>> -        dev_err(dev, "module-reset assert failed (%pe)\n", ERR_PTR(ret));
>>> -        if (reset_control_deassert(kproc->reset))
>>> -            dev_warn(dev, "local-reset deassert back failed\n");
>>> -    }
>>> -
>>> -    return ret;
>>> -}
>>> -
>>>    /* Release the DSP processor from reset */
>>>    static int k3_dsp_rproc_release(struct k3_rproc *kproc)
>>>    {
>>> @@ -201,7 +177,7 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
>>>    {
>>>        struct k3_rproc *kproc = rproc->priv;
>>>    -    k3_dsp_rproc_reset(kproc);
>>> +    k3_rproc_reset(kproc);
>>>          return 0;
>>>    }
>>> @@ -565,7 +541,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>>>                    return dev_err_probe(dev, ret, "failed to get reset status\n");
>>>                } else if (ret == 0) {
>>>                    dev_warn(dev, "local reset is deasserted for device\n");
>>> -                k3_dsp_rproc_reset(kproc);
>>> +                k3_rproc_reset(kproc);
>>>                }
>>>            }
>>>        }
>>> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
>>> index 8a6917259ce60..7d5b75be2e4f8 100644
>>> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
>>> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
>>> @@ -65,11 +65,9 @@ static int k3_m4_rproc_prepare(struct rproc *rproc)
>>>         * Ensure the local reset is asserted so the core doesn't
>>>         * execute bogus code when the module reset is released.
>>>         */
>>> -    ret = reset_control_assert(kproc->reset);
>>> -    if (ret) {
>>> -        dev_err(dev, "could not assert local reset\n");
>>> +    ret = k3_rproc_reset(kproc);
>>> +    if (ret)
>>>            return ret;
>>> -    }
>>>          ret = reset_control_status(kproc->reset);
>>>        if (ret <= 0) {
>>> @@ -374,16 +372,8 @@ static int k3_m4_rproc_start(struct rproc *rproc)
>>>    static int k3_m4_rproc_stop(struct rproc *rproc)
>>>    {
>>>        struct k3_rproc *kproc = rproc->priv;
>>> -    struct device *dev = kproc->dev;
>>> -    int ret;
>>>    -    ret = reset_control_assert(kproc->reset);
>>> -    if (ret) {
>>> -        dev_err(dev, "local-reset assert failed, ret = %d\n", ret);
>>> -        return ret;
>>> -    }
>>> -
>>> -    return 0;
>>> +    return k3_rproc_reset(kproc);
>>
>> This doesn't feel right. The new common k3_rproc_reset() function
>> matches what ti_k3_dsp_remoteproc.c did for reset, you made it that
>> way in the previous patch [14/33]. But it doesn't match what this
>> M4 version does (yes I know logically they are the same as `uses_lreset`
>> will be always true for M4). Maybe you want to do the same as you
>> did for DSP to the M4 driver first, before you make this change so
>> it is 100% clear the code is the same (and so bisect lands on the
>> right patch should someday this be an issue).
> 
> 
> Sure, I can make that change in next revision...
> 
>>
>> Also, the common k3_rproc_reset() calls put_device() unconditionally.
>> Something that wasn't done at all here in the M4 prepare() and stop()
>> functions.
> 
> 
> There is a 'return ret' in the 'if (kproc->data->uses_lreset)' condition flow in k3_rproc_reset().
> 
> put_device() should not be unconditional...
> 

Ah, I must have looked right past the return statement. So it is one or
the other, but not both? Might be good to put the put_device() side into
an `else` block.

Then it seems in the !uses_lreset path you still undo the reset_control_assert()
by calling reset_control_deassert() if put_device() fails. Think you messed
this one up in back in [14/33].

Andrew

>>
>> These two changes make this patch not strictly a pure "refactor"
>> patch, which IMHO should in no way change the calls being made nor
>> the logical flow, only the code structure.
> 
> 
> Got it. Will address in revision. Will wait for more reviews (if any) before re-spinning.
> 
> Thanks,
> Beleswar
> 
>>
>> Andrew
>>
>>>    }
>>>      /*
