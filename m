Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B98C64E7C
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Dec 2020 20:35:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB737221FA
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Dec 2020 20:35:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbgLBUfu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 2 Dec 2020 15:35:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726194AbgLBUfu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Dec 2020 15:35:50 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50093C0613D6
        for <linux-remoteproc@vger.kernel.org>; Wed,  2 Dec 2020 12:35:10 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id e5so1696276pjt.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Dec 2020 12:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DJDfzlDfTnrfdlzBEpegCQHAti8FUO1LnfZw8Lau0fQ=;
        b=C+knjGEmhK41qutbbphKO4J4NrbDW26y9QH8+LHd7EvKLqHCEGkkZYe9M7SJC+NvAu
         YVrc7DgTKBl37RvOJxMjZviMbl7E+EEL0hdzztKsNBNyUl4s03BKBfhsul1YimNxANz1
         LohNMAcwL1tVXDnsMGnR9Wrx42jw/NWJHx40rRZgoL6FKb2D2XDwDsivMHh8kQPh04QM
         iDcLelQl2Q7KQcZkUdPB816L6bCqkzZ8JGpC3PXzStS5bnsoubKMx+he6VaN80K1WtCF
         rOti1lK98j6v4q3HH2GbKZYf+misH2waveH8dqTNNS9Yzfbq+tlb8Jr2UihrwfAapKzX
         YEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DJDfzlDfTnrfdlzBEpegCQHAti8FUO1LnfZw8Lau0fQ=;
        b=tW5r/4BpuheExbvKqzpcq8W9oAdpgsD/eRJN0I4pYqyLpwXvbry4XgFsZqsOu9N7P3
         3ySLB3JNo1z0Pk8IXUgbFt+TT9SlonskATc/Xq0+XKCyL7PhoDdOIdKsGzTPWtBfQQW4
         7klt2Hfbcw2RcDKlqKUNukDKH44oMsCxZr5bkI4vkdVppFxUTKwHd6CSf1Rit/ZZSkxI
         RFtHLpgu20bUiOFtQOUJcuclhbmsNEKvwxJaT1og973+ROhGRDIwx0dXGecIRpm5SPtX
         774Xt8xPokB2WpwmZ5689l8pfmTHGPGjumClUQoGLZrwzmuM4/IYrUdcYtILuDWtICER
         QEQA==
X-Gm-Message-State: AOAM532q7D6fxDoukKm8Cefsixw9RfiPOTAyv5ftrFFHliHfTUqN/URC
        zwArqmno4wvS9tfTtHc+sgNrmA==
X-Google-Smtp-Source: ABdhPJzMsAlGSS2amauxNUiGiVKwN3GZ0vcFO+QU6J+ByDlC0KcIIuBQu6P71TTmuB9sxoB2samOuA==
X-Received: by 2002:a17:90a:bd16:: with SMTP id y22mr1465841pjr.203.1606941309922;
        Wed, 02 Dec 2020 12:35:09 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id b20sm553096pfi.218.2020.12.02.12.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 12:35:09 -0800 (PST)
Date:   Wed, 2 Dec 2020 13:35:07 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, pihsun@chromium.org
Subject: Re: [PATCH] remoteproc/mediatek: unprepare clk if scp_before_load
 fails
Message-ID: <20201202203507.GB1282360@xps15>
References: <20201202044537.2500497-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202044537.2500497-1-tzungbi@google.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Dec 02, 2020 at 12:45:37PM +0800, Tzung-Bi Shih wrote:
> Fixes the error handling to unprepare clk if scp_before_load fails.
> 

This requires a "Fixes:" tag.

> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 5f42b9ce7185..c7d49c861adb 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -350,11 +350,11 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
>  
>  	ret = scp->data->scp_before_load(scp);
>  	if (ret < 0)
> -		return ret;
> +		goto leave;
>  
>  	ret = scp_elf_load_segments(rproc, fw);
> +leave:
>  	clk_disable_unprepare(scp->clk);
> -

Unneeded change

Thanks,
Mathieu

>  	return ret;
>  }
>  
> -- 
> 2.29.2.454.gaff20da3a2-goog
> 
