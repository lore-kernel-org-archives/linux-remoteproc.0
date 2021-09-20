Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB4FC433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Sep 2021 20:58:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 262DF61159
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Sep 2021 20:58:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237367AbhITU7a (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 20 Sep 2021 16:59:30 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:37402 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232273AbhITU52 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Sep 2021 16:57:28 -0400
Received: by mail-ot1-f48.google.com with SMTP id w64-20020a9d3646000000b0054716b40005so4354396otb.4;
        Mon, 20 Sep 2021 13:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XPatjUnaHnEphbp45Tc3T1p6HiP/lC6r/ygiKd/wpQg=;
        b=4sVdTosKadXX3KtrcrwH9j6y6JcY0LwWOWRnfV1nXsYF+fifima1D6usBz8GRq5DvR
         l8NAjJpTuvKn74eh2FjFplzK3I8dU0Q2uVa3lan5SiVKGpOG08S1a8fmUQPtrmQvzyCb
         oYNr+mWO5W+Mql9n3P1tIKLeTK0AycDrQtZF8iCeivausuM0S4UC0fADLEZmjNvDxrd0
         DKwWnJhroHTsXPlTOILQYUdnMdGLPg21Wex2iDWxoXkHbsk7fRekcT/w8HfpOX0836mp
         Y8rYQQmF9gpMKAlLVKEoYQPwCxXMrNx3ME7PiUzSwtGpDGw23n1R5zBNuqbdOMgi86a4
         DjLQ==
X-Gm-Message-State: AOAM531aDo8WSR8bWzNaVUwJ6KG8AalyZ2j6u9fZEsMzcGbMqEwdwgca
        lXm4Q81HHqAqNqStvquncg==
X-Google-Smtp-Source: ABdhPJw0Ubx9PITUcYUz1zNNca0q8nJ7I3Nn2f8OSxbuj/hwXREco2J/I6rnExb8fxBIFDz9aO3PRg==
X-Received: by 2002:a9d:4681:: with SMTP id z1mr23005506ote.42.1632171360541;
        Mon, 20 Sep 2021 13:56:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id x192sm2337226oix.9.2021.09.20.13.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 13:55:59 -0700 (PDT)
Received: (nullmailer pid 744183 invoked by uid 1000);
        Mon, 20 Sep 2021 20:55:58 -0000
Date:   Mon, 20 Sep 2021 15:55:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     Alexandre Bailon <abailon@baylibre.com>
Cc:     airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, khilman@baylibre.com,
        gpain@baylibre.com
Subject: Re: [RFC PATCH 1/4] dt-bindings: Add bidings for mtk,apu-drm
Message-ID: <YUj1XnBbyNEqrV2g@robh.at.kernel.org>
References: <20210917125945.620097-1-abailon@baylibre.com>
 <20210917125945.620097-2-abailon@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210917125945.620097-2-abailon@baylibre.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Sep 17, 2021 at 02:59:42PM +0200, Alexandre Bailon wrote:
> This adds the device tree bindings for the APU DRM driver.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  .../devicetree/bindings/gpu/mtk,apu-drm.yaml  | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml b/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
> new file mode 100644
> index 0000000000000..6f432d3ea478c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/mediatek,apu-drm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AI Processor Unit DRM

DRM is a linux thing, not h/w.

> +
> +properties:
> +  compatible:
> +    const: mediatek,apu-drm
> +
> +  remoteproc:

So is remoteproc.

Why don't you have the remoteproc driver create the DRM device?

> +    maxItems: 2
> +    description:
> +      Handle to remoteproc devices controlling the APU
> +
> +  iova:
> +    maxItems: 1
> +    description:
> +      Address and size of virtual memory that could used by the APU

Why does this need to be in DT? If you need to reserve certain VAs, then 
this discussion[1] might be of interest.

Rob

[1] https://lore.kernel.org/all/YUIPCxnyRutMS47%2F@orome.fritz.box/
