Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A35C4707F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 03:32:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 329EE61358
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 03:32:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235256AbhE1DeH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 27 May 2021 23:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234572AbhE1DeG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 27 May 2021 23:34:06 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58290C06174A
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 May 2021 20:32:32 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id s19so2952919oic.7
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 May 2021 20:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3Fa2jy8yX6Y9//jDKby4w2PCFKCMWnCIRM/WY57Y/ic=;
        b=WiEv6Y9DEO4LdrSTKARHhL7/Fh9VuxPoB9zh+h+WJpobTgH/gWgm2suBa5zkujAyzm
         I4M02nqfMtB1ow+4LPmxdvOHj4ldOLRuv/l8jT4JKTzPq/Cu6BAg8zh+slYMJi4D136Y
         fN52BXTsA4Mbw/YmfNet71Lop8PJsrRPmqiRA7tuUOhSBZbrcSQ097LIHhme7ABbzL3Y
         2oJ/3PJRxJidScIzATdJrv7SoADN8wC+l57Ls9ME22uVsKl6BRdj9mgtvz1PqSUKWk6F
         l9c1UTE6gxX1zW9+Sl96V+Aae0Y47qGEB8Wg6YkrgEbXoKcGZJMyr7iHTq3L0pDf4F+N
         GvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3Fa2jy8yX6Y9//jDKby4w2PCFKCMWnCIRM/WY57Y/ic=;
        b=KNeFxuetdBI2z/R9bKjYH5o1HqCQ+Wmyi6YQuvwuPuXTMbSxpN67oSPPq2CPVz0HSI
         k486MSR01WLUZ9JzM3pdgj0voJUNzyFc3tdSWnNnCqbGfuqNKXvrFqOO7+C4CuZFa4Yy
         2+kRbUk7/C0zmDHm1jbkvM3tfHd9ybTQBNDUua2M4zVT5AabL+lZs9qdJNNPYaKkEQoq
         ic8KD7zEvHD6nU+wKsrmRaEeg91xFv2DiB+xafcFeDVofIim6f4nQnGowRhJ/ZIpA7Ve
         Em663aeFnENyA2yoppRsvHK0paKtwO1/Y+pgUt6WAB19GIwtDdYGrP6jjumM7Crp2y8e
         MSUQ==
X-Gm-Message-State: AOAM532S7BcsCa2jVCO1cOOOgKSay4tJcPVHXFu5vCCFTWanZf2Wc7Jt
        cCozN3SFqouLIXbLTxueaP4McQ==
X-Google-Smtp-Source: ABdhPJxLk077pGQhaaeD9/8M/me0QFevtgBQWLGW846CCuOaB9YH7SCE5WGb6QPfgHXdX95bk4lLsw==
X-Received: by 2002:aca:cf09:: with SMTP id f9mr4594558oig.37.1622172751569;
        Thu, 27 May 2021 20:32:31 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m189sm874267oif.45.2021.05.27.20.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 20:32:31 -0700 (PDT)
Date:   Thu, 27 May 2021 22:32:29 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     clew@codeaurora.org, sibis@codeaurora.org,
        manivannan.sadhasivam@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH V3 1/2] soc: qcom: aoss: Expose send for generic usecase
Message-ID: <YLBkTYotj9sDXv+h@builder.lan>
References: <1620320818-2206-1-git-send-email-deesin@codeaurora.org>
 <1620320818-2206-2-git-send-email-deesin@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1620320818-2206-2-git-send-email-deesin@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 06 May 12:06 CDT 2021, Deepak Kumar Singh wrote:

