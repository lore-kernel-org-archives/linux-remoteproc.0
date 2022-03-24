Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29ABC433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 24 Mar 2022 16:54:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352056AbiCXQ41 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 24 Mar 2022 12:56:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352074AbiCXQ4G (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 24 Mar 2022 12:56:06 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C773B82E9
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Mar 2022 09:53:40 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id lr4so1962281ejb.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Mar 2022 09:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=guAY8H9s0/D31TGTPoAO5wEnVmI1SOOb0AGR5y37XQ0=;
        b=LKOewzvBfrVsBknqjic7BjVmPsGz3mI+RjmqeIl2waFAs4UelmkJiiCqP9CSGpoUK8
         vEI7DpODTzvqQQsr1z6S3IR9ZvEkd7cOsW3Ir2F/PFo3Y5fDz4ZIoWMdAyI3mLrKgF3N
         KHwdyXL/aDYhYIWD/MjtbVBguQ8NPLbjZEq5gC20mKyd5qXPLiUf81dejGctiP7tdi1R
         v/FOYWFbQ5FXhhQHPSycWEDVYhy319VZIik8NLKMl+2PY9OJeRT2pNanmcFrBB/IMjC5
         +azdg6iduo8AqZYkwnPySp0G/pd4be2sCMa4oWExJ1QT3xZ/zW7C6C0iMTOuvC49xYOb
         9isg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=guAY8H9s0/D31TGTPoAO5wEnVmI1SOOb0AGR5y37XQ0=;
        b=GwmDtLr05c9/+4iqZANZCXqyaPbN/souUPbCZf0rXnLWu5p/OHHcwMeYmjb0jnHTL0
         sz2sonYA6NETSYLZRdNq92JjlG1PtxZnn4gi47DFkvL7ymy6yopHHS48riCOkAJpqmM1
         ZpkOi/FGCX2P9IMEGYfDNlYxPu4WKaAkxh5kihBn9hEGalu+lO69/eEPhahnxw5aCMn6
         VPwaq7hedpNoEn1emozQgbJSm5Va675vlWND68jFBGpO01axX1xuibR1oL5OveGK5NE6
         8Uap8BAY1FzByg4QG2tcOuRjnFccDwAluPKuNmDNws8oyxdQjMpogE80NaAeZGW/8QZA
         SOkQ==
X-Gm-Message-State: AOAM530UITAB2/CtsKd28QP5N/j+wMLNoB5auc7rM9S1dWFVBgybvj+H
        jtC7B2LEnUzbQ1hRPv4cg9vC2Iodtvgm5a1JkMFEdg==
X-Google-Smtp-Source: ABdhPJxFg49QIVLDzYPvwRFRl+5RxuEgvpIWY9pDjjcp1qKJ/Us5NofAcbWQasCtYd+4DWyxEP8KrYKIFv4xTZAJ6zI=
X-Received: by 2002:a17:906:3cf1:b0:6cf:86c6:8a12 with SMTP id
 d17-20020a1709063cf100b006cf86c68a12mr6702003ejh.202.1648140819020; Thu, 24
 Mar 2022 09:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <1648027970-11488-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1648027970-11488-1-git-send-email-shengjiu.wang@nxp.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 24 Mar 2022 10:53:27 -0600
Message-ID: <CANLsYkyHVcoF_fM836vES9gsj0b39aqC6s=9UNeRuAQMZjggRQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: core: Remove state checking before changing state
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 23 Mar 2022 at 03:42, Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> There is no mutex protecting of these state checking, which
> can't garantee there is no another instance is trying to do
> same operation.
>
> The reference counter rproc->power is used to manage state
> changing and there is mutex protection in each operation
> function for multi instance case.
>
> So remove this state checking in rproc_cdev_write() and
> state_store(), just let reference counter rproc->power to
> manage the behaviors.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/remoteproc/remoteproc_cdev.c  | 11 -----------
>  drivers/remoteproc/remoteproc_sysfs.c | 11 -----------
>  2 files changed, 22 deletions(-)
>
> diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
> index 906ff3c4dfdd..687f205fd70a 100644
> --- a/drivers/remoteproc/remoteproc_cdev.c
> +++ b/drivers/remoteproc/remoteproc_cdev.c
> @@ -32,21 +32,10 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
>                 return -EFAULT;
>
>         if (!strncmp(cmd, "start", len)) {
> -               if (rproc->state == RPROC_RUNNING ||
> -                   rproc->state == RPROC_ATTACHED)
> -                       return -EBUSY;
> -
>                 ret = rproc_boot(rproc);
>         } else if (!strncmp(cmd, "stop", len)) {
> -               if (rproc->state != RPROC_RUNNING &&
> -                   rproc->state != RPROC_ATTACHED)
> -                       return -EINVAL;
> -
>                 ret = rproc_shutdown(rproc);
>         } else if (!strncmp(cmd, "detach", len)) {
> -               if (rproc->state != RPROC_ATTACHED)
> -                       return -EINVAL;
> -
>                 ret = rproc_detach(rproc);
>         } else {
>                 dev_err(&rproc->dev, "Unrecognized option\n");
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index 51a04bc6ba7a..8c7ea8922638 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -194,23 +194,12 @@ static ssize_t state_store(struct device *dev,
>         int ret = 0;
>
>         if (sysfs_streq(buf, "start")) {
> -               if (rproc->state == RPROC_RUNNING ||
> -                   rproc->state == RPROC_ATTACHED)
> -                       return -EBUSY;
> -

As per my previous comment the above conditions need to be moved into
rproc_boot().

>                 ret = rproc_boot(rproc);
>                 if (ret)
>                         dev_err(&rproc->dev, "Boot failed: %d\n", ret);
>         } else if (sysfs_streq(buf, "stop")) {
> -               if (rproc->state != RPROC_RUNNING &&
> -                   rproc->state != RPROC_ATTACHED)
> -                       return -EINVAL;
> -
>                 ret = rproc_shutdown(rproc);
>         } else if (sysfs_streq(buf, "detach")) {
> -               if (rproc->state != RPROC_ATTACHED)
> -                       return -EINVAL;
> -

This patch should have been part of a patch series with your other
work sent on March 18th[1].

Thanks,
Mathieu

[1]. [PATCH] remoteproc: core: check rproc->power value before decreasing it

>                 ret = rproc_detach(rproc);
>         } else {
>                 dev_err(&rproc->dev, "Unrecognised option: %s\n", buf);
> --
> 2.17.1
>
