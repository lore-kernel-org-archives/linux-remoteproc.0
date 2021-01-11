Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 306CCC433DB
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Jan 2021 22:24:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE58F22D0B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Jan 2021 22:24:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389090AbhAKWYs (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 11 Jan 2021 17:24:48 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]:45717 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbhAKWYs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Jan 2021 17:24:48 -0500
Received: by mail-oi1-f171.google.com with SMTP id f132so241572oib.12;
        Mon, 11 Jan 2021 14:24:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KoacxLrwG781qT5RG7YqfWItnfklIT+YgSdisL9jVhg=;
        b=Q3Nr/o553HPXeFPUeAOktwXkBymuXAlyzuQdI+3w92kj99mYPTvkzOY9xC+GyJW7xl
         KrkrAGdaj2GQaY9PbhxJEncSGJLGwghBE2sSGjonLyEnkG+MiI8qerl3+6wyEYPzm+d6
         Pm6CyM0/paJ7P/3JUEUK98swG+dK5l38D1AGRjcl7PHdO8HaQuGy3oKEew3rCkr9naUO
         +kKr9h6NOuqEzfbT/m+ggRnByXLHLPkKgUxc3gsyl0IwkbmODbwcoie7L8X7G8qiV0ci
         TWN01zRaMzH4xZduBYUT9UDJTfNbO0n4+SnMLzsOVzyhffjfU6Yq7plKlKaCL0tDrp6j
         EAgQ==
X-Gm-Message-State: AOAM532Q6Z//wrOrrDtuGkLRqoMAybgHWhLjPB25MQ82oCce/jQ2UACp
        HMAm+bs/RWnYp/w/yAk1Tw==
X-Google-Smtp-Source: ABdhPJwYdKgyRVQAbZFYeZx2MSTvcx37NH1sC+LDnpzYisFoBMSSFNUVxQm7CmWiF0U0a+z3t3+3GA==
X-Received: by 2002:aca:d54a:: with SMTP id m71mr591460oig.30.1610403847004;
        Mon, 11 Jan 2021 14:24:07 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h2sm186107ooa.25.2021.01.11.14.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 14:24:05 -0800 (PST)
Received: (nullmailer pid 3166438 invoked by uid 1000);
        Mon, 11 Jan 2021 22:24:04 -0000
Date:   Mon, 11 Jan 2021 16:24:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     ohad@wizery.com, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, robh+dt@kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: Amlogic: add the documentation for
 the SECBUS2 registers
Message-ID: <20210111222404.GA3166382@robh.at.kernel.org>
References: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
 <20210102205904.2691120-3-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210102205904.2691120-3-martin.blumenstingl@googlemail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, 02 Jan 2021 21:59:01 +0100, Martin Blumenstingl wrote:
> The Meson8/Meson8b/Meson8m2 SoCs have a register bank called SECBUS2 which
> contains registers for various IP blocks such as pin-controller bits for
> the BSD_EN and TEST_N GPIOs as well as some AO ARC core control bits.
> The registers can be accessed directly when not running in "secure mode".
> When "secure mode" is enabled then these registers have to be accessed
> through secure monitor calls.
> 
> So far these SoCs are always known to boot in "non-secure mode".
> Add a binding documentation using syscon (as these registers are shared
> across different IPs) for the SECBUS2 registers.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../arm/amlogic/amlogic,meson-mx-secbus2.yaml | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
