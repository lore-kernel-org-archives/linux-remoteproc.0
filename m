Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74243EB64D9
	for <linux-remoteproc@archiver.kernel.org>; Tue, 27 Jun 2023 22:39:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbjF0Wjd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 27 Jun 2023 18:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbjF0Wja (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 27 Jun 2023 18:39:30 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BAD02139
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Jun 2023 15:39:23 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-676f16e0bc4so1955770b3a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Jun 2023 15:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687905563; x=1690497563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JZGhAhIzfGUZ5jvLLPvwW9bXE1PlUJT6q1LYW9RbmeA=;
        b=K2tQkI6tJeFmedSnKnrAERFOE4bgmBgdliT3OeCdnrGIVgejVCv6UIq9RuljmPtdc5
         ryTYQ48f4vKrxx2p40gw+z+wb58ai720OZZM5bik4nqGdX2G28WofbJ3Qv7OltUnLEU+
         aVif9LwDbrFcOJoan44HwewjTk0Kpqv9GgXDhNA5MsN0KKBp0fzauGPuipOuCiy0xvS6
         TPCff7d76LBMrtXfiMYR66112kfv14AoSbbfg6kJNy5PTLwvx+sTcVMHSrdi4mt6qCi9
         AnMIGcRzf04VxH8HL7xTZL8C60XAuNhMS45S9Nt4lwiSrkIYCEZ7HrfHvl13cqNyvskx
         fhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687905563; x=1690497563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZGhAhIzfGUZ5jvLLPvwW9bXE1PlUJT6q1LYW9RbmeA=;
        b=N/1+L8CaC6U97h+T+wQ2b/ojDuvnONVbmPk/bNjX0Cgj6IGlLVvmDsut8IwAnWev1S
         b3W7r7DDExamQOy6hB2/Lb2HVKDL/YqerJ8xLmMyJoQFeAgxID+BST2ZzyleXGyUHfGN
         jgRjcbYiXFwr/INNLV3jfz9GTSnh+h+nMWhtRgWw4y9xZlGLDohkTD4PgWgQdZVbokrt
         QIcZSK0JPuEPlttb1RLiINANXZGOBLTcOrTvUyohR7KY6jY5pVbZ/pu73yM7fGIA+AwF
         K3bqAa+d98VmP8188L0YzhFNycPxif6zZVki7YQHqsIlq4kkxpjL7t8DJ6HzMCymi2YK
         fYqg==
X-Gm-Message-State: AC+VfDy8iicOia8Z43HpxlTQcVZE5rmNXiOfxiJ/EU0mPpCF6ec+I/jl
        Mv0HVwzuaplqPbXPfM8UvmY1yw==
X-Google-Smtp-Source: ACHHUZ6Xwb8IGGHXUoDYmFFsvDwbFCwlXN4ISODmV7ztXiDgFDCZ+xk6Xe77dJLDaH8lFxIeuKmPRA==
X-Received: by 2002:a05:6a00:2394:b0:668:73f5:dce0 with SMTP id f20-20020a056a00239400b0066873f5dce0mr21935921pfc.29.1687905562787;
        Tue, 27 Jun 2023 15:39:22 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:144c:51f7:d15:64a2])
        by smtp.gmail.com with ESMTPSA id j2-20020aa783c2000000b0066a36d7ce9bsm6058415pfn.171.2023.06.27.15.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 15:39:22 -0700 (PDT)
Date:   Tue, 27 Jun 2023 16:39:19 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        daniel.baluta@nxp.com, iuliana.prodan@nxp.com,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: iterate all notifiyids in rx
 callback
Message-ID: <ZJtlF/tzh0ZMXji4@p14s>
References: <20230625123514.4069724-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230625123514.4069724-1-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sun, Jun 25, 2023 at 08:35:14PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The current code has an assumption that there is one tx and one rx
> vring, but it is not always true. There maybe more vrings. So iterate
> all notifyids to not miss any vring events.

Can you be more specific on the use case where more than 2 virqueues are
allocated?  The remoteproc core can handle more than 2 but right now the only
configuration I see doesn't support more than that.

> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index f9874fc5a80f..e3f40d0e9f3d 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -725,13 +725,23 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  	return 0;
>  }
>  
> +static int imx_rproc_notified_idr_cb(int id, void *ptr, void *data)
> +{
> +	struct rproc *rproc = data;
> +
> +	if (rproc_vq_interrupt(rproc, id) == IRQ_NONE)
> +		dev_dbg(&rproc->dev, "no message in vqid: %d\n", id);
> +
> +	return 0;
> +}
> +
>  static void imx_rproc_vq_work(struct work_struct *work)
>  {
>  	struct imx_rproc *priv = container_of(work, struct imx_rproc,
>  					      rproc_work);
> +	struct rproc *rproc = priv->rproc;
>  
> -	rproc_vq_interrupt(priv->rproc, 0);
> -	rproc_vq_interrupt(priv->rproc, 1);
> +	idr_for_each(&rproc->notifyids, imx_rproc_notified_idr_cb, rproc);
>  }
>  
>  static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
> -- 
> 2.37.1
> 
