Return-Path: <SRS0=uUKq=D2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D7EC433E7
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 20:27:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69AE822200
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 20:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603139245;
	bh=Jh51W+rbbBiCeigObGIYMtEgWBZSWDxdTFNHCb5iheE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=182zLSkvyJ7piMmlY3KC3kew1CQ/lOZ+VDoYIa51QMc3t9XQs0QTmzvjcteYC3Pm1
	 RkBnmEzQpuMHJbmuWYb1paEprMNoQzOJeU26IJXb8WpxLa9nezzNvViJyg/VMAWQRs
	 ZzsFYBPF/ZjwqzWlJUu8Ppdf7LUN12/ny8a4Jt+4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731666AbgJSU1Z (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 19 Oct 2020 16:27:25 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44940 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgJSU1Y (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 19 Oct 2020 16:27:24 -0400
Received: by mail-oi1-f193.google.com with SMTP id x62so1392830oix.11;
        Mon, 19 Oct 2020 13:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Dq2Q4wYlvZqon/jVNhQ6O79+BXokYsSiy5rj/1RzZb4=;
        b=nJvcZ+cyMGl0a1hmxR25+SFPfgYDn1D5EQh5vKfaMcoLdF/wkcbqIyamGZ+Ci2XmFN
         FA+tfPk8wHnqKRNdGg+jPaZ5i6xVmrchEzLUHBpyWL7PcC9Zc2MSQiGP9r0+c+DZPh92
         sKV63ZydjmI8uB/V4eUJW+kctZDrjOuuXaUR9hOeL7tv8vetukJE/Twm2PT8RwUuk3D3
         RNoZF1+hRmiZ0XyfDQ/JDVt73U7SHCN8xCzW8Fq4hy/2TXuU9S71E1JF//NQouY0JJf5
         CpOS6aSjoYqEuDnjxSNfDcr6HR5T4eGzjelk87J9Z5zHHXnbcH5ah3B1X0tYLG20EFx6
         rPRg==
X-Gm-Message-State: AOAM531wu917VJ29jJURxRVptVrjj/R5SoWiadb9tJ1OA0j6Jimpz9aF
        AQZnfutsMdP35+aGnzQe2Q==
X-Google-Smtp-Source: ABdhPJzWni2g3t1tjZxHgWy35dH8tTRUz7MIVaD7VeH4QWgQVVCUj74G5lDSAoDqhFF6NQoH+g+YaA==
X-Received: by 2002:aca:1012:: with SMTP id 18mr850373oiq.30.1603139243601;
        Mon, 19 Oct 2020 13:27:23 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b1sm187822otq.80.2020.10.19.13.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:27:22 -0700 (PDT)
Received: (nullmailer pid 3550080 invoked by uid 1000);
        Mon, 19 Oct 2020 20:27:22 -0000
Date:   Mon, 19 Oct 2020 15:27:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v2 3/4] dt-bindings: remoteproc: stm32_rproc: update
 syscon descriptions
Message-ID: <20201019202722.GA3550050@bogus>
References: <20201014125441.2457-1-arnaud.pouliquen@st.com>
 <20201014125441.2457-4-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014125441.2457-4-arnaud.pouliquen@st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 14 Oct 2020 14:54:40 +0200, Arnaud Pouliquen wrote:
> Align other syscon descriptions with st,syscfg-m4-state and
> st,syscfg-rsc-tbl descriptions by suppressing the cells
> description.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml      | 6 ------
>  1 file changed, 6 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
