Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA746C433B4
	for <linux-remoteproc@archiver.kernel.org>; Fri,  7 May 2021 22:03:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A76B61057
	for <linux-remoteproc@archiver.kernel.org>; Fri,  7 May 2021 22:03:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhEGWEX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 7 May 2021 18:04:23 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:39447 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbhEGWEX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 7 May 2021 18:04:23 -0400
Received: by mail-ot1-f44.google.com with SMTP id 65-20020a9d03470000b02902808b4aec6dso9186182otv.6;
        Fri, 07 May 2021 15:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mNMOdckcod4Dgitnzjw7d0BqAxjha7UnOjwSDctI1AM=;
        b=ABiq0ZgvVVVOjtITsLjleYkTiTuRxiztcchiPD4QyagJdNUiWVUo3RhatrawfybiyY
         SlX4c4POsA0otwr0YCnkzgly+as3rT3RUMNaz3VkdklQtLzBqhfO0KGfWqK1hyIVJzAI
         roc2quTPdN9CATyuHMNzI6u4AORIXhiCyNuiEAUL+vWBg+uLXY9V4ya7cddPnorXkjwJ
         d+cbRAoZ2sEGCAlUtu7cN1EBhd/UuxKKjHkx732y+QZfO6mvEQAkz6kS/71iVeWVfMwU
         SfHcw5BNMEuVOLZYyqEsXBDDnKstzdR89MscBFerODcWfZN97AFSf31TXP8vmslCfQbl
         Zt1g==
X-Gm-Message-State: AOAM53165vN/Agy+Emr11POPCBqxZFJGsn0IfOe7IJedtHg0oy1VQFlV
        UYVLiUGqM+T92W80NiPRvQ==
X-Google-Smtp-Source: ABdhPJz1syXNnkXnZ+hGra/92ic0AYgw7gFdFo60L0inBs8aYbe9sCqtTzN0b6E/53yIEafw2uhhtg==
X-Received: by 2002:a9d:12b5:: with SMTP id g50mr10148829otg.97.1620425002783;
        Fri, 07 May 2021 15:03:22 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r9sm1442164otn.64.2021.05.07.15.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 15:03:22 -0700 (PDT)
Received: (nullmailer pid 2974175 invoked by uid 1000);
        Fri, 07 May 2021 22:03:21 -0000
Date:   Fri, 7 May 2021 17:03:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        ohad@wizery.com, robh+dt@kernel.org,
        linux-remoteproc@vger.kernel.org, pillair@codeaurora.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom: pas: Convert binding to
 YAML
Message-ID: <20210507220321.GA2974133@robh.at.kernel.org>
References: <20210505082200.32635-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210505082200.32635-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 05 May 2021 13:52:00 +0530, Manivannan Sadhasivam wrote:
> Convert Qualcomm ADSP Remoteproc devicetree binding to YAML.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../bindings/remoteproc/qcom,adsp.txt         | 228 --------
>  .../bindings/remoteproc/qcom,adsp.yaml        | 534 ++++++++++++++++++
>  2 files changed, 534 insertions(+), 228 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
