Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C03C43603
	for <linux-remoteproc@archiver.kernel.org>; Wed, 20 Jan 2021 16:21:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CD8E233ED
	for <linux-remoteproc@archiver.kernel.org>; Wed, 20 Jan 2021 16:21:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389041AbhATQUi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 20 Jan 2021 11:20:38 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:46190 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390516AbhATPyD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 20 Jan 2021 10:54:03 -0500
Received: by mail-ot1-f51.google.com with SMTP id d1so3281540otl.13;
        Wed, 20 Jan 2021 07:53:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tjLl6io0Xj+xbm1R4uz89/t5xocdQ7tSIufYOrGhyyY=;
        b=YYRBm/v86kRcgB5tzEM+Rc7kUPHH8iZMvi7fBIHevvcafP/aOz4Q5dhe4fSh+SyNPG
         zsRpusBSdVxe+I/sFDMTJ9CINw8jyvhwuLuKdMaJ7YW0d5+7OmudfRlXb1vtJUo7k9Gy
         swG9e2COPvMB6/r65TpOvHMvYJznOAIlJh9Vv/ayiWPChHurj1brD+ZqFsJyeA/ziSyk
         uBEQUrV7KyukvywzgE5ckkGMfKYTHF9CstUPw4KiujuVQYyQyS08TBZG3PgEjG+D8TxO
         KK+DN1abqybansDS8rWeQAJRtG5p6PyWByrPtvUo1i3fzQUMeAo3NInkzUGhaQsjUnjc
         CPOw==
X-Gm-Message-State: AOAM530psybPNos178UQSU/VClGHwMeC4HBYeXMYRvLApnO5MuPZppde
        emsQHqt9HdfLqZjRG6U54PKqzK2CbQ==
X-Google-Smtp-Source: ABdhPJw79QgL9cL6y3RB5CDBVhHYTmzGpACMXDJAkpQxeChGQ4FIbSQrMuVmuYxHZbYezldy9vQggQ==
X-Received: by 2002:a05:6830:1db7:: with SMTP id z23mr7454152oti.314.1611158002927;
        Wed, 20 Jan 2021 07:53:22 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t16sm466296otq.17.2021.01.20.07.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 07:53:21 -0800 (PST)
Received: (nullmailer pid 220380 invoked by uid 1000);
        Wed, 20 Jan 2021 15:53:20 -0000
Date:   Wed, 20 Jan 2021 09:53:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arnaud.pouliquen@st.com, ohad@wizery.com, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 01/17] dt-bindings: remoteproc: Add bindind to support
 autonomous processors
Message-ID: <20210120155320.GA220319@robh.at.kernel.org>
References: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
 <20201218173228.2277032-2-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201218173228.2277032-2-mathieu.poirier@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 18 Dec 2020 10:32:12 -0700, Mathieu Poirier wrote:
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
>  .../bindings/remoteproc/remoteproc-core.yaml  | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/remoteproc-core.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
