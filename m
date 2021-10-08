Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6BA0C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Oct 2021 23:33:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BA7660F5E
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Oct 2021 23:33:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243790AbhJHXfx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 8 Oct 2021 19:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231927AbhJHXft (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Oct 2021 19:35:49 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B121AC061755
        for <linux-remoteproc@vger.kernel.org>; Fri,  8 Oct 2021 16:33:51 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id o4so15696435oia.10
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Oct 2021 16:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LNS8GJx7Voy78yUyXNx2JMVNcPOFQ4/UTHt1sTh9r9o=;
        b=Bg7OowKF/HjhYjv8EvSeo7PxCGvq0C/YP2r3EzNsC6mVhKpGaLYoQRZUki6HTIHy+p
         fenB7grsQ4DRJxcdIytrERvqLxis+s8QHXXiqliLlOA0sBwAnwB+TVFpfK9HZjRxvzEw
         6Ed7qTixmLcdrBNGQvYNxGY4xakURMjzK9aJ1+P1YzT+3YiDY/V+AvKWPJrgP0Fet/oX
         6bpgTB0psdYEE4/LLIWZUkgOpiwwe9GDQMUA23qzUhWb+W03PgMMt6y7SoWFMFl+3NOn
         OY1TYt502mD2T2lw+TQZTTFUNsjzJEa9C3MlCfkIj8szsKiVmwmkGeNtX6Cp3BpyfUyK
         Yvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LNS8GJx7Voy78yUyXNx2JMVNcPOFQ4/UTHt1sTh9r9o=;
        b=02egvQk4rWsrZbJMbTn/n4eUJbtv7WAhntaIqKg+BWLr9QKUL+1oGw6s+AKe4/R1k2
         ROi8TRKBQuZ5ew02JkioWwFCYZZ/EgWDcYMtDWaK6p7v/gEQ0x/8leZV1ia1Hi4QBsr7
         AZK2BAbviRGQGVKDUiHyqWYyUo7aYdyXgRrHzjs3heaGj0lOmr5JxTSRgZWnv41188Ok
         YpC2HKRjnLizCI4e8sVfhnQQ2bovAafCuBEzOc4r7FiKq8vMvmZr6nTbax2YtsbKvs27
         rxBzqgjVxhdk8U5jForFP23bbTAXSEwNv9cxJePfZGXxw/XhNwcHp18dqofkiqDbjKjw
         S1OA==
X-Gm-Message-State: AOAM530OSjbj4rSlKGzxUfaOscIHFJXOB83F7BSy9zDK1LD0ppcsZvhe
        UFFMzJcELUdWUt4tz8TtUcnEkQ==
X-Google-Smtp-Source: ABdhPJxcwZLkWR0vpAYFKlZuLPCQjPJ+BotE7dx4TRrQGxFwGJPEPPwaI2ncQJliUwOm2t11sMrJLg==
X-Received: by 2002:aca:6256:: with SMTP id w83mr18543659oib.19.1633736030769;
        Fri, 08 Oct 2021 16:33:50 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id bb39sm217154oib.28.2021.10.08.16.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 16:33:50 -0700 (PDT)
Date:   Fri, 8 Oct 2021 16:35:28 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v5 3/4] rpmsg: Move the rpmsg control device from
 rpmsg_char to rpmsg_ctrl
Message-ID: <YWDVwArEz5Yub3GJ@ripper>
References: <20210712123752.10449-1-arnaud.pouliquen@foss.st.com>
 <20210712123752.10449-4-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712123752.10449-4-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 12 Jul 05:37 PDT 2021, Arnaud Pouliquen wrote:

> Create the rpmsg_ctrl.c module and move the code related to the
> rpmsg_ctrldev device in this new module.
> 
> Add the dependency between rpmsg_char and rpmsg_ctrl in the
> kconfig file.
> 

As I said in the cover letter, the only reason I can see for doing this
refactoring is in relation to the introduction of
RPMSG_CREATE_DEV_IOCTL. So I would like this patch to go together with
that patch, together with a good motivation why there's merit to
creating yet another kernel module (and by bind/unbind can't be used).

Perhaps I'm just missing some good usecase related to this?

> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/rpmsg/Kconfig      |   9 ++
>  drivers/rpmsg/Makefile     |   1 +
>  drivers/rpmsg/rpmsg_char.c | 170 +----------------------------
>  drivers/rpmsg/rpmsg_char.h |   2 +
>  drivers/rpmsg/rpmsg_ctrl.c | 215 +++++++++++++++++++++++++++++++++++++
>  5 files changed, 229 insertions(+), 168 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> 
[..]
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
[..]
> -static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> -{
[..]
> -	dev = &ctrldev->dev;
> -	device_initialize(dev);
> -	dev->parent = &rpdev->dev;
> -	dev->class = rpmsg_class;
[..]
> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
[..]
> +static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
> +{
[..]
> +	dev = &ctrldev->dev;
> +	device_initialize(dev);
> +	dev->parent = &rpdev->dev;

You lost the assignment of dev->class here, which breaks the udev rules
we use to invoke rpmsgexport to create endpoints and it causes udevadm
to complain that rpmsg_ctrlN doesn't have a "subsystem".

Regards,
Bjorn
