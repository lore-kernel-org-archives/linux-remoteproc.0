Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F46C433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Sep 2021 20:00:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED92D611CA
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Sep 2021 20:00:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237276AbhIVUCV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 22 Sep 2021 16:02:21 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:39611 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230384AbhIVUCU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 22 Sep 2021 16:02:20 -0400
Received: by mail-oi1-f178.google.com with SMTP id a3so6229081oid.6;
        Wed, 22 Sep 2021 13:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fwXUy/4JQhmCnPcoi619P8tFhIeQmBOPJ5tYoHnaW7E=;
        b=s7u37SBNzrAcduAuJcS941MaCbMuRR/GOgF91OAz5FfNvHrgfHpJUqKjQTKn5LM1PN
         ulNo0dyNgPyGhMMi2U53qT7s5BeHPBxegZ3Pyqm1hHhI4Qj/8faW/N7bhH6GfzawApRP
         lLTtfAeg6VLdxZTIt/O08VXD15dVuQqay1X8nFC/GBB9uhKlqy8Ycr3MWRpO013NJ4/4
         5qfZcpdqrc88XOUnPNUAQSDLoaTeoLDkjlmZAK3BERwOn273qRHK/XiHYDmXl/6oxNCR
         xXLHJ3fsuMOq5oYE7DO5t/v+OPukZoGo9VoYwvaed4LupPhGD0l6m1puRGpk1jki9sWw
         xyZw==
X-Gm-Message-State: AOAM533SmcX7Mp/XSag+OgFOkxWx/qJBYeS+pfd3UTKlAHlQZ/i8vzF7
        B8YG5rcgLdZ5ZOZo/GpdPQ==
X-Google-Smtp-Source: ABdhPJyFIHodX4xu/23e9sLcEMzMa1d5rbnTChn7GY2GUzktBRQcDb9QrYIrG6FOyhIVYy1l2ejm+A==
X-Received: by 2002:a05:6808:8d2:: with SMTP id k18mr801632oij.62.1632340850100;
        Wed, 22 Sep 2021 13:00:50 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 21sm749993oij.39.2021.09.22.13.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:00:49 -0700 (PDT)
Received: (nullmailer pid 1195776 invoked by uid 1000);
        Wed, 22 Sep 2021 20:00:48 -0000
Date:   Wed, 22 Sep 2021 15:00:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sinthu Raja <sinthu.raja@mistralsolutions.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        devicetree@vger.kernel.org, Suman Anna <s-anna@ti.com>,
        Sinthu Raja <sinthu.raja@ti.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH V3 2/2] dt-bindings: remoteproc: k3-dsp: Remove
 board-specific compatible from DT example
Message-ID: <YUuLcDiBsS6urSm2@robh.at.kernel.org>
References: <20210917095426.19277-1-sinthu.raja@ti.com>
 <20210917095426.19277-3-sinthu.raja@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210917095426.19277-3-sinthu.raja@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 17 Sep 2021 15:24:26 +0530, Sinthu Raja wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> The example includes a board-specific compatible property, this is
> wrong as the example should be board agnostic and gets in the way of
> additions for newer platforms. Replace the same with a generic soc
> node.
> 
> Fixes: 2a2180206ab6 ("dt-bindings: remoteproc: Add bindings for C66x DSPs on TI K3 SoCs")
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
> 
> Changes since V2:
> * review comment updates, including simplifying the changes, commit
>   message and $subject updates.
> 
> V2: https://lore.kernel.org/all/20210818074030.1877-1-sinthu.raja@ti.com/
> V1: https://lore.kernel.org/all/20210817152005.21575-1-sinthu.raja@ti.com/
> 
>  .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml       | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
