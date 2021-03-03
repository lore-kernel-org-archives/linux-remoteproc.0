Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41AEBC433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 Mar 2021 00:50:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E1F464F53
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 Mar 2021 00:50:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232181AbhCDAuB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:50:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241013AbhCCRDn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 3 Mar 2021 12:03:43 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B7EDC0613DC
        for <linux-remoteproc@vger.kernel.org>; Wed,  3 Mar 2021 09:01:34 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id t25so16826408pga.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Mar 2021 09:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NS5lTDaGXttSrOQ5MHO4aoL/JPMPWoX9kViqNvHNTVw=;
        b=VsTPW062qCBbmWlJ6C89JwMPfX2rDXIXP6PJpEDWU5cAcLYJV//2F9SQV7xbWGyQ6t
         N/Rrr+z55FyTSfysrWPPFGBI9GzuwfbuCLjvmLihq1RUVnJaIoexXJkZqixLZeCccfIt
         qgu8mRlb9Glv1h6/OEu5+c6Xh/SwIKfMpq2/E0JcnV1pqjbdfki1j1vR/5H3xQ2moPQI
         v0WAlKnK9Y3T6+iwkwiLboG/ZK2GiXhnegwLcW4zGDaCuqubIh953KIf0nquF0PWc+0T
         br0mTrp+RzZOS3Gp9zTRIYGKyfqgWoc9vCbsN2yl3IhVr3pdWDrUGArTIAcV8rFiyJD8
         yGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NS5lTDaGXttSrOQ5MHO4aoL/JPMPWoX9kViqNvHNTVw=;
        b=BNYI6AW+w0zaCrNSC9wz8/P1F+n33ZbUg6snxBJMzTM3QyK20DwlFhqgB+yp5qYGHO
         RIXP11DRijKuvP6X8hTAwBUZzgLZy2eKX6XoiDlphSMxPM3rNXiQwzZ38TkXZTTn0926
         Yol+LCTw3rhvhvHxlO4P43mZensIWrKHKiYUfuaKZLophHqdGa+zy7GhQEqB5hG1mrx5
         x+s0+H3q/BuLLVA9UjLSMooFdGD90IrFq0dJNCMWVl9RCmK3VViYlso2oyKarz0h5oTd
         V/h/s284nHArSIhCSFCZTSlrJntF01mhfkF40G26G5L1h0pQ5/VNns8re6q9Sl42eARZ
         IlPw==
X-Gm-Message-State: AOAM532yPOZLMv4DY2C50fgbB8bHE7JyIXqSn92bReheTBM1uPFK6DI6
        p9reX+boQIG2eAZMX87DZawnAA==
X-Google-Smtp-Source: ABdhPJwnSJtlw+7CYzN3TJ1B9S6jcmKYC9LYLbDS05Ed7kcO8bdthFTmHZaaIeoVlr9rJGVEnmxWAQ==
X-Received: by 2002:a63:4a44:: with SMTP id j4mr23741977pgl.199.1614790893689;
        Wed, 03 Mar 2021 09:01:33 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 132sm3438070pfu.158.2021.03.03.09.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 09:01:31 -0800 (PST)
Date:   Wed, 3 Mar 2021 10:01:30 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 07/16] rpmsg: update rpmsg_chrdev_register_device
 function
Message-ID: <20210303170130.GC3817330@xps15>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-8-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210219111501.14261-8-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Feb 19, 2021 at 12:14:52PM +0100, Arnaud Pouliquen wrote:
> As driver is now the rpmsg_ioctl, rename the function.
> In addition, initialize the rpdev addresses to RPMSG_ADDR_ANY as not
> defined.

This patch works but the changelog needs a rework.  The title reflects the
essence of changes but the text of the changelog doesn't.

> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/qcom_glink_native.c |  2 +-
>  drivers/rpmsg/qcom_smd.c          |  2 +-
>  drivers/rpmsg/rpmsg_ctrl.c        |  2 +-
>  drivers/rpmsg/rpmsg_internal.h    | 10 ++++++----
>  4 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 27a05167c18c..d4e4dd482614 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1625,7 +1625,7 @@ static int qcom_glink_create_chrdev(struct qcom_glink *glink)
>  	rpdev->dev.parent = glink->dev;
>  	rpdev->dev.release = qcom_glink_device_release;
>  
> -	return rpmsg_chrdev_register_device(rpdev);
> +	return rpmsg_ctrl_register_device(rpdev);
>  }
>  
>  struct qcom_glink *qcom_glink_native_probe(struct device *dev,
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 19903de6268d..40a1c415c775 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -1097,7 +1097,7 @@ static int qcom_smd_create_chrdev(struct qcom_smd_edge *edge)
>  	qsdev->rpdev.dev.parent = &edge->dev;
>  	qsdev->rpdev.dev.release = qcom_smd_release_device;
>  
> -	return rpmsg_chrdev_register_device(&qsdev->rpdev);
> +	return rpmsg_ctrl_register_device(&qsdev->rpdev);
>  }
>  
>  /*
> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> index fa05b67d24da..2e43b4096aa8 100644
> --- a/drivers/rpmsg/rpmsg_ctrl.c
> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> @@ -180,7 +180,7 @@ static struct rpmsg_driver rpmsg_ctrl_driver = {
>  	.probe = rpmsg_ctrl_probe,
>  	.remove = rpmsg_ctrl_remove,
>  	.drv = {
> -		.name = "rpmsg_chrdev",
> +		.name = KBUILD_MODNAME,
>  	},
>  };
>  
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index a76c344253bf..7428f4465d17 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -82,16 +82,18 @@ struct rpmsg_device *rpmsg_create_channel(struct rpmsg_device *rpdev,
>  int rpmsg_release_channel(struct rpmsg_device *rpdev,
>  			  struct rpmsg_channel_info *chinfo);
>  /**
> - * rpmsg_chrdev_register_device() - register chrdev device based on rpdev
> + * rpmsg_ctrl_register_device() - register a char device for control based on rpdev
>   * @rpdev:	prepared rpdev to be used for creating endpoints
>   *
>   * This function wraps rpmsg_register_device() preparing the rpdev for use as
>   * basis for the rpmsg chrdev.
>   */
> -static inline int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev)
> +static inline int rpmsg_ctrl_register_device(struct rpmsg_device *rpdev)
>  {
> -	strcpy(rpdev->id.name, "rpmsg_chrdev");
> -	rpdev->driver_override = "rpmsg_chrdev";
> +	strcpy(rpdev->id.name, "rpmsg_ctrl");
> +	rpdev->driver_override = "rpmsg_ctrl";
> +	rpdev->src = RPMSG_ADDR_ANY;
> +	rpdev->dst = RPMSG_ADDR_ANY;
>  
>  	return rpmsg_register_device(rpdev);
>  }
> -- 
> 2.17.1
> 
