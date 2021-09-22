Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D77C433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Sep 2021 20:00:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5195D610D1
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Sep 2021 20:00:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237237AbhIVUCF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 22 Sep 2021 16:02:05 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:44929 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237233AbhIVUCE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 22 Sep 2021 16:02:04 -0400
Received: by mail-ot1-f54.google.com with SMTP id h9-20020a9d2f09000000b005453f95356cso5152618otb.11;
        Wed, 22 Sep 2021 13:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EwBtizBwYUS7ds9KbiJKHwz7O9MWVtZfiCvZdAqS+uk=;
        b=VuXzDACnevhmDPBQoI/TwhhctMErwb4fzPn8zlCOG6RIyi2LclTnaN9t5mytvgr5ED
         kgxdJ6PCqyUJaivZskuGUhZz56+4ZjJuverAjCM6qplRO4ZdCttDEBJZdhmPBPhfB2oK
         2tsHB8cX8HzdyhlURUoSye7whBKahSctd0o3Gk4eAhcPIwTSBydSg1dY4VNzyFEPQL+K
         CDG3/QZkAg/ZK6v1wtvH/Zi41mBWp6yrhqAUlO3p5B8geTyPoZBu/ADsbgj4z1NKgeC8
         4A00HK8WaKA0keyPOOWjxb+bkHA4EJwbO8T5r4bVRhbaf9aBvES9dVsP9XBBSabIj/z/
         Si1g==
X-Gm-Message-State: AOAM531bFa+hc8d2zUXvo4gGH4IzbPuf5Jn5NcQlblpkfG6ouAQG0x5i
        0CSjto8LTz6ULQKYHUyLLA==
X-Google-Smtp-Source: ABdhPJzUAr6u0Xn03mzSpKdylE62vYd8oWZvINoGA3ySF7D2xFE/n6+0zdLvOEr98D5q7f3DARAiAw==
X-Received: by 2002:a05:6830:165a:: with SMTP id h26mr839089otr.301.1632340833970;
        Wed, 22 Sep 2021 13:00:33 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id i4sm730564otj.9.2021.09.22.13.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:00:33 -0700 (PDT)
Received: (nullmailer pid 1195318 invoked by uid 1000);
        Wed, 22 Sep 2021 20:00:32 -0000
Date:   Wed, 22 Sep 2021 15:00:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sinthu Raja <sinthu.raja@mistralsolutions.com>
Cc:     Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
        Sinthu Raja <sinthu.raja@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-kernel@lists.infradead.org, Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: remoteproc: k3-r5f: Remove
 board-specific compatible from DT example
Message-ID: <YUuLYOLVIWzNFzg3@robh.at.kernel.org>
References: <20210917095426.19277-1-sinthu.raja@ti.com>
 <20210917095426.19277-2-sinthu.raja@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210917095426.19277-2-sinthu.raja@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 17 Sep 2021 15:24:25 +0530, Sinthu Raja wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> The example includes a board-specific compatible property, this is
> wrong as the example should be board agnostic. Replace the same with a
> generic soc node.
> 
> Fixes: 5ee79c2ed5bd ("dt-bindings: remoteproc: Add bindings for R5F subsystem on TI K3 SoCs")
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
> 
> Changes in V3: new patch in the series.
> 
>  .../devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml       | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
