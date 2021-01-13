Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA05AC433E0
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Jan 2021 20:32:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AD6D22795
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Jan 2021 20:32:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727926AbhAMUc1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 13 Jan 2021 15:32:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726686AbhAMUc0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 Jan 2021 15:32:26 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9652C061575
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Jan 2021 12:31:46 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id n7so2244274pgg.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Jan 2021 12:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x3MPhiU2w3/M1LyIYX233yh3l63UHt26Df7c1l4yyS0=;
        b=lgOrF1vud4CIGB25b7osz+2oIguQZKHERI9D69dBcBVuYXheNY3pX5pbJYPwCckISM
         +PUkM6LOor5+Ci7YWZAaSLyzjIlqhc8mPtpDrSlVpuE/cNy2l28dog8L7Ttg2reyok5s
         AD6wE980ogNO2xg3XtyblOQu7cC1Cwm8H9SIvDx6AuQhTKM8dOBuVZX15fEcbL5IuaWt
         15BQt6H8G1Yj0jnP9f+nRsPX7TJi/lPYpUk0vJx4MW5HNANk+UrbucZTrQuJ3CkG39De
         NPJj3ROUB7xRlXAxLFVY+yowWEQA30PDa8Bl5C4mCxRGHtAWK0GzBepU4eixiPg3/Ai1
         PCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x3MPhiU2w3/M1LyIYX233yh3l63UHt26Df7c1l4yyS0=;
        b=hCPADDwH9y3XtOe/Y8MdQc4A3MSt+lCRSA/qv3qMWqamMy7c2mZDoVMWR092aiUZK6
         mSZYQ1ilF3zc/sINjg//RfvoPE4ubea/us0XwuHF3t92dje2wFryc49JR1+3D92aZ7Z0
         WT+ft0CY0NZPjF9LN4vayhbIx5zJkY05lvtYf/4671zadZFYTAMxoNoDJ3PcHUp88Fgh
         E8Nr+0ZeT9O1mOeoKivOuRjY+LmrxiYuNLIB8MJGmU2NN0JD2pz3flBz0BwRIzNYWdgd
         Q9AWELTqCNeQNbaWlLRkxBAzU3R8IFmJPpAJTAKAnx+4c/ATGHTqN254JJ2l0KQ1+Jcw
         HyiA==
X-Gm-Message-State: AOAM533hYzE6pM8vWQZ+aHyACWIDagmt8XPNLzW0vQdc4RfOCX7zfhde
        i2QZIPOKZn+kkCc1XQXlBkVeBA==
X-Google-Smtp-Source: ABdhPJz3B8b/fHkcVhHNh/pEoU/jcb/7vLKk9kpdfzQ2KQQgMT3HCF2wn+oiQYR4k+z1aUBQIzJVXg==
X-Received: by 2002:a63:3714:: with SMTP id e20mr3792229pga.410.1610569906286;
        Wed, 13 Jan 2021 12:31:46 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id bx17sm3834222pjb.12.2021.01.13.12.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 12:31:45 -0800 (PST)
Date:   Wed, 13 Jan 2021 13:31:43 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 00/16] introduce generic IOCTL interface for RPMsg
 channels management
Message-ID: <20210113203143.GA229796@xps15>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Arnaud,

[...]

> 
> Arnaud Pouliquen (16):
>   rpmsg: introduce RPMsg control driver for channel creation
>   rpmsg: add RPMsg control API to register service
>   rpmsg: add override field in channel info
>   rpmsg: ctrl: implement the ioctl function to create device
>   rpmsg: ns: initialize channel info override field
>   rpmsg: add helper to register the rpmsg ctrl device
>   rpmsg: char: clean up rpmsg class
>   rpmsg: char: make char rpmsg a rpmsg device without the control part
>   rpmsg: char: register RPMsg raw service to the ioctl interface.
>   rpmsg: char: allow only one endpoint per device
>   rpmsg: char: check destination address is not null
>   rpmsg: virtio: use the driver_override in channel creation ops
>   rpmsg: virtio: probe the rpmsg_ctl device
>   rpmsg: glink: add create and release rpmsg channel ops
>   rpmsg: smd: add create and release rpmsg channel ops
>   rpmsg: replace rpmsg_chrdev_register_device use
> 
>  drivers/rpmsg/Kconfig             |   8 +
>  drivers/rpmsg/Makefile            |   1 +
>  drivers/rpmsg/qcom_glink_native.c |  96 +++++++--
>  drivers/rpmsg/qcom_smd.c          |  59 +++++-
>  drivers/rpmsg/rpmsg_char.c        | 246 ++++++-----------------
>  drivers/rpmsg/rpmsg_ctrl.c        | 320 ++++++++++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_internal.h    |  14 --
>  drivers/rpmsg/rpmsg_ns.c          |   1 +
>  drivers/rpmsg/virtio_rpmsg_bus.c  |  38 +++-
>  include/linux/rpmsg.h             |  40 ++++
>  include/uapi/linux/rpmsg.h        |  14 ++
>  11 files changed, 606 insertions(+), 231 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c

I am finally coming around to review this set.  I see that you already had an
extensive conversation with Bjorn - did you want me to have a look as well or
should I wait for the next revision?

Thanks,
Mathieu

> 
> -- 
> 2.17.1
> 
