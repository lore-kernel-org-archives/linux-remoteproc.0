Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95598C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 17:43:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7128960F4B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 17:43:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237632AbhI0Rp3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Sep 2021 13:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237720AbhI0RpY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Sep 2021 13:45:24 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 769D5C128EFE
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 10:23:59 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id n23so13646725pfv.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 10:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5P3OrPu6+56qmlhZPoJJstlv8IRrXnOuHuYMrmMX4NI=;
        b=n6L1AnuX/V+OuWLh5rssxLOAbc5rjEkkrwklXwK0ceoJvbKg/ttagXWHWY7DH0QY3C
         rKB0DivqGj4OSONgSx5QkCyfcYab9Cf2ENkcYSoyAVCqUqxiJNGkFhLxeqE3C3cJxzwB
         oDAYOGn8zq2HzyTfn5H82EWDCuxqVbGXO9yM5b3lcG41HAwl1Bcd0XffvVyZLzuEOVJg
         Lq1ummIEoJWm3AO8x5LDWpRQyw/EMQ/LenKdTtHU4CfU26ykYvxAJl/Gpr81IgOqGPVb
         JyCrWZ5UbrP12894aHYua7c/mFkSs1nQS7y9ZSpmLL2BLDnsD9PWfpW4ja+DNnyIe+VL
         GYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5P3OrPu6+56qmlhZPoJJstlv8IRrXnOuHuYMrmMX4NI=;
        b=6mRsJT9LX9QqqYhETTe++zJuM5wvTH8VfiA4anKDhBfC+v1McvFUDRrHV2N4vVBz1q
         LSzSn3949KUmPt6sLfV+uXYMSY4YD2vEHr5aoEUkJ7MqzgngIm62CNHra+LUWA/FXrWX
         V1FI/SZL/epSkjhrzu1nRnNZmHmL4F3mY3c4fi53q2w9hG/xmx1f80QJU/1faDcBOCh8
         Bmid/FCrf+KsT4DCnraoy4LHv10qnSLxCYYdnWjjMHEkYeo3FMEiA+VJVjnDnFirY3IR
         XDs7Ht+a9n3uC29crZ+kMS94SkqxKIbi/aDFKdlivT+nZtBaHi9Xr6eTaALJ7tjOuPkh
         qJpQ==
X-Gm-Message-State: AOAM530ZTDjz0uuHM2W2ucGMRfjGu04aiomvD6IM3VW2eaV6nzOjuB3k
        6N9MkBnUBRTA0naa9fxj+zk/eA==
X-Google-Smtp-Source: ABdhPJxFTFDsHgeCr6HVxvBjtijyCpBs6vjOVIWRqOO6IwwMSot6hv9oSpOisZRYBLUuHFzxloLRqg==
X-Received: by 2002:a63:5902:: with SMTP id n2mr672051pgb.305.1632763439002;
        Mon, 27 Sep 2021 10:23:59 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id l9sm57170pjz.55.2021.09.27.10.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 10:23:58 -0700 (PDT)
Date:   Mon, 27 Sep 2021 11:23:56 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Sinthu Raja <sinthu.raja@mistralsolutions.com>
Cc:     Suman Anna <s-anna@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Sinthu Raja <sinthu.raja@ti.com>
Subject: Re: [PATCH V4 0/2] dt-bindings: remoteproc: k3-r5f|dsp: Remove
Message-ID: <20210927172356.GC2837840@p14s>
References: <20210927103811.11222-1-sinthu.raja@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927103811.11222-1-sinthu.raja@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Sep 27, 2021 at 04:08:09PM +0530, Sinthu Raja wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> Hi All,
> The series of patches are meant to help make the rproc bindings for K3
> r5f and dsp support independent of board/platform involved.
> 
> Changes in V4:
> Addressed review comments:
> - Removed Fixes tags from the commit descriptions.
> - Updated subject and commit description to emphasis on cleaning up of the 
>   example to address the dt_binding_check warnings.
> 
> 
> V3: https://lore.kernel.org/all/20210917095426.19277-1-sinthu.raja@ti.com/
> V2: https://lore.kernel.org/all/20210818074030.1877-1-sinthu.raja@ti.com/
> V1: https://lore.kernel.org/all/20210817152005.21575-1-sinthu.raja@ti.com/
> 
> Sinthu Raja (2):
>   dt-bindings: remoteproc: k3-r5f: Cleanup SoC compatible from DT
>     example
>   dt-bindings: remoteproc: k3-dsp: Cleanup SoC compatible from DT
>     example
> 
>  .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml       | 4 +---
>  .../devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml       | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)

I have applied this set.

Thanks,
Mathieu

> 
> -- 
> 2.31.1
> 
