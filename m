Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B732CC433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu,  9 Sep 2021 18:03:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FB4D6113E
	for <linux-remoteproc@archiver.kernel.org>; Thu,  9 Sep 2021 18:03:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237271AbhIISFH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 9 Sep 2021 14:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234493AbhIISFH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 9 Sep 2021 14:05:07 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CEBAC061574
        for <linux-remoteproc@vger.kernel.org>; Thu,  9 Sep 2021 11:03:57 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id j13so3791066edv.13
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Sep 2021 11:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4dh4bYDTp2FTsS3WUNZUj89lgm/MpY+W/FPLNckjFKs=;
        b=dxbJhY/4KETV4Rv7Fw7RpkOu+Z3IGn5RYltG4OAEUzQ6cTRhN8U5oIHWXTdfapJrOm
         qGeEIGY0snt5Gvb67YLxFjPPrfL1G7h/1JCMOkQFRCmIzE8W9OPyvsLim8BrRFthms6Y
         B90WRAtEfnhmNGceuVxOuzU3nKV8K+7R39yM+RkDWvWyd8BngX4PvjIAAqjF3C1RYg3b
         HiA70/2IAGAXKABNwHzJBhuCwGr+ZLjz0U6+YBl0i4euN8RpF+rmJT6CnQkeROcPFBrp
         76Gk7CBSNyoVovyywTiR2srlH9oqe6b6PvYcv3i6AdRwNZt3hFXFgx8HTw3V8m4O3s6X
         MnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4dh4bYDTp2FTsS3WUNZUj89lgm/MpY+W/FPLNckjFKs=;
        b=NCAdxPrWroDDTHPawKPEb4K7IrQkavXCF9+eVQShIHvUiiNLPX0N82xrQIElxK2RTr
         zl27zxzjgo5NXaUak53j7+ibxuykj02ZHtBs53pE23kw3eiCNgy3okxcXVCgwQlWkenN
         iR2zVf4kFpFoJ0KdUlPGqRmRJZnapJSO03JdT3Ox7D1rS9/yuTzyf1hLVt45WAsIdl5F
         UvoEF8+opm5Uh2kP10g4t83wqkJy6e87dam2vnJGBsIAv6q/Pixc4Rhc9bmeGW8CNHFc
         C+baLWxODqDkMhoqeNSqJrgSfBh7piqxVs3s3rWebhESWJ0wIFc8WnXU6RnjeoFmUraq
         qspQ==
X-Gm-Message-State: AOAM531GbkdDRi2f2noQdyCDTmdqIraKUpxY3aZjGJxCqGzrrdJbHaf1
        UGlba0qId+UzQP0mE275G6wFOztBt3QbEc+eS8+U4g==
X-Google-Smtp-Source: ABdhPJwKGW4bIkzIitYZN7llzvNPoUmK3uA9YyeuidVR0h1oOzLozfouL1z7+/WogG4jazQ1J5p7bCJaQrL3cP1F6XU=
X-Received: by 2002:a05:6402:4415:: with SMTP id y21mr4551106eda.79.1631210636044;
 Thu, 09 Sep 2021 11:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210811123125.143-1-caihuoqing@baidu.com>
In-Reply-To: <20210811123125.143-1-caihuoqing@baidu.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 9 Sep 2021 12:03:44 -0600
Message-ID: <CANLsYkxKsUONLCfUqgFxAw_ag=bp-wxfQod7RgrvaDD7W2o7=A@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: virtio: Remove unused including <linux/of_device.h>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 11 Aug 2021 at 06:31, Cai Huoqing <caihuoqing@baidu.com> wrote:
>
> Remove including <linux/of_device.h> that don't need it.
>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 8e49a3bacfc7..a0634ef0420b 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -17,7 +17,6 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> -#include <linux/of_device.h>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  #include <linux/rpmsg.h>
>  #include <linux/rpmsg/byteorder.h>
>  #include <linux/rpmsg/ns.h>
> --
> 2.25.1
>
