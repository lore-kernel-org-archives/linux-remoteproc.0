Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 387BFEB64DC
	for <linux-remoteproc@archiver.kernel.org>; Mon, 17 Jul 2023 17:34:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbjGQRe5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 17 Jul 2023 13:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbjGQReq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 17 Jul 2023 13:34:46 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EABCE1735
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Jul 2023 10:34:38 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-666ed230c81so4927130b3a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Jul 2023 10:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689615278; x=1692207278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dY/bKQhYLiqziai543FPa4bdBPuQhVrSABQRER0pkAA=;
        b=CzzO1UVmFSsJKWOy2kEtRTQBmaii38fNH/tiE9eh+1JQOvxM7H0FH5QeUcoRf7RBes
         7NrjRO7iLl5L3tASdtSROv9xyITqvUiEJJ2ZpFITl3YXRQBEHBSiFpw4taaCKl07i7MK
         mDYKrEBz4WrxLDltIj0AaYblClBXROPBy5Mv3EnwFvdk05us3Luf3nHX6RT3lHm5HquR
         /LW2UAoIqJ7sIwAdZ87RARWHGvLs7JfEzqL7gWOTvGZmarc50/uws5C3H+fHVDsLwWgB
         Oc26EhALQGbjQuFJLzRvSKudyne+Vz3VOvGk7d2MmEi65r3mqZCxHcVoSs4JAJKUJtp8
         XqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689615278; x=1692207278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dY/bKQhYLiqziai543FPa4bdBPuQhVrSABQRER0pkAA=;
        b=K3oGjcX96ejUF36sdlHCUXBgiFRe/HE3WOBHUt8BQc28HFZpQ6qyUEuYb8olTMIf8M
         PWorQHDGn0stzRX2G7PBCAnwXPii/ocvSZ179SkH+VwGpqqlG4jpssI+9E7o4XDZZ5bX
         2TbcM7M8T961+EqLbhf0vNfMGAlsxPZctVUWKeJEK9Dja0rZ0mnDX3jyVvd71RHur1j1
         67ZYeCTf4KcB0yp7ULZ1DF2wFVxGlWBIyREHwCekn0u6fXn/wzH3n9cDK33/MPh1JBtb
         sCuCU8ZnFbqjp60AxMUD3uucil8CUMb86wjurvVd9s8FB71WItpO38NLnbXg4ymt1I/F
         FHyQ==
X-Gm-Message-State: ABy/qLarss/K0Oa2Jyq31DdS9IwPlRC/6vI9HYhY/ppaRPOFcTzeaJNp
        gu2uYggOeQbyv0GgvEQO7i3/ZA==
X-Google-Smtp-Source: APBJJlHollXH/LMo0nBnBl8Njq/KUWEOy1sur5Y6TmKgvmsEoUxKdbtwJI4Fbu8pQb03mNHnf7sc2A==
X-Received: by 2002:a05:6a20:6a0b:b0:135:6ef6:171 with SMTP id p11-20020a056a206a0b00b001356ef60171mr70712pzk.39.1689615277969;
        Mon, 17 Jul 2023 10:34:37 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3328:146c:de53:b695])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b0063a04905379sm75391pfd.137.2023.07.17.10.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 10:34:37 -0700 (PDT)
Date:   Mon, 17 Jul 2023 11:34:35 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "S.J. Wang" <shengjiu.wang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Mpuaudiosw <Mpuaudiosw@nxp.com>,
        Iuliana Prodan <iuliana.prodan@nxp.com>,
        linux-imx <linux-imx@nxp.com>, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        LnxRevLi <LnxRevLi@nxp.com>
Subject: Re: [PATCH 2/2] remoteproc: imx_dsp_rproc: add module parameter to
 ignore ready flag from remote processor
Message-ID: <ZLV7q9ipDaw4b1Hi@p14s>
References: <20230712224251.26482-1-iuliana.prodan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230712224251.26482-1-iuliana.prodan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Iuliana,

On Thu, Jul 13, 2023 at 01:42:51AM +0300, Iuliana Prodan (OSS) wrote:
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
> 
> There are cases when we want to test samples that do not
> reply with FW READY message, after fw is loaded and the
> remote processor started.

This seems like a bug to me - where is this FW comes from?

> In these cases, do not wait for a confirmation from the remote processor
> at start.
> 
> Added "ignore_dsp_ready" flag while inserting the module to ignore
> remote processor reply after start.
> By default, this is off - do not ignore reply from rproc.
> 
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> 
> ---
> This was discovered while testing openamp_rsc_table sample from Zephyr
> repo (https://github.com/zephyrproject-rtos/zephyr/tree/main/samples/subsys/ipc/openamp_rsc_table).
> 
> We have IPC, but the remote proc doesn't send a FW_READY reply.
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index b5634507d953..ed89de2f3b98 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -36,7 +36,13 @@ module_param_named(no_mailboxes, no_mailboxes, int, 0644);
>  MODULE_PARM_DESC(no_mailboxes,
>  		 "There is no mailbox between cores, so ignore remote proc reply after start, default is 0 (off).");
>  
> +static unsigned int imx_dsp_rproc_ignore_ready;
> +module_param_named(ignore_dsp_ready, imx_dsp_rproc_ignore_ready, int, 0644);
> +MODULE_PARM_DESC(ignore_dsp_ready,
> +		 "Ignore remote proc reply after start, default is 0 (off).");
> +
>  #define REMOTE_IS_READY				BIT(0)
> +#define REMOTE_IGNORE_READY_REPLY	BIT(1)
>  #define REMOTE_READY_WAIT_MAX_RETRIES		500
>  
>  /* att flags */
> @@ -296,6 +302,12 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
>  	if (!priv->rxdb_ch)
>  		return 0;
>  
> +	/*
> +	 * FW_READY reply is optional/ignored, so don't wait for it.
> +	 */
> +	if (priv->flags & REMOTE_IGNORE_READY_REPLY)
> +		return 0;
> +
>  	for (i = 0; i < REMOTE_READY_WAIT_MAX_RETRIES; i++) {
>  		if (priv->flags & REMOTE_IS_READY)
>  			return 0;
> @@ -1119,6 +1131,9 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
>  	else
>  		imx_dsp_rproc_mbox_init = imx_dsp_rproc_mbox_alloc;
>  
> +	if (imx_dsp_rproc_ignore_ready)
> +		priv->flags |= REMOTE_IGNORE_READY_REPLY;
> +
>  	dev_set_drvdata(dev, rproc);
>  
>  	INIT_WORK(&priv->rproc_work, imx_dsp_rproc_vq_work);
> -- 
> 2.17.1
> 