> Not all upcoming usecases will have an interface to allow the aoss
> driver to hook onto. Expose the send api and create a get function to
> enable drivers to send their own messages to aoss.
> 
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/soc/qcom/qcom_aoss.c       | 70 ++++++++++++++++++++++++++++++++++++--
>  include/linux/soc/qcom/qcom_aoss.h | 33 ++++++++++++++++++
>  2 files changed, 101 insertions(+), 2 deletions(-)
>  create mode 100644 include/linux/soc/qcom/qcom_aoss.h
> 
> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
> index 53acb94..cd75d4d 100644
> --- a/drivers/soc/qcom/qcom_aoss.c
> +++ b/drivers/soc/qcom/qcom_aoss.c
> @@ -8,10 +8,12 @@
>  #include <linux/io.h>
>  #include <linux/mailbox_client.h>
>  #include <linux/module.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/thermal.h>
>  #include <linux/slab.h>
> +#include <linux/soc/qcom/qcom_aoss.h>
>  
>  #define QMP_DESC_MAGIC			0x0
>  #define QMP_DESC_VERSION		0x4
> @@ -61,6 +63,7 @@ struct qmp_cooling_device {
>   * @mbox_chan: mailbox channel used to ring the doorbell on transmit
>   * @offset: offset within @msgram where messages should be written
>   * @size: maximum size of the messages to be transmitted
> + * @orphan: tarcks whether qmp handle is valid
>   * @event: wait_queue for synchronization with the IRQ
>   * @tx_lock: provides synchronization between multiple callers of qmp_send()
>   * @qdss_clk: QDSS clock hw struct
> @@ -76,6 +79,8 @@ struct qmp {
>  
>  	size_t offset;
>  	size_t size;
> +	atomic_t  orphan;
> +	struct kref refcount;
>  
>  	wait_queue_head_t event;
>  
> @@ -223,11 +228,17 @@ static bool qmp_message_empty(struct qmp *qmp)
>   *
>   * Return: 0 on success, negative errno on failure
>   */
> -static int qmp_send(struct qmp *qmp, const void *data, size_t len)
> +int qmp_send(struct qmp *qmp, const void *data, size_t len)
>  {
>  	long time_left;
>  	int ret;
>  
> +	if (WARN_ON(IS_ERR_OR_NULL(qmp) || !data))
> +		return -EINVAL;
> +
> +	if (atomic_read(&qmp->orphan))
> +		return -EINVAL;
> +
>  	if (WARN_ON(len + sizeof(u32) > qmp->size))
>  		return -EINVAL;
>  
> @@ -261,6 +272,7 @@ static int qmp_send(struct qmp *qmp, const void *data, size_t len)
>  
>  	return ret;
>  }
> +EXPORT_SYMBOL(qmp_send);
>  
>  static int qmp_qdss_clk_prepare(struct clk_hw *hw)
>  {
> @@ -515,6 +527,54 @@ static void qmp_cooling_devices_remove(struct qmp *qmp)
>  		thermal_cooling_device_unregister(qmp->cooling_devs[i].cdev);
>  }
>  
> +/**
> + * qmp_get() - get a qmp handle from a device
> + * @dev: client device pointer
> + *
> + * Return: handle to qmp device on success, ERR_PTR() on failure
> + */
> +struct qmp *qmp_get(struct device *dev)
> +{
> +	struct platform_device *pdev;
> +	struct device_node *np;
> +	struct qmp *qmp;
> +
> +	if (!dev || !dev->of_node)
> +		return ERR_PTR(-EINVAL);
> +
> +	np = of_parse_phandle(dev->of_node, "qcom,qmp", 0);
> +	if (!np)
> +		return ERR_PTR(-ENODEV);
> +
> +	pdev = of_find_device_by_node(np);
> +	of_node_put(np);
> +	if (!pdev)
> +		return ERR_PTR(-EINVAL);
> +
> +	qmp = platform_get_drvdata(pdev);
> +	platform_device_put(pdev);
> +
> +	if (qmp)
> +		kref_get(&qmp->refcount);
> +
> +	return qmp ? qmp : ERR_PTR(-EPROBE_DEFER);
> +}
> +EXPORT_SYMBOL(qmp_get);
> +
> +static void qmp_handle_release(struct kref *ref)
> +{
> +	struct qmp *qmp = container_of(ref, struct qmp, refcount);
> +
> +	kfree(qmp);
> +}
> +
> +void qmp_put(struct qmp *qmp)
> +{
> +	if (!IS_ERR_OR_NULL(qmp))
> +		kref_put(&qmp->refcount, qmp_handle_release);
> +}
> +EXPORT_SYMBOL(qmp_put);
> +
>  static int qmp_probe(struct platform_device *pdev)
>  {
>  	struct resource *res;
> @@ -522,13 +582,14 @@ static int qmp_probe(struct platform_device *pdev)
>  	int irq;
>  	int ret;
>  
> -	qmp = devm_kzalloc(&pdev->dev, sizeof(*qmp), GFP_KERNEL);
> +	qmp = kzalloc(sizeof(*qmp), GFP_KERNEL);
>  	if (!qmp)
>  		return -ENOMEM;
>  
>  	qmp->dev = &pdev->dev;
>  	init_waitqueue_head(&qmp->event);
>  	mutex_init(&qmp->tx_lock);
> +	kref_init(&qmp->refcount);
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	qmp->msgram = devm_ioremap_resource(&pdev->dev, res);
> @@ -569,6 +630,8 @@ static int qmp_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, qmp);
>  
> +	atomic_set(&qmp->orphan, 0);
> +
>  	return 0;
>  
>  err_remove_qdss_clk:
> @@ -577,6 +640,7 @@ static int qmp_probe(struct platform_device *pdev)
>  	qmp_close(qmp);
>  err_free_mbox:
>  	mbox_free_channel(qmp->mbox_chan);
> +	kfree(qmp);
>  
>  	return ret;
>  }
> @@ -590,7 +654,9 @@ static int qmp_remove(struct platform_device *pdev)
>  	qmp_cooling_devices_remove(qmp);
>  
>  	qmp_close(qmp);
> +	atomic_set(&qmp->orphan, 1);
>  	mbox_free_channel(qmp->mbox_chan);
> +	kref_put(&qmp->refcount, qmp_handle_release);
>  
>  	return 0;
>  }
> diff --git a/include/linux/soc/qcom/qcom_aoss.h b/include/linux/soc/qcom/qcom_aoss.h
> new file mode 100644
> index 0000000..27d00f7
> --- /dev/null
> +++ b/include/linux/soc/qcom/qcom_aoss.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef __QCOM_AOSS_H__
> +#define __QCOM_AOSS_H__
> +
> +#include <linux/err.h>
> +#include <linux/device.h>
> +
> +struct qmp;
> +
> +#if IS_ENABLED(CONFIG_QCOM_AOSS_QMP)
> +
> +int qmp_send(struct qmp *qmp, const void *data, size_t len);
> +struct qmp *qmp_get(struct device *dev);
> +
> +#else
> +
> +static inline int qmp_send(struct qmp *qmp, const void *data, size_t len)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline struct qmp *qmp_get(struct device *dev)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +
> +#endif
> +
> +#endif
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
