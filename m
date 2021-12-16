Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD8DC433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 16 Dec 2021 10:39:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236141AbhLPKjT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 16 Dec 2021 05:39:19 -0500
Received: from mail.iot.bzh ([51.75.236.24]:42157 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236122AbhLPKjT (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Dec 2021 05:39:19 -0500
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id B4FA03E5BF;
        Thu, 16 Dec 2021 11:39:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:content-type:content-type:date:from
        :from:in-reply-to:message-id:mime-version:references:reply-to
        :subject:subject:to:to; s=iot.bzh; bh=ar4d3rm1aAML6RGomkFBoXCGG+
        H/i9/17Up/DVDTVWg=; b=iKwXeelNvculCBvItnvnG1RA9JhXEeHC6BqV15/vZL
        JOBEjSpA9wuPveZTv2zHrDi3i65qvcNJ8KMaoft0fSLcxPB1WmPMMiThYZ97r2d0
        QtNSn38LNXmD19iYYtU8UFjOdrslG2c+L/1PSYTprDytZMfxjPRvdZTa4waAe1Y/
        n0qZZGqQyNkCAMIVStAn/Mre2pC4PB2fohJCGbdWAap3fdGU9fxA4yioBKZ3bgj9
        565mAlgoB9zVbUcz+Vx1fbIHtx27xf3uNGi7rDyj4zevmUP97GAz9PgzkbDbnxdy
        UH4q150xbtBWMdEZH0D+yLi8l7vlbwBibpynUja3TQQw==
Message-ID: <10d6b1bb-1d26-9c53-a420-5cba0f869692@iot.bzh>
Date:   Thu, 16 Dec 2021 11:39:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [bug report] remoteproc: Add Renesas rcar driver
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-remoteproc@vger.kernel.org
References: <20211216082619.GA6079@kili>
From:   Julien Massot <julien.massot@iot.bzh>
In-Reply-To: <20211216082619.GA6079@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Dan,

On 12/16/21 09:26, Dan Carpenter wrote:
> Hello Julien Massot,
> 
> The patch 285892a74f13: "remoteproc: Add Renesas rcar driver" from
> Dec 7, 2021, leads to the following Smatch static checker warning:
> 
> 	drivers/remoteproc/rcar_rproc.c:171 rcar_rproc_probe()
> 	warn: pm_runtime_get_sync() also returns 1 on success
Indeed the patch was not correct.
> 
> drivers/remoteproc/rcar_rproc.c
>      147 static int rcar_rproc_probe(struct platform_device *pdev)
>      148 {
>      149         struct device *dev = &pdev->dev;
>      150         struct device_node *np = dev->of_node;
>      151         struct rcar_rproc *priv;
>      152         struct rproc *rproc;
>      153         int ret;
>      154
>      155         rproc = devm_rproc_alloc(dev, np->name, &rcar_rproc_ops,
>      156                                 NULL, sizeof(*priv));
>      157         if (!rproc)
>      158                 return -ENOMEM;
>      159
>      160         priv = rproc->priv;
>      161
>      162         priv->rst = devm_reset_control_get_exclusive(dev, NULL);
>      163         if (IS_ERR(priv->rst)) {
>      164                 ret = PTR_ERR(priv->rst);
>      165                 dev_err_probe(dev, ret, "fail to acquire rproc reset\n");
>      166                 return ret;;
>      167         }
>      168
>      169         pm_runtime_enable(dev);
>      170         ret = pm_runtime_get_sync(dev);
> --> 171         if (ret) {
> 
> The pm_runtime_get_sync() returns both 0 and 1 on success.  The comments
> to that function suggest that this should be changed to instead use:
> 
> 	ret = pm_runtime_resume_and_get();
> 	if (ret) {
> 
> I've got no idea what that function does but it has standard error codes
> and cleanup, so I *love* it.
Indeed checking for non 0 error code is not enough.
After looking at the pm_runtime_resume_and_get error handling, I also realize
that this driver never call pm_runtime_put, so pm_runtime_get/put is unbalanced.

I plan to address both issues in a single patch.

> 
>      172                 dev_err(dev, "failed to power up\n");
>      173                 return ret;
>      174         }
>      175
>      176         dev_set_drvdata(dev, rproc);
>      177
>      178         /* Manually start the rproc */
>      179         rproc->auto_boot = false;
>      180
>      181         ret = devm_rproc_add(dev, rproc);
>      182         if (ret) {
>      183                 dev_err(dev, "rproc_add failed\n");
>      184                 goto pm_disable;
>      185         }
>      186
>      187         return 0;
>      188
>      189 pm_disable:
>      190         pm_runtime_disable(dev);
missing
pm_runtime_put(dev);
(it also applies to the remove function)
>      191
>      192         return ret;
>      193 }
> 
> regards,
> dan carpenter
> 

Will try to address both issues today.

Regards,
-- 
Julien Massot [IoT.bzh]

