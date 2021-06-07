Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E16AC47082
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Jun 2021 11:42:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF5EC610C7
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Jun 2021 11:42:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbhFGLol (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 7 Jun 2021 07:44:41 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:22473 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230289AbhFGLol (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 7 Jun 2021 07:44:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623066170; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=97EjolioTr/dzk8Rhja2FM2bBWL8D1t49C3Tr8J/VBM=;
 b=iUIi9EiAuV22SEE2h2TDmiHxHIYR1qYxzfar2I1biFcDlURLLpMK2BkWkkSnxqfIZ0nDHIPN
 SuJIAw8x6oTu4SBaYIOzic4YZttQy6IBkm2D6s/UObNNVMl+cOn7jUi1m/5my+liDk7Vi3he
 kUyGpFaQXSGwWlGHqxXhfZnIsW4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60be0622f726fa41886b7a43 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 07 Jun 2021 11:42:26
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 38B9BC43460; Mon,  7 Jun 2021 11:42:25 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2C05BC433F1;
        Mon,  7 Jun 2021 11:42:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 07 Jun 2021 17:12:24 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, clew@codeaurora.org,
        manivannan.sadhasivam@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        deesin=codeaurora.org@codeaurora.org
Subject: Re: [PATCH V3 1/2] soc: qcom: aoss: Expose send for generic usecase
In-Reply-To: <1620320818-2206-2-git-send-email-deesin@codeaurora.org>
References: <1620320818-2206-1-git-send-email-deesin@codeaurora.org>
 <1620320818-2206-2-git-send-email-deesin@codeaurora.org>
Message-ID: <80c85e9a6f2ac5c3b8c77a1c9a18b9cc@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hey Deepak,

Thanks for the patch!

On 2021-05-06 22:36, Deepak Kumar Singh wrote:
> Not all upcoming usecases will have an interface to allow the aoss
> driver to hook onto. Expose the send api and create a get function to
> enable drivers to send their own messages to aoss.
> 
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> ---
>  drivers/soc/qcom/qcom_aoss.c       | 70 
> ++++++++++++++++++++++++++++++++++++--
>  include/linux/soc/qcom/qcom_aoss.h | 33 ++++++++++++++++++
>  2 files changed, 101 insertions(+), 2 deletions(-)
>  create mode 100644 include/linux/soc/qcom/qcom_aoss.h
> 
> diff --git a/drivers/soc/qcom/qcom_aoss.c 
> b/drivers/soc/qcom/qcom_aoss.c
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
>   * @tx_lock: provides synchronization between multiple callers of 
> qmp_send()
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
> @@ -261,6 +272,7 @@ static int qmp_send(struct qmp *qmp, const void
> *data, size_t len)
> 
>  	return ret;
>  }
> +EXPORT_SYMBOL(qmp_send);
> 
>  static int qmp_qdss_clk_prepare(struct clk_hw *hw)
>  {
> @@ -515,6 +527,54 @@ static void qmp_cooling_devices_remove(struct qmp 
> *qmp)
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
> @@ -522,13 +582,14 @@ static int qmp_probe(struct platform_device 
> *pdev)
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
> diff --git a/include/linux/soc/qcom/qcom_aoss.h
> b/include/linux/soc/qcom/qcom_aoss.h
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

missed adding qmp_put.

> +
> +#else
> +
> +static inline int qmp_send(struct qmp *qmp, const void *data, size_t 
> len)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline struct qmp *qmp_get(struct device *dev)
> +{
> +	return ERR_PTR(-ENODEV);
> +}


missed adding qmp_put.

> +
> +#endif
> +
> +#endif

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
