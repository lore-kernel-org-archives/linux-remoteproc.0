Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA16C433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Sep 2021 17:47:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 767A060E52
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Sep 2021 17:47:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbhINRs4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Sep 2021 13:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbhINRsz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Sep 2021 13:48:55 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B25C061574
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Sep 2021 10:47:38 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id nn5-20020a17090b38c500b0019af1c4b31fso151284pjb.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Sep 2021 10:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qNpmfocRQgc6fMij3WcOQJkyWY3Uzb6MR8R5s1ErrCg=;
        b=KPCtsR38LKdUoGcNa9GMqU/wR3GKGsaGwGVWLrf7cTsNP0tMwfHxiVnXeNBD+J0bAR
         OHt4glvZNHZEuQOxJxkSV+mHRlUouRr5v75HCVBtg55LVtrbl0JZYNZmWf9abdpTZ1fT
         dj9O41H7PaVBseG2hxBbfB6v157CkHzc4Y/Ea6KgpQ0sVUXicjK75+Zga8zquLhgUCKA
         Ja7hIRiZ5TLpu5k4poKYNPfN7e81zIYxp3lGPNvTTzmCT2OHek/ME9QQOHOLa7VmD/50
         yISaCDIX6r0w38d0AMn+uFFne4g8Tl7IaEmMbyF9Sto+JeSPDSlxK6/PP9RoG8JJ6ow7
         WTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qNpmfocRQgc6fMij3WcOQJkyWY3Uzb6MR8R5s1ErrCg=;
        b=0DpHqmyIxEjpc9sS0qQywwTc9HnuVx6J/g8hyCjK1LqH9iLOv2h+t9m1l/Rgi6wh9K
         3EOfoiRknzfoAgxnlnPhcn6JBK9Lff9gP8jf66WiQk3U2VfhhWeLRknmiYMU+U9A6a9n
         0VxZvzzbBRFmoNRGXeou5RzEhNCdx8omhziDbnx46OFcjfaftQmK+mqQvG6qe2c2If4Y
         6dfKwTEHQF9rvkTSwxON2ubUF0cEc/g4dVBIjS0u6kCbb29Lo2KNFZPo5nsrlNLvmULt
         jTA7AoIHzZG/v2lCN8589F1em90YUJLfelQh5HZ6Y+T8W3kyVMgCyWryncdyd0IY4TEX
         Tvjg==
X-Gm-Message-State: AOAM530L8bXxPauJHLGhes4j0XPgJ8cvGkX0El9e/8vFmzQx6le3BEF2
        zg8CvOxyEF81/s+9aEISjOg3Zw==
X-Google-Smtp-Source: ABdhPJw3+2cqCp32kqlVBigVqINzGynUgq9CRlUWcOXHDpqwoO/bewGBpusqKzF/M2PyOYPCRpivjw==
X-Received: by 2002:a17:902:dacc:b0:135:960b:1754 with SMTP id q12-20020a170902dacc00b00135960b1754mr15957252plx.77.1631641657742;
        Tue, 14 Sep 2021 10:47:37 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id x15sm11970896pgt.34.2021.09.14.10.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 10:47:36 -0700 (PDT)
Date:   Tue, 14 Sep 2021 11:47:34 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, daniel.baluta@nxp.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        shengjiu.wang@gmail.com
Subject: Re: [PATCH v4 2/4] remoteproc: imx_rproc: Add IMX_RPROC_SCU_API
 method
Message-ID: <20210914174734.GC1719994@p14s>
References: <1631092255-25150-1-git-send-email-shengjiu.wang@nxp.com>
 <1631092255-25150-3-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1631092255-25150-3-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Sep 08, 2021 at 05:10:53PM +0800, Shengjiu Wang wrote:
> On i.MX8QM and i.MX8QXP, most devices are controlled
> by System Control Unit, so add IMX_RPROC_SCU_API
> method for these platform.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index 23d8e808d27f..1c7e2127c758 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -22,6 +22,8 @@ enum imx_rproc_method {
>  	IMX_RPROC_MMIO,
>  	/* Through ARM SMCCC */
>  	IMX_RPROC_SMC,
> +	/* Through System Control Unit API */
> +	IMX_RPROC_SCU_API,

So much better now...

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  };
>  
>  struct imx_rproc_dcfg {
> -- 
> 2.17.1
> 
