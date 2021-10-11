Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F9AC433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Oct 2021 23:44:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62A2460EBB
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Oct 2021 23:44:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235607AbhJKXqB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 11 Oct 2021 19:46:01 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:36796 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhJKXqB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Oct 2021 19:46:01 -0400
Received: by mail-oi1-f175.google.com with SMTP id u69so14292101oie.3;
        Mon, 11 Oct 2021 16:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+BUlZ4e8wGtyUddl3B3V8IIgRy/F1Q/YMaD0zfsdH5w=;
        b=zaFrbc0HTvOoU/BLYwKEbKacZbPJ49UmmzIddZL47/DQi0ibnmiBYDqVuFm3iG+6Kx
         dLDryDIp74zkytxedFb2xRRAyYl2gAb3AzUijWWOYxlOm+fOvdfF6dR31ID1dfSFV8l7
         Fwl8VbfFHbCQsq5VyBwBEWOJNIE+GFGc72Q3bDkt6HInaUJvHL6FCTFyoFUIlUkuZSiw
         uMYqN6lUrQ/78lhOK/cJVVf32gr7PFwKmBeVcmS6IGqpwpfk5RtWQpn0csV3Zrj8MbAe
         5xh1gr4mCwuVS7GP4KSEmbynM3NaNDIkMi05C7dPeCh8oI9bK6vjnxymLb9t48Od2fiq
         lUAQ==
X-Gm-Message-State: AOAM532u+bDlegJDTtmDittN51MjRV7/cBU3msWDTfJSmEO2ZwDzxL+6
        pttt5FWirf22jZXq2mW6Dg==
X-Google-Smtp-Source: ABdhPJyOjjoM+hYtcCO2pjFkYQug9Xy0uuBwVt89270/foNYGA0Ynei7PxmBDF8pPHikXbAxsJYM2Q==
X-Received: by 2002:a05:6808:1686:: with SMTP id bb6mr1445756oib.40.1633995838956;
        Mon, 11 Oct 2021 16:43:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id m23sm1779455oom.34.2021.10.11.16.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 16:43:58 -0700 (PDT)
Received: (nullmailer pid 1390824 invoked by uid 1000);
        Mon, 11 Oct 2021 23:43:57 -0000
Date:   Mon, 11 Oct 2021 18:43:57 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
        ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, devicetree@vger.kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
        shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v6 4/4] dt-bindings: dsp: fsl: update binding document
 for remote proc driver
Message-ID: <YWTMPQKqc5m7vwlL@robh.at.kernel.org>
References: <1633944015-789-1-git-send-email-shengjiu.wang@nxp.com>
 <1633944015-789-5-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633944015-789-5-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 11 Oct 2021 17:20:15 +0800, Shengjiu Wang wrote:
> As there are two drivers for DSP on i.MX, one is for sound open
> firmware, another is for remote processor framework. In order to
> distinguish two kinds of driver, defining different compatible strings.
> 
> For remote proc driver, the properties firmware-name and fsl,dsp-ctrl
> are needed and the mailbox channel is different with SOF.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      | 123 +++++++++++++++++-
>  1 file changed, 117 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
