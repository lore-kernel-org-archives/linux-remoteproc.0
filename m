Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032FC7710F;
	Fri, 28 Jun 2024 22:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719615076; cv=none; b=LpI6eA9rxjJaT32psdhQC9T9ko/X62NOGVEwWeBYqjpXSz2qi0IMeFc8DIYrqF5t6U/8pSZ+14KukI5dUTvPA7GyUoxpbmueiKc7NDcC9B94UJphT9owMEGVM+wrc+Sx/MzYDrsdLBWy51tiL1hWQxL22m62wMi53WQp8E2sQeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719615076; c=relaxed/simple;
	bh=pA5C/H6YxUiV2vdWADKr9YMpQnjgZDOv/o6WNDTL2Ss=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=R+RYc2k+A2DBjN+mH+QticWeBckFh1hPAu+iRqfoSh5ucsnNIuwobUDbCTdtqA6t/e6PEA7BmBGLIh93c5xA2Mmp3UEFuvFelRvhnMdaefUj15JqibLXbdIU3FouP7wWLagc3GxiJdmKPPAXSpsViB+Fa5+vVY8aBU9tk7jWn7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vO3HjLKD; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vO3HjLKD"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45SMorVO111278;
	Fri, 28 Jun 2024 17:50:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719615053;
	bh=2R9YT7rCyPZ2fpTOPR5YigBlSmeQiT0rxfvaoKX+Hu4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vO3HjLKDhQtpQfzNc+GP8whnUU2v0I/wHMxRFhYXIGXQNPugRZ7rAg0cDou/o482W
	 l7iTkiKWASYuMyaKZUhZ/7SuY/CjwUSXhygNf65UgoWY1FMfU9AtIty0R6v7W8S1Mv
	 xv0sq+HfFcS/8N8v13KjlwiTifVNxqQL3n8ZOH6s=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45SMor0v051001
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Jun 2024 17:50:53 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Jun 2024 17:50:53 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Jun 2024 17:50:52 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45SMoqf2091085;
	Fri, 28 Jun 2024 17:50:52 -0500
Message-ID: <33d97f00-dd9a-4643-8210-859c2ab38a97@ti.com>
Date: Fri, 28 Jun 2024 17:50:52 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] remoteproc: k3-r5: support for graceful stop of
 remote cores
To: Richard Genoud <richard.genoud@bootlin.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Suman Anna <s-anna@ti.com>,
        Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Udit Kumar <u-kumar1@ti.com>,
        Thomas Richard
	<thomas.richard@bootlin.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Hari Nagalla <hnagalla@ti.com>,
        =?UTF-8?Q?Th=C3=A9o_Lebrun?=
	<theo.lebrun@bootlin.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240621150058.319524-1-richard.genoud@bootlin.com>
 <20240621150058.319524-5-richard.genoud@bootlin.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20240621150058.319524-5-richard.genoud@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 6/21/24 10:00 AM, Richard Genoud wrote:
