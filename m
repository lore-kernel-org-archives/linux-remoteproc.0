Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F20C388F7
	for <linux-remoteproc@archiver.kernel.org>; Thu, 12 Nov 2020 13:56:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C07120936
	for <linux-remoteproc@archiver.kernel.org>; Thu, 12 Nov 2020 13:56:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="GugvL+P8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbgKLN4c (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 12 Nov 2020 08:56:32 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:5790 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727796AbgKLN4a (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Nov 2020 08:56:30 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0ACDq6cT026833;
        Thu, 12 Nov 2020 14:56:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : subject : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=3b/CjCuOeBh9Ynq6BHd0Jn8CCpAGLxoDNDuw/Rwj1IU=;
 b=GugvL+P8pwFSZKG9pZkVp1Rjt4bL3AX/0h75dQDIeETDxm0eBYN7MFosNnqc1ceu+5Yz
 ILsOuY2r8pjF6/1BADIj5gTHB62rFVturkZaYlxJPFU/6aw7jY1V/6Cfb7uVohLL/N32
 L767HMimIKmdcxp8JlLFx2N8licwKd4k4PFDgR2inn9ireBh3A6TaHM0K7KSvCvBNm5O
 TXDVMNoy2f+UOZFfY/9UjsckDxGrusRoC4ZnPM5UpGqyewpZ8qFD2+LiXucH/T2gbGw4
 b0BJ9E+bwLz0+Dv/yIGjPDB6okRUxXOR3no7PVQuOTdVB72IsxnoMennRguzrcZemqE1 ZA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34nhkd65d1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 12 Nov 2020 14:56:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C582B10002A;
        Thu, 12 Nov 2020 14:56:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B5CE72607AA;
        Thu, 12 Nov 2020 14:56:21 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 12 Nov
 2020 14:56:21 +0100
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Subject: Re: [RFC v2 13/14] remoteproc: Add automation flags
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
 <20201030195713.1366341-14-mathieu.poirier@linaro.org>
Message-ID: <498ebbb1-3a27-fe48-576c-25a0856f82f4@st.com>
Date:   Thu, 12 Nov 2020 14:56:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201030195713.1366341-14-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-12_05:2020-11-12,2020-11-12 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

Thanks for initiating the discussion!

Waiting feedback from other, please find my feedback on our proposal below.

On 10/30/20 8:57 PM, Mathieu Poirier wrote:
> Adding flags to dictate how to handle a platform driver being removed
> or the remote processor crashing while in RPROC_ATTACHED state.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 25 +++++++++++++++++++++++++
>  include/linux/remoteproc.h           |  5 +++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 229fa2cad0bd..d024367c63e5 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2227,6 +2227,29 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
>  	return 0;
>  }
>  
> +static void rproc_set_automation_flags(struct rproc *rproc)
> +{
> +	struct device *dev = rproc->dev.parent;
> +	struct device_node *np = dev->of_node;
> +	bool core_reboot, remote_crash;
> +
> +	/*
> +	 * When function rproc_cdev_release() or rproc_del() are called and
> +	 * the remote processor has been attached to, it will be detached from
> +	 * (rather than turned off) if "autonomous_on_core_reboot" is specified
> +	 * in the DT.
> +	 */
> +	core_reboot = of_property_read_bool(np, "autonomous_on_core_reboot");
> +	rproc->autonomous_on_core_reboot = core_reboot;
> +
> +	/*
> +	 * When the remote processor crashes it will be detached from, and
> +	 * attached to, if "autonomous_on_remote_crash" is specified in the DT.
> +	 */
> +	remote_crash = of_property_read_bool(np, "autonomous_on_remote_crash");
> +	rproc->autonomous_on_core_reboot = core_reboot;
> +}
> +

I wonder if the naming is not too restrictive.

I think here we probably need first to identify the use cases we want to support
to determine which use cases should be addressed and deduce DT fields.

Please find my view below:

1) Attach to a remote processor on boot.
This is the "attach" you introduced in a previous series. I wonder here if a DT
field should not be introduce for platform which are not able to dynamically
determines the remote processor state. Something like "remote-boot-on" or
"autonomous-boot-on".

2) Detach from a remote processor on Linux kernel shutdown
Two possible actions: shutdown the remote processor or detach from it.
A DT field could be used to determine the expected behavior.

3) Linux core reboot on crash
Two possible actions: shutdown and restart the remote processor or
detach/re-attach from/to it.
Is same DT field than 2) can be used for this . Or should be determine by a
new sysfs recovery option [1]?

[1]
https://elixir.bootlin.com/linux/v5.10-rc2/source/drivers/remoteproc/remoteproc_sysfs.c#L45

4) The remote processor need to reboot on crash.
3 possible actions:
 - shutdown and restart the remote processor
 - detach and re-attach from/to it.
 - Just shutdown, as no recovery possible without a system reset.

5) Detach/re-attach on Linux suspend/resume
Perhaps better to manage this in platform drivers without a generic DT field?

If i try to apply this on the remote proc boot and shutdown sequences:

1) on remoteproc device add:
- Need to determine if the remote processor is already running:
   - started by another entity
   - Linux reboot after crash

2) On remoteproc device release.
- Need to determine if the remote processor need to be shutdown or detached:
   - Linux kernel crash
   - Linux kernel graceful shutdown with remote processor keeping ON.

3) On remote processor crash
- Need to determine if the remote processor will be restarted by an external
entity or by the remoteproc framework, or if simply not possible to recover
without a system reset.

Regarding these use cases here is an alternative proposal(inspired by regulator
framework):
- "remote-boot-on": determine on probe if the remoteproc firmware is already
booted. This field is optional, use by a platform driver which can not
determine the state of the remote processor. Could be dynamically updated by the
platform driver to manage Kernel crash...

- "remote-always-on": means that the detach has to be privileged on
shutdown. Need also to be managed by platform driver as it can be
compared to the remote processor current state.

- "remoteproc-crash-recovery": crash recovery mode:
   possible value: "SHUTDOWN", "DETACH", "DISABLED"


Regards,
Arnaud

>  /**
>   * rproc_alloc() - allocate a remote processor handle
>   * @dev: the underlying device
> @@ -2285,6 +2308,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	if (rproc_alloc_ops(rproc, ops))
>  		goto put_device;
>  
> +	rproc_set_automation_flags(rproc);
> +
>  	/* Assign a unique device index and name */
>  	rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
>  	if (rproc->index < 0) {
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 71d4d4873164..9a6e79ef35d7 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -516,6 +516,9 @@ struct rproc_dump_segment {
>   * @nb_vdev: number of vdev currently handled by rproc
>   * @char_dev: character device of the rproc
>   * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
> + * @autonomous_on_core_reboot: true if the remote processor should be detached from
> + *			       (rather than turned off) when the remoteproc core
> + *			       goes away.
>   */
>  struct rproc {
>  	struct list_head node;
> @@ -554,6 +557,8 @@ struct rproc {
>  	u16 elf_machine;
>  	struct cdev cdev;
>  	bool cdev_put_on_release;
> +	bool autonomous_on_core_reboot	: 1,
> +	     autonomous_on_remote_crash	: 1;
>  };
>  
>  /**
> 
