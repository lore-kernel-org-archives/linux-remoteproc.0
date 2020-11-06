Return-Path: <SRS0=mBHI=EM=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B2CC2D0A3
	for <linux-remoteproc@archiver.kernel.org>; Fri,  6 Nov 2020 14:38:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 789DE20724
	for <linux-remoteproc@archiver.kernel.org>; Fri,  6 Nov 2020 14:38:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="OiDWl6V/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgKFOi1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 6 Nov 2020 09:38:27 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:55032 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726565AbgKFOi1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 6 Nov 2020 09:38:27 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A6EcF26012629;
        Fri, 6 Nov 2020 15:38:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=+b761LFxJazt1pUgC6nQPmwmElECpWy5fu8tpIJttyM=;
 b=OiDWl6V/CMWAnOw2NuFkv4bClLJRmWWxgt1v2Lk8P9VMEDP0MWmFa0AQ250g9uloYRjh
 AHhFMtvImZr2iXy+yauns7/vtTJFUY3c24ruSwrope8Y5Rlrk45tkcMX2jHnGhvDpbCf
 3MSWEb6RrWFJHZkN2FYrF6H3e2TN8FbB1KlbXg+074I7InR0+Mn34BVgSczFXirXkckO
 5Dpp2Q27eZAi35RwoW9ayqh7rjhRAniV2HPl5L9ndw7EFO4GAzer6iqEGlKAmPAj8Hz3
 3fyADC4rswX1/SFcgSaAoQbiFR0QauwcOgXenBD/yTRi9VhLT+2dkQO1tUor9QSPc0Fk 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34gywrey3c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 06 Nov 2020 15:38:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6102610002A;
        Fri,  6 Nov 2020 15:38:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 57F842AD2D8;
        Fri,  6 Nov 2020 15:38:23 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.46) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov
 2020 15:38:22 +0100
Subject: Re: [RFC v2 13/14] remoteproc: Add automation flags
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
 <20201030195713.1366341-14-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <ca654d20-298a-d145-f76c-227fc8d4af5b@st.com>
Date:   Fri, 6 Nov 2020 15:38:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201030195713.1366341-14-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-06_06:2020-11-05,2020-11-06 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

I applied your series on my branch to start the review and test it.
Compiler(W=1) complains and highlights an issue.

Please find comment below.

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

copy/past issue :)
rproc->autonomous_on_remote_crash = remote_crash;

Regards,
Arnaud

> +}
> +
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
