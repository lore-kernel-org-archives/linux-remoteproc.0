Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B95C433E0
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Jan 2021 08:59:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E8CF20756
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Jan 2021 08:59:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233964AbhA0I7G (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 27 Jan 2021 03:59:06 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:51862 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233570AbhA0I46 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 Jan 2021 03:56:58 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 10R8pxF6026909;
        Wed, 27 Jan 2021 09:56:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=6+HB90kOCK0S2K93nap8waW8N0J4nhwfAdTfa4drhiQ=;
 b=IXRlp9gGOFa4kP63YUkh98fPp3+TmOHEFUe7YYdTM7O/9Zdhco5TYwcKgeHCGdZLI+Lp
 smtJdK6Aj/o1jR0ZzbdH+8cDEmLJe2P2bTl0fsXOeytDv4YUOWBreK7uEYOgHiSWExYF
 ixKmKiefqJXqXC0nTwiYzYt7c1A9zIaJBz82js4PStHAb6Yo1mw60v4HWNCP6y50jt1C
 eRVkMvuhq+rJJ0Lm+ylOteXwg4hC1WExS69IbZ14k0fgvjT5NQ8mDg1AGHotmDAao0g/
 wc7aJRc26//g/fBwI2G/Cniv7iAxet2+LHv9/oI23kwzFqZIgEOM/ZyYHKdh6GpSqPU5 tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 368c15xc64-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jan 2021 09:56:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0307010002A;
        Wed, 27 Jan 2021 09:56:12 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E34BE21FE81;
        Wed, 27 Jan 2021 09:56:11 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.45) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Jan
 2021 09:56:11 +0100
Subject: Re: [PATCH v4 17/17] remoteproc: Refactor rproc delete and cdev
 release path
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
 <20201218173228.2277032-18-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <1c8a1395-8621-31ab-3ded-768bc83e6f9f@st.com>
Date:   Wed, 27 Jan 2021 09:56:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218173228.2277032-18-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-27_03:2021-01-26,2021-01-27 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


look good to me
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

On 12/18/20 6:32 PM, Mathieu Poirier wrote:
> Refactor function rproc_del() and rproc_cdev_release() to take
> into account the policy specified in the device tree.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_cdev.c | 18 +++++++++++---
>  drivers/remoteproc/remoteproc_core.c | 36 ++++++++++++++++++++++++----
>  include/linux/remoteproc.h           |  4 ++++
>  3 files changed, 51 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
> index f7645f289563..9b2fb6fbf8e7 100644
> --- a/drivers/remoteproc/remoteproc_cdev.c
> +++ b/drivers/remoteproc/remoteproc_cdev.c
> @@ -87,11 +87,23 @@ static long rproc_device_ioctl(struct file *filp, unsigned int ioctl, unsigned l
>  static int rproc_cdev_release(struct inode *inode, struct file *filp)
>  {
>  	struct rproc *rproc = container_of(inode->i_cdev, struct rproc, cdev);
> +	int ret;
>  
> -	if (rproc->cdev_put_on_release && rproc->state == RPROC_RUNNING)
> -		rproc_shutdown(rproc);
> +	if (!rproc->cdev_put_on_release)
> +		return 0;
>  
> -	return 0;
> +	/*
> +	 * The application has crashed or is releasing its file handle.  Detach
> +	 * or shutdown the remote processor based on the policy specified in the
> +	 * DT.  No need to check rproc->state right away, it will be done
> +	 * in either rproc_detach() or rproc_shutdown().
> +	 */
> +	if (rproc->autonomous_on_core_shutdown)
> +		ret = rproc_detach(rproc);
> +	else
> +		ret = rproc_shutdown(rproc);
> +
> +	return ret;
>  }
>  
>  static const struct file_operations rproc_fops = {
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 2fe42ac7ca89..9f47a4ec0ec6 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2254,6 +2254,22 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
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
> @@ -2312,6 +2328,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	if (rproc_alloc_ops(rproc, ops))
>  		goto put_device;
>  
> +	rproc_set_automation_flags(rproc);
> +
>  	/* Assign a unique device index and name */
>  	rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
>  	if (rproc->index < 0) {
> @@ -2388,15 +2406,25 @@ EXPORT_SYMBOL(rproc_put);
>   * of the outstanding reference created by rproc_alloc. To decrement that
>   * one last refcount, one still needs to call rproc_free().
>   *
> - * Returns 0 on success and -EINVAL if @rproc isn't valid.
> + * Returns 0 on success and a negative error code on failure.
>   */
>  int rproc_del(struct rproc *rproc)
>  {
> +	int ret;
> +
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
> +		ret = rproc_detach(rproc);
> +	else
> +		ret = rproc_shutdown(rproc);
>  
>  	mutex_lock(&rproc->lock);
>  	rproc->state = RPROC_DELETED;
> @@ -2415,7 +2443,7 @@ int rproc_del(struct rproc *rproc)
>  
>  	device_del(&rproc->dev);
>  
> -	return 0;
> +	return ret;
>  }
>  EXPORT_SYMBOL(rproc_del);
>  
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index aa5bceb72015..012bebbd324b 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -519,6 +519,9 @@ struct rproc_dump_segment {
>   * @nb_vdev: number of vdev currently handled by rproc
>   * @char_dev: character device of the rproc
>   * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
> + * @autonomous_on_core_shutdown: true if the remote processor should be detached
> + *				 from (rather than turned off) when the remoteproc
> + *				 core goes away.
>   */
>  struct rproc {
>  	struct list_head node;
> @@ -557,6 +560,7 @@ struct rproc {
>  	u16 elf_machine;
>  	struct cdev cdev;
>  	bool cdev_put_on_release;
> +	bool autonomous_on_core_shutdown;
>  };
>  
>  /**
> 
