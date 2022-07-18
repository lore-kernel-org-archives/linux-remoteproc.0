Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417A3C43334
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jul 2022 17:19:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234314AbiGRRTQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Jul 2022 13:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233910AbiGRRTP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Jul 2022 13:19:15 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 104F51FCF9
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Jul 2022 10:19:15 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id a15so12436236pjs.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Jul 2022 10:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6AlSG11Xz0KEmY1J4qxRxusy/iUb0jY7LfF1OTYlmoE=;
        b=vEheWttEDztzn0wX59F2KAGkreCbHs3di+tKqkl4IAPJ8k+nkONjCaOPX0ur9T4LFn
         HrVp5kPLFewdY8BqiqJF/XavfQqqwVJQWl6AOBEy+YbzNGvJwMKXg6qBhrucJC1j/d2f
         /eixL9KXtAUfWaEZ6j5QcDUsb1pTei0QpfJACiz2a6oePiDheULjMRKUm+wzPiSz6E4w
         0ZexggTDJG0McCTRtrAfYvWd0L88p05aYt0yWRNZGz/f1isLq+nSOc9bpNoaOfCzhY7g
         YNbtNy9apzKYpB55t8+rdEKFWbEX3NqHfi3QUzYz5acc7L66jsN9JI8C3C/T5ZcpnnRY
         PSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6AlSG11Xz0KEmY1J4qxRxusy/iUb0jY7LfF1OTYlmoE=;
        b=tsASfpqvn5K2qG4y/N+Wr3vmp1JusOhoLHDYfPggisBj2xGHrJxTXXeANWttHtyvU+
         1uNZWySaC4YF19QM1wltFhNNe58+4y4iQCWHrbUBD9t17GiNbZurXrRCndQqH2S2Y1LI
         bCrdbQJ/IExS9NZHoHz5kUyJDAhJs0837R7fQL4ntq+9Yv1hmnTTePZALAacdKe/Njyn
         FZkdZ6t/R2OmFGFwNc5x+ne7G/nNlss3e+vwiN+QFYl2ms1Bs5Z46VV2EW7g3fpoRsPt
         Ugaa8Yec9VM6f3uLWxyVAIZnr1QvWscSpgBLgoaa1UnnB0kUA8j6MZODtNwvB8UG71HL
         FpPA==
X-Gm-Message-State: AJIora/T3EL3nNQ+WYy2NdbrhVkb+o+U3FOs6Zo24UZbsXlqJ2VFVVsV
        xO5DIs/RmohhuahnmA+FKTlrGA==
X-Google-Smtp-Source: AGRyM1t9xo/AS/NKpz2t46SlZm8sa/vdqDfuyTscDK82ci703AzuOy6ziJl8eg57k0SFP6nQ2Qy72A==
X-Received: by 2002:a17:90b:3d85:b0:1f0:7355:734 with SMTP id pq5-20020a17090b3d8500b001f073550734mr34853999pjb.24.1658164754519;
        Mon, 18 Jul 2022 10:19:14 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id a20-20020aa794b4000000b0052abfc4b4a4sm9830384pfl.12.2022.07.18.10.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 10:19:13 -0700 (PDT)
Date:   Mon, 18 Jul 2022 11:19:11 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tinghan Shen <tinghan.shen@mediatek.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v1 0/2] Add support for MT8188 SCP
Message-ID: <20220718171911.GA3331732@p14s>
References: <20220715051821.30707-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220715051821.30707-1-tinghan.shen@mediatek.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jul 15, 2022 at 01:18:19PM +0800, Tinghan Shen wrote:
> 
> Tinghan Shen (2):
>   dt-bindings: remoteproc: mediatek: Add binding for mt8188 scp
>   remoteproc: Support MT8188 SCP
> 
>  .../devicetree/bindings/remoteproc/mtk,scp.yaml     |  2 ++
>  drivers/remoteproc/mtk_scp.c                        | 13 +++++++++++++
>  2 files changed, 15 insertions(+)

I have applied this set.

Thanks,
Mathieu

> 
> -- 
> 2.18.0
> 
