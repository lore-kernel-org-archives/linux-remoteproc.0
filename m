Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091AC433A2;
	Mon,  1 Jul 2024 16:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719851924; cv=none; b=qZCFapUwtU8Qx7nM54BkRMW2fwUQicRQ5dfoRO3AP1jB2RVdtY6j8mpME08yNhrhz19YJa5ySWzx1sdQTK5GASA5c6sqU3WPVrNHGbppXbz7gDyvOINYIPB1UeZGPMjuBIdq1IeZkqYRcaRXjZKuBaHxqkJf3DAgvx4Vj/MUCzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719851924; c=relaxed/simple;
	bh=H01g9gBryRLkRh9+H4OPdfYhA1TYMAS1D1oyjraWkNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n9kw1wiSXFS8VYhKXEFmn/8LjRpcu/P/h1yLYedR+8LDkHixLYMmMSiGzo5+Pqw5OxeFMOLhwzt4qEklSh0k4MFDM+xQb+smbq3/DVFJv+zfgKjQIFh22D4HT1YmUjt+4Y5TRtNvlkn1k6+MY5RyDQw6VleKiNMfHefYd79ifZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SzzFR4vb; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SzzFR4vb"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 350D8E0002;
	Mon,  1 Jul 2024 16:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719851920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8HvzdIfyHzEEoeGnnc9sWKv2OQkbjNM4lJYLRDlRULU=;
	b=SzzFR4vbHD97hB9yq4NsHr9h3t0rBfVgJe0tEH54g0iZsZJaqkGp/kQB8WbOWM7GfqfYAy
	GB6FgLfYNnIBZzl96lDKYDgJIxHW22+p9LWK7ggMa4T2P/t09cQrp0GpnN5SuiR2ewkWA8
	L6/PIIEwt6kr3MkgRvF5JyfIFji4Xuz04+kTW772W+3NJRpDpUbHW4htp+s+MVoubsWhoj
	kJn29PN3SMCguKUSmWUx0KLtmjXdU5qrfoAJ8vk3+nMndroqWvmGO96OOuRW4ATtjwnNQB
	0VTkkA6ZW2GCrqHWX9vcBRlBm2AE5F+qBhizAq9Y0qoHyO5FmOi43hV6ERQuKQ==
Message-ID: <ba4e56c9-3a06-4a19-a427-4ddecde738b8@bootlin.com>
Date: Mon, 1 Jul 2024 18:38:38 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] remoteproc: k3-r5: support for graceful stop of
 remote cores
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Suman Anna <s-anna@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Udit Kumar <u-kumar1@ti.com>, Thomas Richard <thomas.richard@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, Hari Nagalla
 <hnagalla@ti.com>, =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Vardhan, Vibhore" <vibhore@ti.com>
References: <20240621150058.319524-1-richard.genoud@bootlin.com>
 <20240621150058.319524-5-richard.genoud@bootlin.com> <Zn8pFIGu2mYNP8vO@p14s>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <Zn8pFIGu2mYNP8vO@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: richard.genoud@bootlin.com

[adding Vibhore in Cc]

Le 28/06/2024 à 23:20, Mathieu Poirier a écrit :
> On Fri, Jun 21, 2024 at 05:00:58PM +0200, Richard Genoud wrote:
>> Introduce software IPC handshake between the K3-R5 remote proc driver
>> and the R5 MCU to gracefully stop/reset the remote core.
>>
>> Upon a stop request, K3-R5 remote proc driver sends a RP_MBOX_SHUTDOWN
>> mailbox message to the remote R5 core.
>> The remote core is expected to:
>> - relinquish all the resources acquired through Device Manager (DM)
>> - disable its interrupts
>> - send back a mailbox acknowledgment RP_MBOX_SHUDOWN_ACK
>> - enter WFI state.
>>
>> Meanwhile, the K3-R5 remote proc driver does:
>> - wait for the RP_MBOX_SHUTDOWN_ACK from the remote core
>> - wait for the remote proc to enter WFI state
>> - reset the remote core through device manager
>>
>> Based on work from: Hari Nagalla <hnagalla@ti.com>
>>
> 
> Why is this needed now and what happens to system with a new kernel driver and
> an older K3R5 firmware?

Without this patch, the IPC firwmares from recent TI PDK prevent the 
suspend:
platform 5d00000.r5f: ti-sci processor set_control failed: -19
remoteproc remoteproc1: can't stop rproc: -19
platform 5c00000.r5f: Failed to shutdown rproc (-19)
platform 5c00000.r5f: k3_r5_rproc_suspend failed (-19)

With a new kernel driver and an old firmware, this will add a timeout 
before stopping it, and the message:

platform 5c00000.r5f: Timeout waiting SHUTDOWN_ACK message. Halting core 
anyway.

(tested on old FW 09.00.00.01 and new FW 09.02.01.18, on J7200)

Regards,
Richard

