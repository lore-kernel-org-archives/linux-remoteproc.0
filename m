Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CABCC433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 17 Jan 2022 17:26:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233969AbiAQR0l (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 17 Jan 2022 12:26:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233477AbiAQR0l (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 17 Jan 2022 12:26:41 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B2C3C061574
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Jan 2022 09:26:41 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id 78so10769795pfu.10
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Jan 2022 09:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9xoC5BsgBs/Mu4qr+hvIn82GqzQBroS+8rFaa/f2Y/Q=;
        b=dAYvjWk1j+16Hngzm2LLt+t7e+CbrlYiMl4l4BmVmHKl2cbhj0iER34yXKF/X3bwGW
         Qr5VUfV5ZxX0PyqVwyZSLOJuU82BuGOipjVoVD2fdcluplrY9NGJ8XkBHiqsNueKrjI4
         WVvWljGrn7QsFeKYApaJw4uO0IajmBOQ1EsdVjXaiA81MRnTAnyBgG8B/t0G6W2FMr+U
         uu22lpYcvFc0WzKKSciststJXXRh+sDHBDOpcZfFncQzOx50NzGsWMCujhd2pvtTmemW
         4A98ORWnlHXEzY+6l+1Ss9H48dp9XalcXo28uTEC8KE/mHx78E+PGoZVlfV7YsXZzq46
         j/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9xoC5BsgBs/Mu4qr+hvIn82GqzQBroS+8rFaa/f2Y/Q=;
        b=Dy6YQbC4pTi9CFyanO7Y7aVP6ODnyHgm2zVXM3rbnIncCc7Q661f5t1H8BFJNA9BQo
         YjEJRXXBe0lsMon08yI0pTU8qhjPf1CSjTUySAeqY/T27TOJss58psoNIk7Mt39jQbvq
         rMmlN5p8ZlJF9eWYIQdxxOsyDa5GP5RznPM4KET7jL0qepkoxpSEp4xVksvSsXiJNble
         YkMjixKWs+ERP/bh9fxQ1y91e5q+4XyHRafgtmTv3xpUzQj8JQ5853XodMkcnyELiZxL
         5MYXFq71JLWo8BW6kJ46ZbXrsiMdu8HreLA0jSp+7l+xAw9F8vUSSXGeEgJddLAGseKi
         jUAg==
X-Gm-Message-State: AOAM532EBQYT+XcvyPLCY2/hOlrX21CMNd7pO5kckanc7w89u9BNv7yU
        L/Bvb0ZveFesUP4ADDZt49hlpQ==
X-Google-Smtp-Source: ABdhPJwVHQsaIzkL9JzjnuMFHxnugQ0rALeKq6btNIsXwiYFKnL0G1gx7VsQK7B3fGJ4eP7Cw23AjA==
X-Received: by 2002:a63:7e14:: with SMTP id z20mr19653366pgc.194.1642440400571;
        Mon, 17 Jan 2022 09:26:40 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id l18sm14832167pfu.63.2022.01.17.09.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 09:26:39 -0800 (PST)
Date:   Mon, 17 Jan 2022 10:26:37 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Add SCP support for mt8186
Message-ID: <20220117172637.GB1119324@p14s>
References: <20220105094125.6917-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220105094125.6917-1-allen-kh.cheng@mediatek.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jan 05, 2022 at 05:41:23PM +0800, allen-kh.cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> changes since v3:
>  - use rproc-next
> 
> changes since v2:
>  - remove redundant SoB
> 
> changes since v1:
>  - use mt8192_power_on_sram() helper
>  - add MT8186_SCP_L1_SRAM_PD_P1 in mtk_common.h
>  - add MT8186_SCP_L1_SRAM_PD_P2 in mtk_common.h
> 
> Based on rproc-next
> 
> Allen-KH Cheng (2):
>   dt-bindings: remoteproc: mediatek: Add binding for mt8186 scp
>   remoteproc: mediatek: Support mt8186 scp
> 
>  .../bindings/remoteproc/mtk,scp.yaml          |  1 +
>  drivers/remoteproc/mtk_common.h               |  3 ++
>  drivers/remoteproc/mtk_scp.c                  | 35 +++++++++++++++++++
>  3 files changed, 39 insertions(+)

Both patches in this set are giving me a checkpatch warning that is impossible
to miss.  I deleting this patchset from my queue.   

> 
> -- 
> 2.18.0
> 
