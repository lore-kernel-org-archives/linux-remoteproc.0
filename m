Return-Path: <SRS0=//YT=EB=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A24C4363A
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Oct 2020 15:49:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62D1C22409
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Oct 2020 15:49:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jtSGr9La"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1773116AbgJZPtk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 26 Oct 2020 11:49:40 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:40737 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1772482AbgJZPtj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 26 Oct 2020 11:49:39 -0400
Received: by mail-oi1-f193.google.com with SMTP id m128so10923288oig.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Oct 2020 08:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pZLcxZ2MnUfE2owgeO5H9FxVAp5GYsqgLY4ZhY+S9R8=;
        b=jtSGr9LazkMCJoDk/IxFFP4G5Qs+Y/9svdQos1NCXU8w7ehGZ1EUP/P/1qM5Zn8/Jo
         sdeFpgprcu3SWr7TpeAQolSe02ABLWQf+Pty2W6nb4JyLbLaeZn+PQi2twz5+iUeR+WL
         03CZsOTG45+8p7ykLyG/f2YL6cOKxOwa1DleYjm/yOQyV9F1o5xu8twZBHPHM6TMPbfi
         HZdDc6zw/913iaREkqY3fNRuLIv5jELnWoD25g/3dDPPvbzNVn/oVekUMoMNW7G+/Sjw
         kZ9nnGIUmmxoDjTd8cwh/QyFuWIVpvY47VBot6ALPeaPToOWxzeTVrSlIsJbWkdayyo5
         om6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pZLcxZ2MnUfE2owgeO5H9FxVAp5GYsqgLY4ZhY+S9R8=;
        b=I84OlKZHsMIck7kU6Kjqokkr6Oy+kPA/TW/xk30T4+yjvULNNTannnsf0BykJIds9W
         BZyk+ZXZNM+km2Gh4EVgG0o/zV+ypKLJT3pkAIfeMgXNZGXCCXtYcPXwVsqcvHXhXXf4
         pAbukE1afAVyV124ltpAT+vbOW5ZJPGeZwStBZNbAU1ttCUlrOgJwRsSVYFwH0v4xtU4
         PJNb80LPlRl+uds9Ct3KrGDuCsX2EPTzLoGcXutB5kJFPZFLCg5NSubefbMXEXtMKfG7
         RNStvJgk0WH4w5GwMHF/2ft5+clUZNqcxcmBZaYjcywQLOaOAKxYczIqhyqqgAMCfeVM
         3A3A==
X-Gm-Message-State: AOAM531agjlNJe4YcTWbYiZBZyNfyAP/CuiLGs9PQKhzSStPTblOHymU
        7P41HNt/azCvXuTq2QVQazy8+A==
X-Google-Smtp-Source: ABdhPJy5vzb4gSulEItGq7NAbNpQx1Rk+qmcaxsk1uEPTY3pthSMzWWPWLeRubLs4nUV8lHjyEbN1w==
X-Received: by 2002:aca:4d06:: with SMTP id a6mr14494885oib.166.1603727379027;
        Mon, 26 Oct 2020 08:49:39 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a16sm3807833otk.39.2020.10.26.08.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 08:49:38 -0700 (PDT)
Date:   Mon, 26 Oct 2020 10:49:36 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc:     Rob Herring <robh@kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v2 0/4] ARM: stm32: add DT properties for remote proc
 synchronisation
Message-ID: <20201026154936.GA178863@builder.lan>
References: <20201014125441.2457-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014125441.2457-1-arnaud.pouliquen@st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 14 Oct 07:54 CDT 2020, Arnaud Pouliquen wrote:

> This series implements the DT part associated to the commit 9276536f455b3
> ("remoteproc: stm32: Parse syscon that will manage M4 synchronisation")
> 
> Delta vs V1 [1]
> - add Rob acked-by on patch 1/4
> - simplify yaml descriptions and align other syscon descriptions
> 
> [1]https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=339339
> 
> Arnaud Pouliquen (4):
>   dt-bindings: arm: stm32: Add compatible for syscon tamp node
>   dt-bindings: remoteproc: stm32_rproc: update for firmware
>     synchronization
>   dt-bindings: remoteproc: stm32_rproc: update syscon descriptions

Applied the dt-bindings updates, expecting the dts change to go throught
he ST soc tree.

Thank you,
Bjorn

>   ARM: dts: stm32: update stm32mp151 for remote proc synchronization
>     support
> 
>  .../bindings/arm/stm32/st,stm32-syscon.yaml   |  1 +
>  .../bindings/remoteproc/st,stm32-rproc.yaml   | 21 +++++++++++++------
>  arch/arm/boot/dts/stm32mp151.dtsi             |  7 +++++++
>  3 files changed, 23 insertions(+), 6 deletions(-)
> 
> -- 
> 2.17.1
> 
