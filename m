Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4842C4338F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 13 Aug 2021 20:57:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD42E61038
	for <linux-remoteproc@archiver.kernel.org>; Fri, 13 Aug 2021 20:57:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234558AbhHMU5b (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 13 Aug 2021 16:57:31 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:43597 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhHMU5a (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 13 Aug 2021 16:57:30 -0400
Received: by mail-oi1-f182.google.com with SMTP id bf25so8989145oib.10;
        Fri, 13 Aug 2021 13:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3wvmf7DOu12lxJGmuxwNus8Ei0TqBPYTO/Ya0rfIezM=;
        b=XZ4bez+jEoD0nxwvVfnM7MR6X5KngPCcAVyh01S50NBYomgdsYxQG3MhZJvS2LzrKR
         HRbhANSVwS9Z6Rq2PyXKsSadVqIWprYl8dD8SdQRvhytBHd6UF9AaHJY+9QNZNEsEdbV
         pznvHDWPDwuzEUDzGjv3ZD0PdTTiymf4FFdoZ0tfMwaT4gpPHVgLzw0GjmdKcn6UOMKE
         dZbx211SMpCTP0mNQw2RsDQQYgqsxKCFO0WLNtzNSD7xaOynv5sWdec3Zrnio/dpCakk
         riFbRxeYCXE2RrUEjkzGeiS4xcXRER+6spdsX0NYJ0Y2zzcf2o0bLOkeJZq7BWtwXiQU
         Nd4A==
X-Gm-Message-State: AOAM5325oswN6YB45jD6kq0OdRve/6wh+uLedNEkr0k746KPJfx7lfou
        boiaFekHDdsCXENek8jvVg==
X-Google-Smtp-Source: ABdhPJzEqww+nuVlBCG4CJ4QIjNt2ny8eoAF/xFTGVu66sG0M0ICoNa+C3HT50atfQpNHUR72XfXZw==
X-Received: by 2002:a05:6808:85:: with SMTP id s5mr3627786oic.31.1628888223215;
        Fri, 13 Aug 2021 13:57:03 -0700 (PDT)
Received: from robh.at.kernel.org (2603-8080-2a06-ed00-a2a6-2d62-395f-9378.res6.spectrum.com. [2603:8080:2a06:ed00:a2a6:2d62:395f:9378])
        by smtp.gmail.com with ESMTPSA id l9sm530729otr.34.2021.08.13.13.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 13:57:02 -0700 (PDT)
Received: (nullmailer pid 4019042 invoked by uid 1000);
        Fri, 13 Aug 2021 20:57:00 -0000
Date:   Fri, 13 Aug 2021 15:57:00 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tinghan Shen <tinghan.shen@mediatek.com>
Cc:     devicetree@vger.kernel.org, krzysztof.kozlowski@canonical.com,
        robh+dt@kernel.org, matthias.bgg@gmail.com, shawnguo@kernel.org,
        sam@ravnborg.org, geert+renesas@glider.be, fanghao11@huawei.com,
        daniel@0x0f.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, ohad@wizery.com,
        linux@rempel-privat.de, bjorn.andersson@linaro.org,
        linux-kernel@vger.kernel.org, Max.Merchel@tq-group.com,
        linux-mediatek@lists.infradead.org, mathieu.poirier@linaro.org
Subject: Re: [PATCH v6 3/6] dt-bindings: remoteproc: mediatek: Convert
 mtk,scp to json-schema
Message-ID: <YRbcnKLx43UcJNSm@robh.at.kernel.org>
References: <20210809051959.31136-1-tinghan.shen@mediatek.com>
 <20210809051959.31136-4-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809051959.31136-4-tinghan.shen@mediatek.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 09 Aug 2021 13:19:56 +0800, Tinghan Shen wrote:
> Convert the mtk,scp binding to DT schema format using json-schema.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../bindings/remoteproc/mtk,scp.txt           | 41 ---------
>  .../bindings/remoteproc/mtk,scp.yaml          | 92 +++++++++++++++++++
>  2 files changed, 92 insertions(+), 41 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