> Introduce software IPC handshake between the K3-R5 remote proc driver
> and the R5 MCU to gracefully stop/reset the remote core.
> 
> Upon a stop request, K3-R5 remote proc driver sends a RP_MBOX_SHUTDOWN
> mailbox message to the remote R5 core.
> The remote core is expected to:
> - relinquish all the resources acquired through Device Manager (DM)
> - disable its interrupts
> - send back a mailbox acknowledgment RP_MBOX_SHUDOWN_ACK
> - enter WFI state.
> 
> Meanwhile, the K3-R5 remote proc driver does:
> - wait for the RP_MBOX_SHUTDOWN_ACK from the remote core
> - wait for the remote proc to enter WFI state
> - reset the remote core through device manager
> 
> Based on work from: Hari Nagalla <hnagalla@ti.com>
> 
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---
>   drivers/remoteproc/omap_remoteproc.h     |  9 +++++-
>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 40 ++++++++++++++++++++++++
>   2 files changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.h b/drivers/remoteproc/omap_remoteproc.h
> index 828e13256c02..c008f11fa2a4 100644
> --- a/drivers/remoteproc/omap_remoteproc.h
> +++ b/drivers/remoteproc/omap_remoteproc.h
> @@ -42,6 +42,11 @@
>    * @RP_MBOX_SUSPEND_CANCEL: a cancel suspend response from a remote processor
>    * on a suspend request
>    *
> + * @RP_MBOX_SHUTDOWN: shutdown request for the remote processor
> + *
> + * @RP_MBOX_SHUTDOWN_ACK: successful response from remote processor for a
> + * shutdown request. The remote processor should be in WFI state short after.
> + *
>    * Introduce new message definitions if any here.
>    *
>    * @RP_MBOX_END_MSG: Indicates end of known/defined messages from remote core
> @@ -59,7 +64,9 @@ enum omap_rp_mbox_messages {
>   	RP_MBOX_SUSPEND_SYSTEM	= 0xFFFFFF11,
>   	RP_MBOX_SUSPEND_ACK	= 0xFFFFFF12,
>   	RP_MBOX_SUSPEND_CANCEL	= 0xFFFFFF13,
> -	RP_MBOX_END_MSG		= 0xFFFFFF14,
> +	RP_MBOX_SHUTDOWN	= 0xFFFFFF14,
> +	RP_MBOX_SHUTDOWN_ACK	= 0xFFFFFF15,
> +	RP_MBOX_END_MSG		= 0xFFFFFF16,
>   };
>   
>   #endif /* _OMAP_RPMSG_H */
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index a2ead87952c7..918a15e1dd9a 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -21,6 +21,7 @@
>   #include <linux/pm_runtime.h>
>   #include <linux/remoteproc.h>
>   #include <linux/suspend.h>
> +#include <linux/iopoll.h>
>   #include <linux/reset.h>
>   #include <linux/slab.h>
>   
> @@ -172,8 +173,23 @@ struct k3_r5_rproc {
>   	struct k3_r5_core *core;
>   	struct k3_r5_mem *rmem;
>   	int num_rmems;
> +	struct completion shutdown_complete;
>   };
>   
> +/*
> + * This will return true if the remote core is in Wait For Interrupt state.
> + */
> +static bool k3_r5_is_core_in_wfi(struct k3_r5_core *core)
> +{
> +	int ret;
> +	u64 boot_vec;
> +	u32 cfg, ctrl, stat;
> +
> +	ret = ti_sci_proc_get_status(core->tsp, &boot_vec, &cfg, &ctrl, &stat);
> +
> +	return !ret ? !!(stat & PROC_BOOT_STATUS_FLAG_R5_WFI) : false;

Too fancy for me :) Just return if (ret) right after get_status().

Looks like this function is called in a polling loop, if
ti_sci_proc_get_status() fails once, it won't get better,
no need to keep checking, we should just error out of
the polling loop.

Andrew

> +}
> +
>   /**
>    * k3_r5_rproc_mbox_callback() - inbound mailbox message handler
>    * @client: mailbox client pointer used for requesting the mailbox channel
> @@ -209,6 +225,10 @@ static void k3_r5_rproc_mbox_callback(struct mbox_client *client, void *data)
>   	case RP_MBOX_ECHO_REPLY:
>   		dev_info(dev, "received echo reply from %s\n", name);
>   		break;
> +	case RP_MBOX_SHUTDOWN_ACK:
> +		dev_dbg(dev, "received shutdown_ack from %s\n", name);
> +		complete(&kproc->shutdown_complete);
> +		break;
>   	default:
>   		/* silently handle all other valid messages */
>   		if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
> @@ -634,6 +654,7 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>   	struct k3_r5_cluster *cluster = kproc->cluster;
>   	struct device *dev = kproc->dev;
>   	struct k3_r5_core *core1, *core = kproc->core;
> +	bool wfi;
>   	int ret;
>   
>   
> @@ -650,6 +671,24 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>   		}
>   	}
>   
> +	/* Send SHUTDOWN message to remote proc */
> +	reinit_completion(&kproc->shutdown_complete);
> +	ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_SHUTDOWN);
> +	if (ret < 0) {
> +		dev_err(dev, "Sending SHUTDOWN message failed: %d. Halting core anyway.\n", ret);
> +	} else {
> +		ret = wait_for_completion_timeout(&kproc->shutdown_complete,
> +						  msecs_to_jiffies(1000));
> +		if (ret == 0) {
> +			dev_err(dev, "Timeout waiting SHUTDOWN_ACK message. Halting core anyway.\n");
> +		} else {
> +			ret = readx_poll_timeout(k3_r5_is_core_in_wfi, core,
> +						 wfi, wfi, 200, 2000);
> +			if (ret)
> +				dev_err(dev, "Timeout waiting for remote proc to be in WFI state. Halting core anyway.\n");
> +		}
> +	}
> +
>   	/* halt all applicable cores */
>   	if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
>   		list_for_each_entry(core, &cluster->cores, elem) {
> @@ -1410,6 +1449,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>   			goto err_config;
>   		}
>   
> +		init_completion(&kproc->shutdown_complete);
>   init_rmem:
>   		k3_r5_adjust_tcm_sizes(kproc);
>   
> 
