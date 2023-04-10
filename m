Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C37C77B61
	for <linux-remoteproc@archiver.kernel.org>; Mon, 10 Apr 2023 17:44:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbjDJRoP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 10 Apr 2023 13:44:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbjDJRoO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 10 Apr 2023 13:44:14 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FA5126B9
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Apr 2023 10:44:13 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id m18so5215798plx.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Apr 2023 10:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681148653;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yWQNPjxOiH9ikIbp275JanF40njNYNR09cvqLl6jQAE=;
        b=sFZiOJlR/azM1KLSZuC4d6gGG/o4LsLQldk2wiRC/oJSCDKReSANURRkcHhJRjUGuo
         H/c5rEyrx9HHs8+u8Sy78D7L+5xreTcsA+Q9HJPJq05QMQvaRgmJ2p1nyab1jzHhnSoy
         FZEyJM6XhjLXOHrSqVZgf7OIq6LK/HImYa4g3MxPlfoY1aZIU+APRSPTjoLnVtI88OrT
         8NMRwNrfqXkZ1gMWcijAL94AnZBBMmg6mJrifl7ZRougbsRc7l4b5zS9AEwNpw4diQgI
         Ui9aClbn6XG4G1ut+BTlF3CXakefy3trXxSqQZ2tITeG6l/FDCAFGWAkV8PTpDMD/Sit
         WDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681148653;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yWQNPjxOiH9ikIbp275JanF40njNYNR09cvqLl6jQAE=;
        b=mFKYvoIYRxLAOPdf29xlW5dXfYcvt5LCAbDKlGEDSS40xQ0ynSS9E3pEQ5DbBiUhcD
         U3W/qob9ntOEsKHwl0gZAMRrOJLVES6JIpZY8SH+d5hrG5PuL+kvQsWYAJYYcKOMHIqM
         rBTNRjF+YDKzb8hm7qDfUcvOUBy1OnLa/kOoYL5yUXKRWwPj2DuyWWsPcYBkJgEcrHnX
         exP5GXLpg/7/Pqy/u9tupxwTzDOW2MxaX83ZnR8/QGT1sac64iGtT70XrTN8B28ZpjML
         2DNyWQrLCan7f2EsHjmjdg+iIpqW9elMOMDpoALCmD6ZQfZp0/7RO7w8usEtN2pomcrw
         FN/A==
X-Gm-Message-State: AAQBX9eZRhE1gqWwus5jpb9CcxSe4lVLX8nBBCSXeOdUha/xlWwfTLTI
        ZCmhS8qaNCQ+rCw/zWzFIVyOEg==
X-Google-Smtp-Source: AKy350a0UqbFHqt+Sl9q/bhoxYb7h3/xxccDs8RVv+EDn0SI5G+SHERF4W6kDbcDz5ySUIJzae8ALQ==
X-Received: by 2002:a17:90a:bb89:b0:246:5780:ccf8 with SMTP id v9-20020a17090abb8900b002465780ccf8mr10743326pjr.4.1681148653018;
        Mon, 10 Apr 2023 10:44:13 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:cecd:b1ee:70ec:874])
        by smtp.gmail.com with ESMTPSA id t15-20020a17090ae50f00b0023377b98c7csm7753977pjy.38.2023.04.10.10.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 10:44:12 -0700 (PDT)
Date:   Mon, 10 Apr 2023 11:44:10 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     kernel-janitors@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        kernel@pengutronix.de, Bjorn Andersson <andersson@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, cocci@inria.fr,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] remoteproc: imx_dsp_rproc: Improve exception handling in
 imx_dsp_rproc_mbox_alloc()
Message-ID: <20230410174410.GB4129213@p14s>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <8f785de5-ebe2-edd9-2155-f440acacc643@web.de>
 <d0e18bb1-afc4-8b6f-bb1c-b74b3bad908e@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0e18bb1-afc4-8b6f-bb1c-b74b3bad908e@web.de>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Apr 06, 2023 at 10:12:50PM +0200, Markus Elfring wrote:
> Date: Thu, 6 Apr 2023 22:00:24 +0200
> 
> The label “err_out” was used to jump to another pointer check
> despite of the detail in the implementation of the function
> “imx_dsp_rproc_mbox_alloc” that it was determined already
> that the corresponding variable contained an error pointer
> because of a failed call of the function “mbox_request_channel_byname”.
> 
> Thus perform the following adjustments:
> 
> 1. Return directly after a call of the function
>    “mbox_request_channel_byname” failed for the input parameter “tx”.
> 
> 2. Use more appropriate labels instead.
> 
> 3. Reorder jump targets at the end.
> 
> 4. Omit a function call and three extra checks.
> 
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
>

Applied

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 21759d9e5b7b..a8ad15ef1da0 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -530,7 +530,7 @@ static int imx_dsp_rproc_mbox_alloc(struct imx_dsp_rproc *priv)
>  		ret = PTR_ERR(priv->tx_ch);
>  		dev_dbg(cl->dev, "failed to request tx mailbox channel: %d\n",
>  			ret);
> -		goto err_out;
> +		return ret;
>  	}
> 
>  	/* Channel for receiving message */
> @@ -539,7 +539,7 @@ static int imx_dsp_rproc_mbox_alloc(struct imx_dsp_rproc *priv)
>  		ret = PTR_ERR(priv->rx_ch);
>  		dev_dbg(cl->dev, "failed to request rx mailbox channel: %d\n",
>  			ret);
> -		goto err_out;
> +		goto free_channel_tx;
>  	}
> 
>  	cl = &priv->cl_rxdb;
> @@ -555,19 +555,15 @@ static int imx_dsp_rproc_mbox_alloc(struct imx_dsp_rproc *priv)
>  		ret = PTR_ERR(priv->rxdb_ch);
>  		dev_dbg(cl->dev, "failed to request mbox chan rxdb, ret %d\n",
>  			ret);
> -		goto err_out;
> +		goto free_channel_rx;
>  	}
> 
>  	return 0;
> 
> -err_out:
> -	if (!IS_ERR(priv->tx_ch))
> -		mbox_free_channel(priv->tx_ch);
> -	if (!IS_ERR(priv->rx_ch))
> -		mbox_free_channel(priv->rx_ch);
> -	if (!IS_ERR(priv->rxdb_ch))
> -		mbox_free_channel(priv->rxdb_ch);
> -
> +free_channel_rx:
> +	mbox_free_channel(priv->rx_ch);
> +free_channel_tx:
> +	mbox_free_channel(priv->tx_ch);
>  	return ret;
>  }
> 
> --
> 2.40.0
> 
