Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A90C433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 23 Sep 2021 13:09:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 280436103D
	for <linux-remoteproc@archiver.kernel.org>; Thu, 23 Sep 2021 13:09:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241141AbhIWNLA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 23 Sep 2021 09:11:00 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:42578 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232333AbhIWNLA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 23 Sep 2021 09:11:00 -0400
Received: by mail-ot1-f50.google.com with SMTP id 67-20020a9d0449000000b00546e5a8062aso8371807otc.9;
        Thu, 23 Sep 2021 06:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P+k54S/P1ruPyomATuQ9wpcwPryDuiOzPX+x0uQYZM8=;
        b=1xzLiOlQIjfL9bj3IExlYyUod8Xy4zBH5Emp6indRSvcgQhRasb7FNOc4IQt6Lakaz
         CeyD+221GwCgor87H990SRlBfEI5Y01pE7pLXRsHbioz+qKIYR4kB/S3ubBlykMos61h
         TOe/+o7bsX6LzHJAz9sRIc/7YMMTHS+jy/p4TRthkW4w7GgDHLQn09+G0nmYNcAkexjc
         Fr9z0LqRrf2Q4WZzPOQer2N0N9nzKYboRvgacB6sntpopY42cWkK1P5zYil9lINugIxu
         xj7WYYs64i5WU9GkSLTC7B2VCYWqH5EJN1dFu8U4kE5NOXmYOENaSuRV08rsz4JtvGye
         28Ew==
X-Gm-Message-State: AOAM531mgmHeBcQtwuLjza2hfucEWVGoScp+XwnMchdzJrNCcqf877o1
        KvYdu2iGBHmB1/HYChovqA==
X-Google-Smtp-Source: ABdhPJymvzXngT2wLrig0Tguwcl6rfrs40bQiUrF56ZPa2rCMEXIw+KK1Xc2LiYxMkPV+mz4mNng7A==
X-Received: by 2002:a9d:a47:: with SMTP id 65mr3860534otg.133.1632402568692;
        Thu, 23 Sep 2021 06:09:28 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id y84sm1329579oie.16.2021.09.23.06.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 06:09:28 -0700 (PDT)
Received: (nullmailer pid 2858849 invoked by uid 1000);
        Thu, 23 Sep 2021 13:09:27 -0000
Date:   Thu, 23 Sep 2021 08:09:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sinthu Raja <sinthu.raja@mistralsolutions.com>
Cc:     linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Suman Anna <s-anna@ti.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Ohad Ben-Cohen <ohad@wizery.com>, Nishanth Menon <nm@ti.com>,
        Sinthu Raja <sinthu.raja@ti.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH V3] dt-bindings: hwlock: omap: Remove redundant binding
 example
Message-ID: <YUx8h0MTHg+TMG3z@robh.at.kernel.org>
References: <20210920123152.32751-1-sinthu.raja@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210920123152.32751-1-sinthu.raja@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 20 Sep 2021 18:01:52 +0530, Sinthu Raja wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> The example includes a board-specific compatible property, this is wrong
> as the example should be board agnostic and should represent the particular
> binding. Also, the file includes two similar examples but with a different
> compatible. So, drop the entire second example
> 
> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> 
> ---
> 
> Changes in V3:
> Addressed review comment, that includes adding Suggested By: tag to the
> commit message
> 
> V2: https://lore.kernel.org/all/20210917170805.5079-1-sinthu.raja@ti.com/
> V1: https://lore.kernel.org/all/20210917094740.18891-1-sinthu.raja@ti.com/
> 
>  .../bindings/hwlock/ti,omap-hwspinlock.yaml   | 33 +------------------
>  1 file changed, 1 insertion(+), 32 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
