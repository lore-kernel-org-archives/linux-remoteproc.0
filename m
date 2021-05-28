Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C52C2B9F7
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 17:04:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A39EA61163
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 17:04:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236702AbhE1RFv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 28 May 2021 13:05:51 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60502 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236936AbhE1RFq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 28 May 2021 13:05:46 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14SH477a102424;
        Fri, 28 May 2021 12:04:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622221447;
        bh=uzOjkxfEeBF2+iCXgteMhI62c2+c5IdoryuXiE8OlIc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=QincO4/fy/Zm6WqBiYl5GUOCIVFfJyITnC1ou9OYwlk4Ou+kMuxqaVYgIbZ3YWxbH
         HsHomkd4PpoIJNKD2TsVbqFqURUWjAlDxtCMqC4Q4dLEbQzmfwxC1938KdiYcpZwR9
         QyEyvMqo6VntZdLn4QxWd7OraMSsE8Ym9W6QTMNk=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14SH46S8046827
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 28 May 2021 12:04:06 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 28
 May 2021 12:04:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 28 May 2021 12:04:06 -0500
Received: from [10.250.35.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14SH45b9084574;
        Fri, 28 May 2021 12:04:05 -0500
Subject: Re: [PATCH 6/6] remoteproc: k3-dsp: Add support for IPC-only mode for
 all K3 DSPs
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20210522000309.26134-1-s-anna@ti.com>
 <20210522000309.26134-7-s-anna@ti.com> <YLBzN2UBGbTELETv@builder.lan>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <edca6bf2-56e5-6c7f-9f55-1f0954a36e21@ti.com>
Date:   Fri, 28 May 2021 12:04:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YLBzN2UBGbTELETv@builder.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Bjorn,

On 5/27/21 11:36 PM, Bjorn Andersson wrote:
> On Fri 21 May 19:03 CDT 2021, Suman Anna wrote:
> 
>> Add support to the K3 DSP remoteproc driver to configure all the C66x
>> and C71x cores on J721E SoCs to be either in IPC-only mode or the
>> traditional remoteproc mode. The IPC-only mode expects that the remote
>> processors are already booted by the bootloader, and only perform the
>> minimum steps required to initialize and deinitialize the virtio IPC
>> transports. The remoteproc mode allows the kernel remoteproc driver to
>> do the regular load and boot and other device management operations for
>> a DSP.
>>
>> The IPC-only mode for a DSP is detected and configured at driver probe
>> time by querying the System Firmware for the DSP power and reset state
>> and/or status and making sure that the DSP is indeed started by the
>> bootloaders, otherwise the device is configured for remoteproc mode.
>>
>> Support for IPC-only mode is achieved through .attach(), .detach() and
>> .get_loaded_rsc_table() callback ops and various other flags in both
>> remoteproc core and the K3 DSP remoteproc driver. The resource table
>> follows a design-by-contract approach and is expected to be at the base
>> of the DDR firmware region reserved for each remoteproc, it is mostly
>> expected to contain only the virtio device and trace resource entries.
>>
>> NOTE:
>> The driver cannot configure a DSP core for remoteproc mode by any
>> means without rebooting the kernel if that R5F core has been started
>> by a bootloader.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 151 ++++++++++++++++++++--
>>  1 file changed, 138 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>> index faf60a274e8d..b154a52f1fa6 100644
>> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>> @@ -76,6 +76,7 @@ struct k3_dsp_dev_data {
>>   * @ti_sci_id: TI-SCI device identifier
>>   * @mbox: mailbox channel handle
>>   * @client: mailbox client to request the mailbox channel
>> + * @ipc_only: flag to indicate IPC-only mode
>>   */
>>  struct k3_dsp_rproc {
>>  	struct device *dev;
>> @@ -91,6 +92,7 @@ struct k3_dsp_rproc {
>>  	u32 ti_sci_id;
>>  	struct mbox_chan *mbox;
>>  	struct mbox_client client;
>> +	bool ipc_only;
>>  };
>>  
>>  /**
>> @@ -268,6 +270,10 @@ static int k3_dsp_rproc_prepare(struct rproc *rproc)
>>  	struct device *dev = kproc->dev;
>>  	int ret;
>>  
>> +	/* IPC-only mode does not require the core to be released from reset */
>> +	if (kproc->ipc_only)
> 
> Rather than saying "prepare shouldn't do anything", how about not
> actually providing prepare/unprepare ops when ipc_only?

I could do that but it won't provide scalability for me if I want to enhance
this to support both options, esp. given that the ops registration is a one-time
setting right now in probe.

> 
>> +		return 0;
>> +
>>  	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
>>  						    kproc->ti_sci_id);
>>  	if (ret)
>> @@ -292,6 +298,10 @@ static int k3_dsp_rproc_unprepare(struct rproc *rproc)
>>  	struct device *dev = kproc->dev;
>>  	int ret;
>>  
>> +	/* do not put back the cores into reset in IPC-only mode */
>> +	if (kproc->ipc_only)
>> +		return 0;
>> +
>>  	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
>>  						    kproc->ti_sci_id);
>>  	if (ret)
>> @@ -314,6 +324,12 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
>>  	u32 boot_addr;
>>  	int ret;
>>  
>> +	if (kproc->ipc_only) {
> 
> It doesn't seem to make sense to start a remoteproc in ipc_only mode, so
> how about not registering the start ops?

Similar argument as above. This path is only to provide a sanity checking, and
would be needed if I support both options. I am not sure if changing the ops
dynamically is a better option than doing this sanity checks.

> 
>> +		dev_err(dev, "%s cannot be invoked in IPC-only mode\n",
>> +			__func__);
>> +		return -EINVAL;
>> +	}
>> +
>>  	ret = k3_dsp_rproc_request_mbox(rproc);
>>  	if (ret)
>>  		return ret;
>> @@ -351,6 +367,13 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
>>  static int k3_dsp_rproc_stop(struct rproc *rproc)
>>  {
>>  	struct k3_dsp_rproc *kproc = rproc->priv;
>> +	struct device *dev = kproc->dev;
>> +
>> +	if (kproc->ipc_only) {
>> +		dev_err(dev, "%s cannot be invoked in IPC-only mode\n",
>> +			__func__);
>> +		return -EINVAL;
>> +	}
>>  
>>  	mbox_free_channel(kproc->mbox);
>>  
>> @@ -359,6 +382,85 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
>>  	return 0;
>>  }
>>  
>> +/*
>> + * Attach to a running DSP remote processor (IPC-only mode)
>> + *
>> + * This rproc attach callback only needs to request the mailbox, the remote
>> + * processor is already booted, so there is no need to issue any TI-SCI
>> + * commands to boot the DSP core.
>> + */
>> +static int k3_dsp_rproc_attach(struct rproc *rproc)
>> +{
>> +	struct k3_dsp_rproc *kproc = rproc->priv;
>> +	struct device *dev = kproc->dev;
>> +	int ret;
>> +
>> +	if (!kproc->ipc_only || rproc->state != RPROC_DETACHED) {
> 
> As attach only makes sense when ipc_only, how about not specifying the
> attach ops when !ipc_only?

This is again used only for sanity-checking, and added for symmetry similar to
the change in start. Ideally, we should not enter this code path.

> 
>> +		dev_err(dev, "DSP is expected to be in IPC-only mode and RPROC_DETACHED state\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = k3_dsp_rproc_request_mbox(rproc);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dev_err(dev, "DSP initialized in IPC-only mode\n");
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Detach from a running DSP remote processor (IPC-only mode)
>> + *
>> + * This rproc detach callback performs the opposite operation to attach callback
>> + * and only needs to release the mailbox, the DSP core is not stopped and will
>> + * be left to continue to run its booted firmware.
>> + */
>> +static int k3_dsp_rproc_detach(struct rproc *rproc)
>> +{
>> +	struct k3_dsp_rproc *kproc = rproc->priv;
>> +	struct device *dev = kproc->dev;
>> +
>> +	if (!kproc->ipc_only || rproc->state != RPROC_ATTACHED) {
> 
> Ditto.
> 
>> +		dev_err(dev, "DSP is expected to be in IPC-only mode and RPROC_ATTACHED state\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	mbox_free_channel(kproc->mbox);
>> +	dev_err(dev, "DSP deinitialized in IPC-only mode\n");
>> +	return 0;
>> +}
>> +
>> +/*
>> + * This function implements the .get_loaded_rsc_table() callback and is used
>> + * to provide the resource table for a booted DSP in IPC-only mode. The K3 DSP
>> + * firmwares follow a design-by-contract approach and are expected to have the
>> + * resource table at the base of the DDR region reserved for firmware usage.
>> + * This provides flexibility for the remote processor to be booted by different
>> + * bootloaders that may or may not have the ability to publish the resource table
>> + * address and size through a DT property.
>> + */
>> +static struct resource_table *k3_dsp_get_loaded_rsc_table(struct rproc *rproc,
>> +							  size_t *rsc_table_sz)
>> +{
>> +	struct k3_dsp_rproc *kproc = rproc->priv;
>> +	struct device *dev = kproc->dev;
>> +
>> +	if (!kproc->rmem[0].cpu_addr) {
>> +		dev_err(dev, "memory-region #1 does not exist, loaded rsc table can't be found");
>> +		return ERR_PTR(-ENOMEM);
>> +	}
>> +
>> +	/*
>> +	 * NOTE: The resource table size is currently hard-coded to a maximum
>> +	 * of 256 bytes. The most common resource table usage for K3 firmwares
>> +	 * is to only have the vdev resource entry and an optional trace entry.
>> +	 * The exact size could be computed based on resource table address, but
>> +	 * the hard-coded value suffices to support the IPC-only mode.
>> +	 */
>> +	*rsc_table_sz = 256;
> 
> Why can't you use kproc->rmem[0].size here?

That's the whole reserved memory area size, which will also be used for all the
other firmware segments. ST and IMX are assigning 1K as the size, and I went
with an even smaller size.

> 
>> +	return (struct resource_table *)kproc->rmem[0].cpu_addr;
>> +}
>> +
>>  /*
>>   * Custom function to translate a DSP device address (internal RAMs only) to a
>>   * kernel virtual address.  The DSPs can access their RAMs at either an internal
>> @@ -421,8 +523,11 @@ static void *k3_dsp_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
>>  static const struct rproc_ops k3_dsp_rproc_ops = {
> 
> So in essence, I suggest that you create a separate k3_dsp_ipc_only_ops.
> 

rproc core does a memdup, so supporting both later on would make it complex
IMHO. If you insist, I can make the changes, and probably come back to this
version when I have to support both options (my future change would just be to
provide a sysfs/configfs knob to change the detach_on_shutdown flag if using
this code).

>>  	.start		= k3_dsp_rproc_start,
>>  	.stop		= k3_dsp_rproc_stop,
>> +	.attach		= k3_dsp_rproc_attach,
>> +	.detach		= k3_dsp_rproc_detach,
>>  	.kick		= k3_dsp_rproc_kick,
>>  	.da_to_va	= k3_dsp_rproc_da_to_va,
>> +	.get_loaded_rsc_table = k3_dsp_get_loaded_rsc_table,
>>  };
>>  
>>  static int k3_dsp_rproc_of_get_memories(struct platform_device *pdev,
>> @@ -605,6 +710,8 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>>  	struct k3_dsp_rproc *kproc;
>>  	struct rproc *rproc;
>>  	const char *fw_name;
>> +	bool r_state = false;
>> +	bool p_state = false;
>>  	int ret = 0;
>>  	int ret1;
>>  
>> @@ -683,19 +790,37 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>>  		goto release_tsp;
>>  	}
>>  
>> -	/*
>> -	 * ensure the DSP local reset is asserted to ensure the DSP doesn't
>> -	 * execute bogus code in .prepare() when the module reset is released.
>> -	 */
>> -	if (data->uses_lreset) {
>> -		ret = reset_control_status(kproc->reset);
>> -		if (ret < 0) {
>> -			dev_err(dev, "failed to get reset status, status = %d\n",
>> -				ret);
>> -			goto release_mem;
>> -		} else if (ret == 0) {
>> -			dev_warn(dev, "local reset is deasserted for device\n");
>> -			k3_dsp_rproc_reset(kproc);
>> +	ret = kproc->ti_sci->ops.dev_ops.is_on(kproc->ti_sci, kproc->ti_sci_id,
>> +					       &r_state, &p_state);
> 
> You can pass NULL instead of &r_state, as you don't use it anyways.

Yeah ok. I use it on R5, but not DSP.

> 
>> +	if (ret) {
>> +		dev_err(dev, "failed to get initial state, mode cannot be determined, ret = %d\n",
>> +			ret);
>> +		goto release_mem;
>> +	}
>> +
>> +	/* configure J721E devices for either remoteproc or IPC-only mode */
>> +	if (p_state) {
>> +		dev_err(dev, "configured DSP for IPC-only mode\n");
> 
> This sounds like a good thing, so perhaps dev_info() rather than err?

Yeah, will do.

> 
>> +		rproc->state = RPROC_DETACHED;
>> +		rproc->detach_on_shutdown = true;
>> +		kproc->ipc_only = true;
>> +	} else {
>> +		dev_err(dev, "configured DSP for remoteproc mode\n");
> 
> Ditto

Will fix.

Thanks for the review. I will refresh the series and make similar changes to R5F
driver as well once I get some more feedback on the core patches (and hear from
Mathieu as well).

regards
Suman

> 
> Regards,
> Bjorn
>> +		/*
>> +		 * ensure the DSP local reset is asserted to ensure the DSP
>> +		 * doesn't execute bogus code in .prepare() when the module
>> +		 * reset is released.
>> +		 */
>> +		if (data->uses_lreset) {
>> +			ret = reset_control_status(kproc->reset);
>> +			if (ret < 0) {
>> +				dev_err(dev, "failed to get reset status, status = %d\n",
>> +					ret);
>> +				goto release_mem;
>> +			} else if (ret == 0) {
>> +				dev_warn(dev, "local reset is deasserted for device\n");
>> +				k3_dsp_rproc_reset(kproc);
>> +			}
>>  		}
>>  	}
>>  
>> -- 
>> 2.30.1
>>

