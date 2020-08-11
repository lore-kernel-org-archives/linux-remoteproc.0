Return-Path: <SRS0=cP4F=BV=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D55C433E1
	for <linux-remoteproc@archiver.kernel.org>; Tue, 11 Aug 2020 19:56:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9FC920782
	for <linux-remoteproc@archiver.kernel.org>; Tue, 11 Aug 2020 19:56:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qp530flH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbgHKT42 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 11 Aug 2020 15:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgHKT42 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 11 Aug 2020 15:56:28 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA780C061788
        for <linux-remoteproc@vger.kernel.org>; Tue, 11 Aug 2020 12:56:27 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id p1so44214pls.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 11 Aug 2020 12:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jSpZyl6zszveRQTb+X3U9qCb6qt2a47wW3ClpVmbJd4=;
        b=Qp530flHFX5VujI6zk3JRpc5NHS0opLYWMJdFxardQIeNKy0kHusBV2UjudiK3A/4d
         nhhJ7oBQKZ6dPIgZTqyjIwb2PYjNxf/8dXO0LCpeQh/2qJxRxpIku/gGymanLHhOJsy1
         esS5XOfi4eJ93Bw3t3emRXrWxZh6+lZj0+EUeHdRJovtGI421LpFAVG73OAU8Wm38dwF
         Yvs2LPr7qeBJjl8N6xCV/LmhXVZeZPyhvIcIlVNVdRTRIYsjAprLT0GpUX5pJwMrZyvW
         MwElCRoigXVExeMWpHlCirPTR10nssTPHq+fhb4VqNW4sctT7PS2MvSBfBnd4wuC4mlz
         XWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jSpZyl6zszveRQTb+X3U9qCb6qt2a47wW3ClpVmbJd4=;
        b=uOryk1BqqITeFZLjsn5HduXYc1W8u6lMysRjTP0QJaZMXHpXk0oOy544Pcp6dVlVUK
         Y+JbzWB5WQneWby0CuGs0xy5NTLPeypjWr55qTmAhbt/FYBL9CJETt7Jkf9yq2uZ1xYg
         LCXgCEJn+rAn5ZV95nsSglE4FEjawaBmEvCSNEgqZrfDsBxuJNtb8p5dXV1WFojpx5VW
         l6Wf93lXmsJf8C7QJHWdWE3Gyt/DsTuNlncWJzQnCJQqIjSxOtXR/dvpUN5Yr/yuq/Ru
         Q8nkeKVchaUSP7ZfkiJ1MW5YJf8bf5OZiemOeuNzQ3BUgGVHVLsQID5xvvdeqCuUTHT7
         bXYg==
X-Gm-Message-State: AOAM530kT09eC3331xfmY47xjMxE5wpoCTlULdl0AWAgOK6lvBlkWa3a
        y5XujK9BQFjsU3OyT53OuI9yXl0dFPA=
X-Google-Smtp-Source: ABdhPJzEvYm0TmVimHvXEGe/uKF0y2jzt+VsiVIHOLfRm4O0wA7RC6raA0fGG6z0aao+n1UTTAZFJw==
X-Received: by 2002:a17:90a:9f44:: with SMTP id q4mr2826417pjv.66.1597175787041;
        Tue, 11 Aug 2020 12:56:27 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id h24sm21487728pgi.85.2020.08.11.12.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 12:56:26 -0700 (PDT)
Date:   Tue, 11 Aug 2020 13:56:24 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     bjorn.andersson@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 02/10] remoteproc: imx_rproc: correct err message
Message-ID: <20200811195624.GA3370567@xps15>
References: <20200724080813.24884-1-peng.fan@nxp.com>
 <20200724080813.24884-3-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200724080813.24884-3-peng.fan@nxp.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jul 24, 2020 at 04:08:05PM +0800, Peng Fan wrote:
> It is using devm_ioremap, so not devm_ioremap_resource. Correct
> the error message and print out sa/size.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 8957ed271d20..3b3904ebac75 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -268,7 +268,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev,
>  						     att->sa, att->size);
>  		if (!priv->mem[b].cpu_addr) {
> -			dev_err(dev, "devm_ioremap_resource failed\n");
> +			dev_err(dev, "devm_ioremap sa:0x%x size:0x%x failed\n", att->sa, att->size);

I'm good with fixing the devm_ioremap part but please remove the address and
size.  Printing them provides little value because they come from the device
configuration area that is private to the driver.  That way we don't expose
system information involuntarily. 

With that:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  			return -ENOMEM;
>  		}
>  		priv->mem[b].sys_addr = att->sa;
> -- 
> 2.16.4
> 
