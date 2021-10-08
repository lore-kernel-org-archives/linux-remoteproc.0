Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D997AC433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Oct 2021 23:27:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF4ED60F93
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Oct 2021 23:27:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbhJHX33 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 8 Oct 2021 19:29:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231927AbhJHX32 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Oct 2021 19:29:28 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BDC3C061570
        for <linux-remoteproc@vger.kernel.org>; Fri,  8 Oct 2021 16:27:32 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id v2-20020a05683018c200b0054e3acddd91so8983755ote.8
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Oct 2021 16:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UcoB+5fCYF52we3qe/RiFWGs8jkkNhY5tHgymk6y40o=;
        b=NLD/D3P5mqq3fW68lN15+KWSAZeFqaGF+aJuxw9CoGyup0gCHTxodQpE6VivP1j1xp
         5aQX9A9E5vENxJWzhc/KnpOEfQf4yVBXtkQ1jV68tKH2Xc6W5i1zzZH4zwrERc4fEikS
         YjQs8tmh3d/u/5mjwciWLPIuWjtmNbaXjo9DNw6T2JbVxPABfoSIMLHv6K/wdb9LC3Ce
         Uz4OUoaTKfxJtcwA9kbHN9khRTkegkU0scHi0jdo0bhV9Zr+eWqeR2cfOylIy3HBlpNG
         +87OL0YMB3eoEKtagaw+n9hLPPuVYOpuZGqBS+RhcXe5gY6GgvMTXbMsDrce66xKl9wG
         Xy4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UcoB+5fCYF52we3qe/RiFWGs8jkkNhY5tHgymk6y40o=;
        b=gzdCh4dpHW4k/+o7TS76fESn/uRlT0i85IEyaSC3BlrAvU5kN0qzo+poNa2n7JkFVI
         +iOJ3KwBY+w6Q9v1CH7y/iBj/EWSPY1qLgZmoRm7Y6c51M/GlbOMnPgAauP/Ax/vSpFm
         EgiCKlXoZqmCv2ES/8EC3dizFixrfnaoO0R0EkkISdPLoz2f84zIbpIIBgd31u09U/Lu
         1x+JqusN9UGahHD8GM2JoNcJ7Q52WFLc3igBEA0tkuwiU45Ug273ST8WD9Pl/zk8x3mM
         7vh6lr3ziS/LCEG49tBNN9bBwhIVbduNCNUkFE5f8E+Jq2wm8/EAENlPYL65gyGTXIvY
         PqWw==
X-Gm-Message-State: AOAM530YLKnnWWfnoOGtwvXsfTpe48snggc8q1C1rM9rSMqsFVpfOPzn
        HajZooHdxDdanlG5W0AtSwO3Hw==
X-Google-Smtp-Source: ABdhPJxJ6Y5o8Ma3y0qrOQzeuoTAxD9GmIPjDyw5Vh2WcihB6FL1lmd9w2RqDM0YuWzvO8wZn8Nu2w==
X-Received: by 2002:a05:6830:60c:: with SMTP id w12mr11030494oti.370.1633735651730;
        Fri, 08 Oct 2021 16:27:31 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id h11sm165108otu.49.2021.10.08.16.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 16:27:31 -0700 (PDT)
Date:   Fri, 8 Oct 2021 16:29:09 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v5 2/4] rpmsg: char: Export eptdev create an destroy
 functions
Message-ID: <YWDURVTg1PpxRDEu@ripper>
References: <20210712123752.10449-1-arnaud.pouliquen@foss.st.com>
 <20210712123752.10449-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712123752.10449-3-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 12 Jul 05:37 PDT 2021, Arnaud Pouliquen wrote:
[..]
> diff --git a/drivers/rpmsg/rpmsg_char.h b/drivers/rpmsg/rpmsg_char.h
> new file mode 100644
> index 000000000000..22573b60e008
> --- /dev/null
> +++ b/drivers/rpmsg/rpmsg_char.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Copyright (C) STMicroelectronics 2021.
> + */
> +
> +#ifndef __RPMSG_CHRDEV_H__
> +#define __RPMSG_CHRDEV_H__
> +
> +#if IS_REACHABLE(CONFIG_RPMSG_CHAR)

This does allow you to build a kernel with RPMSG_CHAR=m and RPMSG_CTRL=y
without link failures. Any modules in the system will be able to call
rpmsg_chrdev_eptdev_create(), but the rpmsg_ctrl driver will only end up
in the stub.

This sounds like a recipe for a terrible debugging session...

Regards,
Bjorn

> +/**
> + * rpmsg_chrdev_eptdev_create() - register char device based on an endpoint
> + * @rpdev:  prepared rpdev to be used for creating endpoints
> + * @parent: parent device
> + * @chinfo: associated endpoint channel information.
> + *
> + * This function create a new rpmsg char endpoint device to instantiate a new
> + * endpoint based on chinfo information.
> + */
> +int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
> +			       struct rpmsg_channel_info chinfo);
> +
> +/**
> + * rpmsg_chrdev_eptdev_destroy() - destroy created char device endpoint.
> + * @data: private data associated to the endpoint device
> + *
> + * This function destroys a rpmsg char endpoint device created by the RPMSG_DESTROY_EPT_IOCTL
> + * control.
> + */
> +int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data);
> +
> +#else  /*IS_REACHABLE(CONFIG_RPMSG_CHAR) */
> +
> +static inline int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
> +					     struct rpmsg_channel_info chinfo)
> +{
> +	return -EINVAL;
> +}
> +
> +static inline int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
> +{
> +	/* This shouldn't be possible */
> +	WARN_ON(1);
> +
> +	return 0;
> +}
> +
> +#endif /*IS_REACHABLE(CONFIG_RPMSG_CHAR) */
> +
> +#endif /*__RPMSG_CHRDEV_H__ */
> -- 
> 2.17.1
> 
