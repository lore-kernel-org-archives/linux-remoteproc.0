Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7AD9C433E9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Mar 2021 16:23:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A45DE64F34
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Mar 2021 16:23:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232079AbhCOQW6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 15 Mar 2021 12:22:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231626AbhCOQW1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 15 Mar 2021 12:22:27 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 149BEC06175F
        for <linux-remoteproc@vger.kernel.org>; Mon, 15 Mar 2021 09:22:27 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id g4so20763324pgj.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 15 Mar 2021 09:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4OgT1op5pKi9FPa9H6iNM9XBtjK1+8GfQ3rJ+7I0hzg=;
        b=HPFxk1Zjce149T/5GYwsq4vVi8kl7RSBQGKUGvT9NymyCL5rp01UP+ZpzYZMmRE16S
         YRbQ0a+dbcjFaOLrI3Z/iCOPI9UJw/1Mmq8BqVjt5LeT2rzixpuYHVcKZdBNTxfg1vDe
         5Ot1ZXVlFg+HFGZLFoW8wepjsxCuuqh5IB2LmywdIODSk8EoXFu1Ctb3aWZ0OKcI2OIJ
         Ih5jrY6ATdw1GDi/K8ZFtT1+wC49lt/JSzL+PJXdCwPowLZaErwogcAetcnMy7o495Cz
         TZ9WOyfUXU/haFnwb4NLfk0y+lIASQnzn7eVpMgv2tu51NxucboE/FP0t2PLcZJs6576
         XeRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4OgT1op5pKi9FPa9H6iNM9XBtjK1+8GfQ3rJ+7I0hzg=;
        b=YI7BP9GsyN3ZgDjFcKmWo/F+OvJD+DSRIAm6pevAUg90BJ8u2WCqBT6eeyRKd1FIHJ
         z05+/7tf/qAXPmCP4uK9/BI0cmv5ooqD7sg7jlhAmsv1VfIOVvwoMpkFPzucqB1ZJIjC
         amZJAOo6J2xOBkvk0fz01Io+TYcthzkG1UBbrKdeU660dxJGBFZy6ut0d3TRDWBdvX0s
         /LWcm15HVvltOPwZr556N7tjoX+BfUAVTe6PAdjHOMkdFyEEDgGi2Qi2UMzP4y7rFS/j
         AytZY/Owl6nR9Em8mV5DvWDKBGsxTssfH5uFHiCrWnFe99pt+D0bjgpbbfj3I9qSsZij
         9w0A==
X-Gm-Message-State: AOAM530ZX7nGkAqws8jagaxUDuy1EUrSQGS94oRx2LMd34RaxpdKaffA
        rg519LDwIPzFVf9P0VipnGGuGw==
X-Google-Smtp-Source: ABdhPJwTkkx4r53sv5pqh1F/+EV63pgm09PHYplM3kJLusGQI94sZ6ELMpBINgkwEsze/alAmXWY8Q==
X-Received: by 2002:a63:c84a:: with SMTP id l10mr294989pgi.159.1615825346568;
        Mon, 15 Mar 2021 09:22:26 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id d19sm81935pjs.55.2021.03.15.09.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 09:22:25 -0700 (PDT)
Date:   Mon, 15 Mar 2021 10:22:24 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Provide errors for
 firmware-name parsing
Message-ID: <20210315162224.GB1339147@xps15>
References: <20210312002605.3273255-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312002605.3273255-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Mar 11, 2021 at 04:26:05PM -0800, Bjorn Andersson wrote:
> Failing to read the "firmware-name" DT property without informing the
> developer is annoying, add some helpful debug prints.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 66106ba25ba3..15abfbba78d2 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1661,8 +1661,10 @@ static int q6v5_probe(struct platform_device *pdev)
>  	mba_image = desc->hexagon_mba_image;
>  	ret = of_property_read_string_index(pdev->dev.of_node, "firmware-name",
>  					    0, &mba_image);
> -	if (ret < 0 && ret != -EINVAL)
> +	if (ret < 0 && ret != -EINVAL) {
> +		dev_err(&pdev->dev, "unable to read mba firmware-name\n");
>  		return ret;
> +	}
>  
>  	rproc = rproc_alloc(&pdev->dev, pdev->name, &q6v5_ops,
>  			    mba_image, sizeof(*qproc));
> @@ -1680,8 +1682,10 @@ static int q6v5_probe(struct platform_device *pdev)
>  	qproc->hexagon_mdt_image = "modem.mdt";
>  	ret = of_property_read_string_index(pdev->dev.of_node, "firmware-name",
>  					    1, &qproc->hexagon_mdt_image);
> -	if (ret < 0 && ret != -EINVAL)
> +	if (ret < 0 && ret != -EINVAL) {
> +		dev_err(&pdev->dev, "unable to read mpss firmware-name\n");
>  		goto free_rproc;
> +	}

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  
>  	platform_set_drvdata(pdev, qproc);
>  
> -- 
> 2.29.2
> 
