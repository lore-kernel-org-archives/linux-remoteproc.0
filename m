Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF97AC47083
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Jun 2021 21:04:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A48BF611CC
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Jun 2021 21:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbhFBVGI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 2 Jun 2021 17:06:08 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:33625 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbhFBVGH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Jun 2021 17:06:07 -0400
Received: by mail-oi1-f177.google.com with SMTP id b25so4115429oic.0;
        Wed, 02 Jun 2021 14:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gdRC3LaNJoq06zLg1AOtbFc2nZThyPvFpI3uvfhfMnA=;
        b=rJOYtueqhk5GbKX695oKTfbshyUDbpZSSENODS55osEF+p+ynrnggxzEgtaow1qAj5
         6aDYc2YfO31OAblVMrcfi1YyiHAMQFk+eArhD8BzW2vG7Bzw2hOQwtgObFVqfzkEX8th
         qFWqpmehUnd9QQP401mK1B3T0qUZnxJMyeofJl7ZbxvwTulR7E101gXmrT9F2g4IvBKC
         DlwmCEcUcLhKE/Zs35hc7BBc8QTxHVjG0FkQy56FYIQoocQcDXTFBTRe/m1oKqKNSGfu
         TjIe74hzppMfXWa7OCk7MNvUlMvnMLO8dXLZ6m9gnXfaXD0VjdI09OyvJUErdfVPXFrQ
         aIcg==
X-Gm-Message-State: AOAM5321mo3VqKiLf6Dn4oslhm1nsP0mNFVXjsTSIFJCn1lWV78I65Wk
        mbEtY9gwDX3Lac7dmSDtow==
X-Google-Smtp-Source: ABdhPJzsuqB0B2FmVvlfKgaKW5qgFsDoIoouMag1IdPrnw7c+sKjsdJM5xKuENGv+I6/Pxv68hNCUg==
X-Received: by 2002:aca:3c4:: with SMTP id 187mr15504809oid.116.1622667856053;
        Wed, 02 Jun 2021 14:04:16 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x29sm220066ott.68.2021.06.02.14.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 14:04:15 -0700 (PDT)
Received: (nullmailer pid 4039201 invoked by uid 1000);
        Wed, 02 Jun 2021 21:04:14 -0000
Date:   Wed, 2 Jun 2021 16:04:14 -0500
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Stephen Boyd <sboyd@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 05/12] dt-bindings: reset: update ti,sci-reset.yaml
 references
Message-ID: <20210602210414.GA4039146@robh.at.kernel.org>
References: <cover.1622648507.git.mchehab+huawei@kernel.org>
 <e9b505d900d898c0d030deb168ab291206c203ee.1622648507.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9b505d900d898c0d030deb168ab291206c203ee.1622648507.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 02 Jun 2021 17:43:11 +0200, Mauro Carvalho Chehab wrote:
> Changeset 9a81b8cbc245 ("dt-bindings: reset: Convert ti,sci-reset to json schema")
> renamed: Documentation/devicetree/bindings/reset/ti,sci-reset.txt
> to: Documentation/devicetree/bindings/reset/ti,sci-reset.yaml.
> 
> Update the cross-references accordingly.
> 
> Fixes: 9a81b8cbc245 ("dt-bindings: reset: Convert ti,sci-reset to json schema")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../devicetree/bindings/remoteproc/ti,keystone-rproc.txt        | 2 +-
>  MAINTAINERS                                                     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!
