Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D93C63777
	for <linux-remoteproc@archiver.kernel.org>; Mon, 30 Nov 2020 17:34:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 764342074A
	for <linux-remoteproc@archiver.kernel.org>; Mon, 30 Nov 2020 17:34:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387655AbgK3ReG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 30 Nov 2020 12:34:06 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:41039 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387541AbgK3ReF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Nov 2020 12:34:05 -0500
Received: by mail-io1-f68.google.com with SMTP id t8so12598568iov.8;
        Mon, 30 Nov 2020 09:33:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZgJEhYouUUwtea9Di+YMsFTNFwqfdZTzGiTGJ3yif0w=;
        b=EuJNFRFdveodCitsNNFGDPsTU/vlWeqKGY9Gw+I2Vdh494YWBO49r70+8ynpO3YUKv
         Y6Ow/QTA3xAWUV3+6huUUgkso/JEZDPecyqX6SisH1e9Y3QwDuKZr6UX+iqfAnFWAtud
         r5dnmXkvKe/wapuwfSsVcnN7vJTniskm+vUIl8TubP33PJzaw9LKI+25pRDU5axwSOHS
         riPkIUiF0rI0EZSD6WHQ44yESyR70+9w5rarkyquzDENni6Qs1OL/SoHE1bSk5wGDZTv
         gwCTWGOEIp3oSFiP7i9dG5SoSGNMLCE3gGNxTl0hPqqjGH54M+8J5E40KetkJo4g5F3d
         Jbeg==
X-Gm-Message-State: AOAM532WxUvHid2+h/kkTunwkCFJVEvl2JeEDzek0zBAGvhSYA4aXfsG
        RAqog8BBSPjUbepgpzwZL7i/rFTBhA==
X-Google-Smtp-Source: ABdhPJyxxeep6gSaqmu7lJiU4Vhb2MK/YAjSV46S7x1f3PY5eDm2n0j2db1rSKaZE4MP6BXXAoaO2Q==
X-Received: by 2002:a6b:6c01:: with SMTP id a1mr17056361ioh.31.1606757604877;
        Mon, 30 Nov 2020 09:33:24 -0800 (PST)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id q14sm11206772ils.79.2020.11.30.09.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 09:33:24 -0800 (PST)
Received: (nullmailer pid 2678419 invoked by uid 1000);
        Mon, 30 Nov 2020 17:33:22 -0000
Date:   Mon, 30 Nov 2020 10:33:21 -0700
From:   Rob Herring <robh@kernel.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com
Subject: Re: [PATCH v3 01/15] dt-bindings: remoteproc: Add bindind to support
 autonomous processors
Message-ID: <20201130173321.GB2662913@robh.at.kernel.org>
References: <20201126210642.897302-1-mathieu.poirier@linaro.org>
 <20201126210642.897302-2-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126210642.897302-2-mathieu.poirier@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Nov 26, 2020 at 02:06:28PM -0700, Mathieu Poirier wrote:
> This patch adds a binding to guide the remoteproc core on how to deal with
> remote processors in two cases:
> 
> 1) When an application holding a reference to a remote processor character
>    device interface crashes.
> 
> 2) when the platform driver for a remote processor is removed.
> 
> In both cases if "autonomous-on-core-reboot" is specified in the remote
> processor DT node, the remoteproc core will detach the remote processor
> rather than switching it off.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  .../bindings/remoteproc/remoteproc-core.yaml  | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/remoteproc-core.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-core.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-core.yaml
> new file mode 100644
> index 000000000000..3032734f42a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-core.yaml
> @@ -0,0 +1,25 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/remoteproc/remoteproc-core.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Binding for the remoteproc core applicable to all remote processors
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +  - Mathieu Poirier <mathieu.poirier@linaro.org>
> +
> +description:
> +  This document defines the binding recognised by the remoteproc core that can
> +  be used by any remote processor in the subsystem.
> +
> +properties:
> +  autonomous-on-core-reboot:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Used in two situations, i.e when a user space application releases the
> +      handle it has on the remote processor's character driver interface and
> +      when a remote processor's platform driver is being removed.  If defined,
> +      this flag instructs the remoteproc core to detach the remote processor
> +      rather than turning it off.

Userspace? character driver? platform driver? remoteproc core? Please 
explain this without OS specific terms.

Seems to me this would be implied by functionality the remote proc 
provides.

Rob
