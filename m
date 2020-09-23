Return-Path: <SRS0=+12+=DA=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF62BC4727E
	for <linux-remoteproc@archiver.kernel.org>; Wed, 23 Sep 2020 15:33:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1A802137B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 23 Sep 2020 15:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600875188;
	bh=O2Nr8LX72IDctCCfntCyzIeebH0/JUiqovfw+jmSMZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=lK1A/tbXXzMv8h/dEXcQ/U86qqH9hnD8v1tkys5K22WG6IV3Tp2aEreG62wtjoUwQ
	 woeJW9d7SlH0NgsbuztoiLyj62DTWI/2JQCy8j1jNBfj+w00rmN9lsfCgMYVY3I0fu
	 G8dGoa67pMpUyyqXVf/YaBTYTdOcwXDIfVynPcI8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbgIWPdI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 23 Sep 2020 11:33:08 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:36688 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgIWPdI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 23 Sep 2020 11:33:08 -0400
Received: by mail-il1-f194.google.com with SMTP id t12so19850ilh.3;
        Wed, 23 Sep 2020 08:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w5w8Uvn8McZjjgkjEWVA++4pmoYoDvxFECyptYJKqC0=;
        b=PlKl991zxVPtbGs6ziDNBBVamf2KZfJSINqcekd3Txcs80qyr4U4sNFBCj3Tno5NMR
         JWtTTLOm4EuXky/gRlXVXd9xkMOU3YIMP8B14nBqjlaHanXCXw3m49m/ydYEfMYgHQ6r
         roQxB2sI3fdFZULBNf1qEC7QSlxa17x/WHltq+GgAgdmXfMjmkt7Q42uctfOtnNgbl1N
         pZZF+sXcvjKQyjGuOVJ7WR5R6DMCn+cI4CY0RDHu9y+fT7uOsmVn2YiiMyUY9TgqH/k1
         mIMLXS+EAdey9NZmi1IhpZmz37YxpmQcyV74JvWUvCVub2OzS4sRN9kEkA4tgwKKPbGq
         IyEw==
X-Gm-Message-State: AOAM5309p4UYStuBRBzgMLC+wHtdCb3BXvEbjG42faVbx5pPZSt3SBSy
        osSneRHvw3oZMI1HBcLFmQ==
X-Google-Smtp-Source: ABdhPJxbVblo1SqKfxuo6P8z/VT/DbqU+Fmlgz8qI7+aeXmQ6bBTgFNGVWwbrry3rmmdgnLCi0iZyg==
X-Received: by 2002:a05:6e02:13ae:: with SMTP id h14mr319531ilo.208.1600875187319;
        Wed, 23 Sep 2020 08:33:07 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id a23sm79204ioc.54.2020.09.23.08.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 08:33:06 -0700 (PDT)
Received: (nullmailer pid 787842 invoked by uid 1000);
        Wed, 23 Sep 2020 15:33:05 -0000
Date:   Wed, 23 Sep 2020 09:33:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH 02/10] dt-bindings: power: rpmpd: Add MSM8916 RPM power
 domains
Message-ID: <20200923153305.GA787788@bogus>
References: <20200916104135.25085-1-stephan@gerhold.net>
 <20200916104135.25085-3-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916104135.25085-3-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 16 Sep 2020 12:41:27 +0200, Stephan Gerhold wrote:
> MSM8916 has two RPM power domains: VDDCX and VDDMX.
> Add the device tree bindings to manage them through rpmpd.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
>  include/dt-bindings/power/qcom-rpmpd.h                  | 7 +++++++
>  2 files changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
