Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C66C433E6
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Jan 2021 22:24:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EED4922D0B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Jan 2021 22:24:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390083AbhAKWYL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 11 Jan 2021 17:24:11 -0500
Received: from mail-oi1-f170.google.com ([209.85.167.170]:34271 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389278AbhAKWYJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Jan 2021 17:24:09 -0500
Received: by mail-oi1-f170.google.com with SMTP id s75so302607oih.1;
        Mon, 11 Jan 2021 14:23:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WiyNKAaKhfGeo/+im//G5bEXWZdmZHXGJONjdyxAJB8=;
        b=Yz1J/cHy/1FJfJPE6Jk5XV/GxVzOiQd4ow4+2kCtnhOCxtsZapKjg4D7jyFMuC+gUh
         WVf4OJ1tKHLJFeTauU/RPE8zFwT/NOrvKzG9GRss29bIO3RnD1KkL777TntGPIrEl4Sk
         B1qfAOHsD2jyNwK3RBXyA4FVV+DrJflTwDeRUf+h3uwkzGCUlgP/+uMQgzAtzw1iuc5F
         K7HkoIatVuszURuOBkWN/SJe/c2d+HZ+qE63GUJTDyYZNOwyw6PtTAuH5rTlQJXFJ6+h
         Bkz/RiyN6qdV8r5GmO6Nnxkha2fj7Ls4BfjhsCiwZaM5BAi9gJXCAHiBGPLtr2bKdNfD
         mK1A==
X-Gm-Message-State: AOAM532Wp4KNzUXe111ZIuTtGJs4LV+8WkShzxzdXKnvqEXXo+1oOCXj
        TbokCk73ATlCg66ZeS7ZsA==
X-Google-Smtp-Source: ABdhPJzdWiylcXBZoVpmAKCsvmzMnBvu5rY8IizYPMJ/K8wgEjBiauX0Gov3buq48p/d+q9iykuJqQ==
X-Received: by 2002:aca:4b16:: with SMTP id y22mr590514oia.148.1610403808918;
        Mon, 11 Jan 2021 14:23:28 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i24sm182121oot.42.2021.01.11.14.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 14:23:28 -0800 (PST)
Received: (nullmailer pid 3165463 invoked by uid 1000);
        Mon, 11 Jan 2021 22:23:26 -0000
Date:   Mon, 11 Jan 2021 16:23:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     robh+dt@kernel.org, linux-remoteproc@vger.kernel.org,
        ohad@wizery.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, bjorn.andersson@linaro.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: sram: Add compatible strings for the
 Meson AO ARC SRAM
Message-ID: <20210111222326.GA3165417@robh.at.kernel.org>
References: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
 <20210102205904.2691120-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210102205904.2691120-2-martin.blumenstingl@googlemail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, 02 Jan 2021 21:59:00 +0100, Martin Blumenstingl wrote:
> Amlogic Meson8, Meson8b and Meson8m2 SoCs embed an ARC EM4 core
> typically used for managing system suspend. A section of the SoCs SRAM
> is mapped as memory for this ARC core. Add new compatible strings for
> the SRAM section for the ARC core memory.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
