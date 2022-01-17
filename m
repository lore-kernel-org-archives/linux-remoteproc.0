Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B52C433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 17 Jan 2022 22:55:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbiAQWzY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 17 Jan 2022 17:55:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbiAQWzY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 17 Jan 2022 17:55:24 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B861C06173E
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Jan 2022 14:55:24 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id t9so25703750oie.12
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Jan 2022 14:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JgHdHThslfW8cWYgVZ7DrTIIbA1uJdRWFcKirFlKvos=;
        b=MhsS8EUXaQkCE2tOPqkbsGLNOXTZAO7ApasVgwy+ZLjMTQjBRQiRCevhCsEQ5z2C3A
         JbDvrP3ZnTPkV9o+F+EZ+1UR9S3NirPjX+R1yryE5LszoaLRj3mDwhFk2nE5TNEJ+mj4
         rgs4ye7Lw1BKcgI/lesO+wW8DTEEw18UZIfB6rRiYvXHfPBJh0d0q5hDYci0KEd3nrMo
         ymaw8anHdpPEytqUGi5AsuqFD7MVJQg2grITha+UpLkPtDTRe3IZh0ozAPrwf74z6xJL
         i+NQoi23Cw6Kr6Pw8+n583FvCE5xTjE54YqA1b6zAq5a/IJqWrRKon2rvk/QjggCWPla
         BgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JgHdHThslfW8cWYgVZ7DrTIIbA1uJdRWFcKirFlKvos=;
        b=8BkupJ3C5HVqzn+/RL9CqSLxhu72q2gRr9A5DgCQtht4WIoMePxohLvwUZryL3atlu
         8yhPUzlnJopqvcmUcALGilywtgmkZteQW9sGVG54lVycGt6kTJpsf7He96RmOkVc9hux
         a2vcym9mEy2v8D32bKKeIPvKTDSXlLWZHc2g6DnXYiO5JwZYOzYDOf5U0bakl3mpboMn
         zpnqJ95GK0tL4cBQHQ47sYLBtcGp3aOMLm5gIr0BtJdw65gJV1J0EDFdYBxUuA4NHXY1
         thc8TjFtB6fjNNyIhdqlNi4nE9dKA8mxGU2VSSl9rj5pxXpApuYInQP74oUwDC1tm/nG
         li8Q==
X-Gm-Message-State: AOAM5302XRnlpjr8cYmc+5fIrOHo69IgVhVCi7B6sjlY7F1kLa9AocMK
        Il2oEa+4cRM2IGogKhf2rQb9Lw==
X-Google-Smtp-Source: ABdhPJxRiubKKOWsfwr2r2Qn1nnjS9IzlDf478fuYhB8DEUNrxy2LBICJg0Ql7X+rAspt6g+C28LLg==
X-Received: by 2002:a05:6808:1148:: with SMTP id u8mr3297802oiu.19.1642460123552;
        Mon, 17 Jan 2022 14:55:23 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k10sm7443332oil.36.2022.01.17.14.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 14:55:22 -0800 (PST)
Date:   Mon, 17 Jan 2022 16:55:21 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, julien.massot@iot.bzh
Subject: Re: [PATCH v8 03/13] rpmsg: Move the rpmsg control device from
 rpmsg_char to rpmsg_ctrl
Message-ID: <YeXz2SFqYr+eUvnw@builder.lan>
References: <20211207080843.21222-1-arnaud.pouliquen@foss.st.com>
 <20211207080843.21222-4-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211207080843.21222-4-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 07 Dec 02:08 CST 2021, Arnaud Pouliquen wrote:
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
[..]
> -static void rpmsg_ctrldev_release_device(struct device *dev)
> -{
> -	struct rpmsg_ctrldev *ctrldev = dev_to_ctrldev(dev);
> -
> -	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
> -	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
> -	cdev_del(&ctrldev->cdev);
> -	kfree(ctrldev);
> -}
> -
> -static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> -{
> -	struct rpmsg_ctrldev *ctrldev;
> -	struct device *dev;
> -	int ret;
> -
> -	ctrldev = kzalloc(sizeof(*ctrldev), GFP_KERNEL);
> -	if (!ctrldev)
> -		return -ENOMEM;
> -
> -	ctrldev->rpdev = rpdev;
> -
> -	dev = &ctrldev->dev;
> -	device_initialize(dev);
> -	dev->parent = &rpdev->dev;
> -	dev->class = rpmsg_class;
> -
> -	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
> -	ctrldev->cdev.owner = THIS_MODULE;
> -
> -	ret = ida_simple_get(&rpmsg_minor_ida, 0, RPMSG_DEV_MAX, GFP_KERNEL);
> -	if (ret < 0)
> -		goto free_ctrldev;
> -	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
> -
> -	ret = ida_simple_get(&rpmsg_ctrl_ida, 0, 0, GFP_KERNEL);
> -	if (ret < 0)
> -		goto free_minor_ida;
> -	dev->id = ret;
> -	dev_set_name(&ctrldev->dev, "rpmsg_ctrl%d", ret);
> -
> -	ret = cdev_add(&ctrldev->cdev, dev->devt, 1);

This turns out to be incomplete and the cdev_del above is in the wrong
place. This, and the same for eptdev, is being corrected in:

https://lore.kernel.org/linux-remoteproc/164245960510.1698571.4998090450663669237.b4-ty@linaro.org/T/#t

Regards,
Bjorn