> 
> Thanks,
> Mathieu
> 
>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>> ---
>>   drivers/remoteproc/omap_remoteproc.h     |  9 +++++-
>>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 40 ++++++++++++++++++++++++
>>   2 files changed, 48 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/omap_remoteproc.h b/drivers/remoteproc/omap_remoteproc.h
>> index 828e13256c02..c008f11fa2a4 100644
>> --- a/drivers/remoteproc/omap_remoteproc.h
>> +++ b/drivers/remoteproc/omap_remoteproc.h
>> @@ -42,6 +42,11 @@
>>    * @RP_MBOX_SUSPEND_CANCEL: a cancel suspend response from a remote processor
>>    * on a suspend request
>>    *
>> + * @RP_MBOX_SHUTDOWN: shutdown request for the remote processor
>> + *
>> + * @RP_MBOX_SHUTDOWN_ACK: successful response from remote processor for a
>> + * shutdown request. The remote processor should be in WFI state short after.
>> + *
>>    * Introduce new message definitions if any here.
>>    *
>>    * @RP_MBOX_END_MSG: Indicates end of known/defined messages from remote core
>> @@ -59,7 +64,9 @@ enum omap_rp_mbox_messages {
>>   	RP_MBOX_SUSPEND_SYSTEM	= 0xFFFFFF11,
>>   	RP_MBOX_SUSPEND_ACK	= 0xFFFFFF12,
>>   	RP_MBOX_SUSPEND_CANCEL	= 0xFFFFFF13,
>> -	RP_MBOX_END_MSG		= 0xFFFFFF14,
>> +	RP_MBOX_SHUTDOWN	= 0xFFFFFF14,
>> +	RP_MBOX_SHUTDOWN_ACK	= 0xFFFFFF15,
>> +	RP_MBOX_END_MSG		= 0xFFFFFF16,
>>   };
>>   
>>   #endif /* _OMAP_RPMSG_H */
>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> index a2ead87952c7..918a15e1dd9a 100644
>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> @@ -21,6 +21,7 @@
>>   #include <linux/pm_runtime.h>
>>   #include <linux/remoteproc.h>
>>   #include <linux/suspend.h>
>> +#include <linux/iopoll.h>
>>   #include <linux/reset.h>
>>   #include <linux/slab.h>
>>   
>> @@ -172,8 +173,23 @@ struct k3_r5_rproc {
>>   	struct k3_r5_core *core;
>>   	struct k3_r5_mem *rmem;
>>   	int num_rmems;
>> +	struct completion shutdown_complete;
>>   };
>>   
>> +/*
>> + * This will return true if the remote core is in Wait For Interrupt state.
>> + */
>> +static bool k3_r5_is_core_in_wfi(struct k3_r5_core *core)
>> +{
>> +	int ret;
>> +	u64 boot_vec;
>> +	u32 cfg, ctrl, stat;
>> +
>> +	ret = ti_sci_proc_get_status(core->tsp, &boot_vec, &cfg, &ctrl, &stat);
>> +
>> +	return !ret ? !!(stat & PROC_BOOT_STATUS_FLAG_R5_WFI) : false;
>> +}
>> +
>>   /**
>>    * k3_r5_rproc_mbox_callback() - inbound mailbox message handler
>>    * @client: mailbox client pointer used for requesting the mailbox channel
>> @@ -209,6 +225,10 @@ static void k3_r5_rproc_mbox_callback(struct mbox_client *client, void *data)
>>   	case RP_MBOX_ECHO_REPLY:
>>   		dev_info(dev, "received echo reply from %s\n", name);
>>   		break;
>> +	case RP_MBOX_SHUTDOWN_ACK:
>> +		dev_dbg(dev, "received shutdown_ack from %s\n", name);
>> +		complete(&kproc->shutdown_complete);
>> +		break;
>>   	default:
>>   		/* silently handle all other valid messages */
>>   		if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
>> @@ -634,6 +654,7 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>>   	struct k3_r5_cluster *cluster = kproc->cluster;
>>   	struct device *dev = kproc->dev;
>>   	struct k3_r5_core *core1, *core = kproc->core;
>> +	bool wfi;
>>   	int ret;
>>   
>>   
>> @@ -650,6 +671,24 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>>   		}
>>   	}
>>   
>> +	/* Send SHUTDOWN message to remote proc */
>> +	reinit_completion(&kproc->shutdown_complete);
>> +	ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_SHUTDOWN);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Sending SHUTDOWN message failed: %d. Halting core anyway.\n", ret);
>> +	} else {
>> +		ret = wait_for_completion_timeout(&kproc->shutdown_complete,
>> +						  msecs_to_jiffies(1000));
>> +		if (ret == 0) {
>> +			dev_err(dev, "Timeout waiting SHUTDOWN_ACK message. Halting core anyway.\n");
>> +		} else {
>> +			ret = readx_poll_timeout(k3_r5_is_core_in_wfi, core,
>> +						 wfi, wfi, 200, 2000);
>> +			if (ret)
>> +				dev_err(dev, "Timeout waiting for remote proc to be in WFI state. Halting core anyway.\n");
>> +		}
>> +	}
>> +
>>   	/* halt all applicable cores */
>>   	if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
>>   		list_for_each_entry(core, &cluster->cores, elem) {
>> @@ -1410,6 +1449,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>>   			goto err_config;
>>   		}
>>   
>> +		init_completion(&kproc->shutdown_complete);
>>   init_rmem:
>>   		k3_r5_adjust_tcm_sizes(kproc);
>>   

