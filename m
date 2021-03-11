Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02D1C433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Mar 2021 23:39:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB4D764F7C
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Mar 2021 23:39:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbhCKXih (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Mar 2021 18:38:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbhCKXiF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Mar 2021 18:38:05 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4EAFC061761
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Mar 2021 15:38:04 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id d20so24997708oiw.10
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Mar 2021 15:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y7PZLngnSiOO6tUFoYHe7nczWb/djDzvqn8CynT2y7o=;
        b=b2rJ6NYdtpvRsYrTydu07Hbmx4KuucnrL02ilCVLMbWyGoSCM5JuPNA0SIk20Buxrw
         Oh7oUZvjjjC0iQHpcwiYsGwSmlZp3cPbWR34ABrpQwzFL/BM3NX+sV+8FPYzCPOw+ofi
         VzULisEMofG367pN45L/GSPzAd+IR9TP6WzLklrASPitwJGBnwKsB41AUiiYv8Af4Oag
         soqwhhbg7skLH9mj/+yzDctmKgkUlK/mjPc53IbweQF4YwS39hFqhrrVqT4JQC8twf9n
         tzySqGOhOX9aVvGEGiQM9cPpOxzOmfyLIsxdAoV+ujtciMM/eNpufnB5In28l9oJdP0X
         QWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y7PZLngnSiOO6tUFoYHe7nczWb/djDzvqn8CynT2y7o=;
        b=l2iCoVzusA0cGARUhNqriPpStSGjzu3CoJHxQW6CgwPuo0gUo4j6iWZZQ+gSkysaz3
         5YAtOWcssIDYOzcGWUp1iFAJgT4BJDLr4WF38v5H25qmUWtWrEsqQXpr71sCj5gu+Hxj
         HRxVnmWiWPHKT1229xfc2ByUomuSmX1HLgdSYDpAAhhwNM35WBZge1gOFXs0ZTfIJk8Q
         Bg5Z4mOmvNychuQSHDxK+23OGJXuzRSv0dDD35nnfvjUuoL7pFBdX0zMsv13ILDePzLm
         7E1kieeiPnAnVPT2rlAe1wLQSyUqbPhJ3LukLRkn+6qhiagF34Qo/BSeXZ8CNWKqZYG9
         A8RQ==
X-Gm-Message-State: AOAM532RrNjEoWaeqU2dLCV/OLWOE14RqsmdKudjmNoJ24/OgKcdLXZ8
        Tg2j8z0YiBRMlCYoSKaKdsscsWFye2iXJg==
X-Google-Smtp-Source: ABdhPJy3trbQfPJf8Jw30MXwWRENujdAMmMOYHCnCoFk8D7mpra/ivKmRip+qDmcJtYBYf2nNtZqnw==
X-Received: by 2002:a05:6808:140e:: with SMTP id w14mr8230991oiv.176.1615505883760;
        Thu, 11 Mar 2021 15:38:03 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z8sm987590otp.14.2021.03.11.15.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 15:38:03 -0800 (PST)
Date:   Thu, 11 Mar 2021 17:38:01 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/6] rpmsg: enable the use of the rpmsg_char device for
 the Virtio backend
Message-ID: <YEqp2US8OykaUAa/@builder.lan>
References: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 11 Mar 08:04 CST 2021, Arnaud Pouliquen wrote:

> This series is the first step in the division of the series: 
> "Introduce a generic IOCTL interface for RPMsg channels management"[1]
> 
> The main goal here is to enable the RPMsg char interface for
> the virtio RPMsg backend. 
> 
> In addition some patches have been includes in order to document the
> interface and rename the rpmsg_char_init function.
> 
> It also includes Mathieu Poirier's comments made on [1]
> 
> Patchsets that should be the next steps:
>  - Extract the control part of the char dev and create the rpmsg_ctrl.c
>    file
>  - Introduce the RPMSG_CREATE_DEV_IOCTL IOCTL to instantiate RPMsg devices
> 
> 
> [1]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=435523
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Arnaud Pouliquen (6):
>   rpmsg: char: Rename rpmsg_char_init to rpmsg_chrdev_init
>   rpmsg: Move RPMSG_ADDR_ANY in user API
>   rpmsg: Add short description of the IOCTL defined in UAPI.
>   rpmsg: char: Use rpmsg_sendto to specify the message destination
>     address
>   rpmsg: virtio: Register the rpmsg_char device
>   rpmsg: char: Return an error if device already open
> 
>  drivers/rpmsg/qcom_glink_native.c | 16 ++++++++
>  drivers/rpmsg/qcom_smd.c          | 16 ++++++++
>  drivers/rpmsg/rpmsg_char.c        | 11 ++++--
>  drivers/rpmsg/virtio_rpmsg_bus.c  | 62 ++++++++++++++++++++++++++++---
>  include/linux/rpmsg.h             |  3 +-
>  include/uapi/linux/rpmsg.h        | 13 ++++++-
>  6 files changed, 108 insertions(+), 13 deletions(-)
> 
> -- 
> 2.17.1
> 
