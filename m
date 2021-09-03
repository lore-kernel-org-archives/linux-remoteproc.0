Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D89C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri,  3 Sep 2021 16:42:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BA0860FC4
	for <linux-remoteproc@archiver.kernel.org>; Fri,  3 Sep 2021 16:42:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350099AbhICQn2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 3 Sep 2021 12:43:28 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:44763 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350010AbhICQn0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 3 Sep 2021 12:43:26 -0400
Received: by mail-ot1-f43.google.com with SMTP id g66-20020a9d12c8000000b0051aeba607f1so7197511otg.11;
        Fri, 03 Sep 2021 09:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8O553QXkgkuwMMx4xuK2FDXtpoRRzy04IFBIFedvM08=;
        b=oOUDmDdQ55As99vRQpFIYBWFCbUVOjO8RPuQbXk7I7i9r9zvbfmsaWGMfe7TlEFCtx
         s88+1oPCejyzfDjY+mBtr+xcguXCKDT/kcB/yfprF5Osygc97n6rRyD3yTiXiXMl4YP0
         2UUSrj4ZhQy+9xbsB70boNiKwzyKFIwh2kq5KqlAeGXTpQWYdSfiWBRMpCxd/W0n5heu
         qRWT6wBURmFr6rxeE6Ws8CcrtCq1atmSfYAOMzNsS7Qe2e9ebBVeYasSlQ3ukSfWc26v
         woLgklTzUZqWKV241LbFyb8vNK7ebCvBB8Uh4HRf7lJJq/IqU5XnKazFXoQM3Dy7MXre
         Vhqg==
X-Gm-Message-State: AOAM530ZBPeXZv/AXUuHjEqQkWWS7sNw4bjdAJAV1MBgNVAt5uGAnHZK
        yLgUecEBFEfNt9Rg3XC7GQ==
X-Google-Smtp-Source: ABdhPJzKxJLD8KNWNiNHZ69KMIgWnGflhXeTgIUfiWO9M/9ZhqLis9HLwAG+gD/otbkVFIwofxPBCw==
X-Received: by 2002:a9d:798f:: with SMTP id h15mr3923253otm.227.1630687346457;
        Fri, 03 Sep 2021 09:42:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id c24sm1064194otf.71.2021.09.03.09.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 09:42:25 -0700 (PDT)
Received: (nullmailer pid 3071405 invoked by uid 1000);
        Fri, 03 Sep 2021 16:42:24 -0000
Date:   Fri, 3 Sep 2021 11:42:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, kernel@pengutronix.de,
        festevam@gmail.com, shawnguo@kernel.org, shengjiu.wang@gmail.com,
        linux-imx@nxp.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, s.hauer@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3 3/4] dt-bindings: remoteproc: Add fsl,imx-dsp-rproc
 binding document
Message-ID: <YTJQcIOU1mMxoIpF@robh.at.kernel.org>
References: <1630661377-31244-1-git-send-email-shengjiu.wang@nxp.com>
 <1630661377-31244-4-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630661377-31244-4-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 03 Sep 2021 17:29:36 +0800, Shengjiu Wang wrote:
> Define the compatible string and properties needed by imx_dsp_rproc
> driver.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../remoteproc/fsl,imx-dsp-rproc.yaml         | 131 ++++++++++++++++++
>  1 file changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-dsp-rproc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
