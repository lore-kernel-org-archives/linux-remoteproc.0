Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6A1C433FE
	for <linux-remoteproc@archiver.kernel.org>; Wed,  9 Dec 2020 10:14:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E00823B5D
	for <linux-remoteproc@archiver.kernel.org>; Wed,  9 Dec 2020 10:14:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729070AbgLIKN4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 9 Dec 2020 05:13:56 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:6928 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728431AbgLIKN4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 9 Dec 2020 05:13:56 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0B9AClWk009048;
        Wed, 9 Dec 2020 11:13:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=ckVdQxkzfe4t26PlLZnuSFm/03XQ2nWSxAMRZwLnLGY=;
 b=xC9sPXoPO6yV2AZ2b7/sD7AAP6NEcHY4oK/FWmstxvBfNvK4VYCoLvC2cE9/e96Lv60A
 XNf5dBbf3ej7VAg/e3C6WJQWBxRr4uiRK4QcGFRNdlcqS/B6YXkOmr/Bjx3PSMaIwOCl
 B4DRE041KfDKfwuBnZ5rHkFhiRsRj357/Vfi+cI14UlfHweWgSsgbGbv++KUC7nMkbHx
 HL76BAZisEXTOxRdDtVb/Tqt05BqhQXtT5/iczLMBeiSK0sbeI9twVDRolVzhMy3mm2q
 tU6x3QQRDVXKI6dqhjit7wcDrA9Y0Hq20DHljxQSIPWxBHgc2WR8vgJvnQn7txkEvW3u CA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 35agt93qed-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Dec 2020 11:13:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 43CD010002A;
        Wed,  9 Dec 2020 11:13:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 29F5524A9B1;
        Wed,  9 Dec 2020 11:13:09 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.46) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 9 Dec
 2020 11:13:08 +0100
Subject: Re: [PATCH v3 15/15] remoteproc: Refactor rproc delete and cdev
 release path
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201126210642.897302-1-mathieu.poirier@linaro.org>
 <20201126210642.897302-16-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <00422e08-3acc-1e5e-3d1d-f9c332256a1f@st.com>
Date:   Wed, 9 Dec 2020 11:13:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201126210642.897302-16-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-09_08:2020-12-09,2020-12-09 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 11/26/20 10:06 PM, Mathieu Poirier wrote:
> Refactor function rproc_del() and rproc_cdev_release() to take
> into account the policy specified in the device tree.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_cdev.c | 13 +++++++++++-
>  drivers/remoteproc/remoteproc_core.c | 30 ++++++++++++++++++++++++++--
>  include/linux/remoteproc.h           |  4 ++++
>  3 files changed, 44 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
> index f7645f289563..3dfe555dfc07 100644
> --- a/drivers/remoteproc/remoteproc_cdev.c
> +++ b/drivers/remoteproc/remoteproc_cdev.c
> @@ -88,7 +88,18 @@ static int rproc_cdev_release(struct inode *inode, struct file *filp)
>  {
>  	struct rproc *rproc = container_of(inode->i_cdev, struct rproc, cdev);
>  
> -	if (rproc->cdev_put_on_release && rproc->state == RPROC_RUNNING)
> +	if (!rproc->cdev_put_on_release)
> +		return 0;
> +
> +	/*
> +	 * The application has crashed or is releasing its file handle.  Detach
> +	 * or shutdown the remote processor based on the policy specified in the
> +	 * DT.  No need to check rproc->state right away, it will be done
> +	 * in either rproc_detach() or rproc_shutdown().
> +	 */
> +	if (rproc->autonomous_on_core_shutdown)
> +		rproc_detach(rproc);
> +	else
>  		rproc_shutdown(rproc);

A reason to not propagate the return of functions?

>  
>  	return 0;
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 3d7d245edc4e..1a170103bf27 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2294,6 +2294,22 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
>  	return 0;
>  }
>  
> +static void rproc_set_automation_flags(struct rproc *rproc)
> +{
> +	struct device *dev = rproc->dev.parent;
> +	struct device_node *np = dev->of_node;
> +	bool core_shutdown;
> +
> +	/*
> +	 * When function rproc_cdev_release() or rproc_del() are called and
> +	 * the remote processor has been attached to, it will be detached from
> +	 * (rather than turned off) if "autonomous-on-core-shutdown is specified
> +	 * in the DT.
> +	 */
> +	core_shutdown = of_property_read_bool(np, "autonomous-on-core-shutdown");
> +	rproc->autonomous_on_core_shutdown = core_shutdown;
> +}
> +
>  /**
>   * rproc_alloc() - allocate a remote processor handle
>   * @dev: the underlying device
> @@ -2352,6 +2368,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	if (rproc_alloc_ops(rproc, ops))
>  		goto put_device;
>  
> +	rproc_set_automation_flags(rproc);
> +
>  	/* Assign a unique device index and name */
>  	rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
>  	if (rproc->index < 0) {
> @@ -2435,8 +2453,16 @@ int rproc_del(struct rproc *rproc)
>  	if (!rproc)
>  		return -EINVAL;
>  
> -	/* TODO: make sure this works with rproc->power > 1 */
> -	rproc_shutdown(rproc);
> +	/*
> +	 * TODO: make sure this works with rproc->power > 1
> +	 *
> +	 * No need to check rproc->state right away, it will be done in either
> +	 * rproc_detach() or rproc_shutdown().
> +	 */
> +	if (rproc->autonomous_on_core_shutdown)
> +		rproc_detach(rproc);
> +	else
> +		rproc_shutdown(rproc);

same here

>  
>  	mutex_lock(&rproc->lock);
>  	rproc->state = RPROC_DELETED;
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 02312096d59f..5702f630d810 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -516,6 +516,9 @@ struct rproc_dump_segment {
>   * @nb_vdev: number of vdev currently handled by rproc
>   * @char_dev: character device of the rproc
>   * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
> + * @autonomous_on_core_shutdown: true if the remote processor should be detached
> + *				 from (rather than turned off) when the remoteproc
> + *				 core goes away.
>   */
>  struct rproc {
>  	struct list_head node;
> @@ -554,6 +557,7 @@ struct rproc {
>  	u16 elf_machine;
>  	struct cdev cdev;
>  	bool cdev_put_on_release;
> +	bool autonomous_on_core_shutdown;
>  };
>  
>  /**
> 
