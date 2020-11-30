Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABEA6C63777
	for <linux-remoteproc@archiver.kernel.org>; Mon, 30 Nov 2020 17:24:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5894F2076E
	for <linux-remoteproc@archiver.kernel.org>; Mon, 30 Nov 2020 17:24:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387485AbgK3RYT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 30 Nov 2020 12:24:19 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:36326 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387484AbgK3RYT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Nov 2020 12:24:19 -0500
Received: by mail-io1-f65.google.com with SMTP id z136so12606269iof.3;
        Mon, 30 Nov 2020 09:24:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cPMxZlQxoYwbe5rNwYcUWeT/RRRCVfvUlWJa6gfqm9M=;
        b=Zv4rCEMQU0PvnMGsoqhaf+VW4Nh2cDag1d855c2OcfghSRcqZ5tf6Jbu2sgFpAUrtl
         4qQ9Kqw3/wq/qGQ6wMjd85lRC+iMdF2qFE4iphQE5aUt9UxZgbHAZqItIjMx6jNCTQab
         P/lK+v3F0ZDo68m4Oql6sD5VL54+6k9G7mDeecXHjYgWU1D4GvQXydvj4vQ14H4P0NQ/
         5Y8fddhZuh1OrrfTuQ1Bk/uitHR9IBG8pcFBSmRPIKhyHmvm7aCGfNxU0AkyUJmBe8If
         2hsDSvJwffwJ2+CxSvz38p2+SUz22EyYPfrR5rZHtJ3pFGF5YV3lFTUHyfKu3siwaw3N
         JsPQ==
X-Gm-Message-State: AOAM530veDz1caqdxeIEegw11T9NMZKI98+Mxu8372USnPUvxm9/Q5Pv
        KOR39GBgNZBYZSTPHahg4w==
X-Google-Smtp-Source: ABdhPJxScbSfxfcljRrtXVcqlG+VUieO2t0Nb+zeF5cTM0gGDWnks5RgDuVjKDALYx3iQTodfW8HVQ==
X-Received: by 2002:a5e:de08:: with SMTP id e8mr7962278iok.203.1606757018516;
        Mon, 30 Nov 2020 09:23:38 -0800 (PST)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id l6sm11721464ili.78.2020.11.30.09.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 09:23:37 -0800 (PST)
Received: (nullmailer pid 2663209 invoked by uid 1000);
        Mon, 30 Nov 2020 17:23:35 -0000
Date:   Mon, 30 Nov 2020 10:23:35 -0700
From:   Rob Herring <robh@kernel.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org,
        ohad@wizery.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 01/15] dt-bindings: remoteproc: Add bindind to support
 autonomous processors
Message-ID: <20201130172335.GA2662913@robh.at.kernel.org>
References: <20201126210642.897302-1-mathieu.poirier@linaro.org>
 <20201126210642.897302-2-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126210642.897302-2-mathieu.poirier@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 26 Nov 2020 14:06:28 -0700, Mathieu Poirier wrote:
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


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/remoteproc-core.yaml: 'additionalProperties' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/remoteproc-core.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/remoteproc/remoteproc-core.yaml


See https://patchwork.ozlabs.org/patch/1406889

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

