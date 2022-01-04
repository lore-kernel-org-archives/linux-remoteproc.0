Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6621C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 Jan 2022 16:53:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235551AbiADQxi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 4 Jan 2022 11:53:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232894AbiADQxi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 Jan 2022 11:53:38 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F04AC061785
        for <linux-remoteproc@vger.kernel.org>; Tue,  4 Jan 2022 08:53:38 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id h1so24268588pls.11
        for <linux-remoteproc@vger.kernel.org>; Tue, 04 Jan 2022 08:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TR6Cu/+uQ4xcHjIjGjwETyTTXPP8JtD9qNRslKv4f/0=;
        b=vdNlWBcvqr9GUl+R/98nLAfw+u2Ra7et3aeVbTuhljHhbWNXb/s8lAH+uTP42OEn/H
         yQqDdCP0YOdOP5+E2C+CcEn1H/ZTblFPmHWi5s9OBOVRuovSqWSr5uJoXCj5QKOOaP+8
         i7qj+yUKwyIE6VCEkdX4bd9x+umWGTC2L9MFOnW2+zFTmhyB3sJo9pvepSFVu+rj2AM6
         c/O6OmReomp0ml51dLGKbjP+o+T7HgKM82v6Gt0IFiCh0ibmhPFnwybrDDRwylRwfrBQ
         gdJa+IhfhI779z8IWuu9x+6tJqXXTEdLJUvfFrcWEzvkpdsYCZPNINHR1RG5zfnSqCzn
         b2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TR6Cu/+uQ4xcHjIjGjwETyTTXPP8JtD9qNRslKv4f/0=;
        b=vecsPMInLcrMAEj3h3+ZC2HDyx4JevNkzmZ69zMLH9YQt5jsYQQlasVSUiKC1d77VJ
         jr2BkjOTmcZ4IbcREyD4cKySJLDoYD9mtM3yh0mkBBgIQ1UuVEESkEL2JXViX/09yHsF
         Rks66dsQRy1AQePFCh8PwgpJyWqqdyZIV3ItiLIxi+mYqvZiBBEPLJCbbB3WQYUmieGv
         JsXmrJXKphv3hPQ3DLkdBxQYe1V7pMFfibRb7Klv6jq+4awKCWkxMTAUIeM3zRuNMRk0
         kHIXKqoAjP7zrtwT+2YPkXvQmOywcjGOUUB+9LCXW7Zk3KQVHpZkvdMj2sAiubrbNgKN
         QIHw==
X-Gm-Message-State: AOAM531mD5NelgHW8TJEj4Yxofzeuw3j1qTuiJChvDvc18ZZK24y03h/
        lZydntSVBA8195AzX2uGoKG5dA==
X-Google-Smtp-Source: ABdhPJxxmHvZgGCzzsPyI8u0TckTilqGSoSSh4At+XAfLQ5zRVilq2nw4Y0oNP+piBnf63zHvwW7gw==
X-Received: by 2002:a17:902:ed52:b0:148:da08:9a6 with SMTP id y18-20020a170902ed5200b00148da0809a6mr50131155plb.89.1641315217634;
        Tue, 04 Jan 2022 08:53:37 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e3sm2062480pgm.51.2022.01.04.08.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 08:53:36 -0800 (PST)
Date:   Tue, 4 Jan 2022 09:53:33 -0700
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
Subject: Re: [PATCH 0/2] Add SCP support for mt8186
Message-ID: <20220104165333.GA539868@p14s>
References: <20220104114706.27461-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220104114706.27461-1-allen-kh.cheng@mediatek.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Allen,

On Tue, Jan 04, 2022 at 07:47:04PM +0800, allen-kh.cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> changes since v1:
> - use mt8192_power_on_sram() helper
> - add MT8186_SCP_L1_SRAM_PD_P1 in mtk_common.h
> - add MT8186_SCP_L1_SRAM_PD_P2 in mtk_common.h

It is quite hard to follow the evolution of this patchset.  The second revision
had a "v2" tag but this one doesn't, which can be confused with the patchset
sent on January 3rd.  Please send another one (v4) with:

1) A cover letter.
2) The right SoB.
3) The right version tag.

> 
> Based on v5.16-rc8

This should be based on rproc-next[1].

Thanks,
Mathieu

https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/log/?h=rproc-next

> 
> allen-kh.cheng (2):
>   dt-bindings: remoteproc: mediatek: Add binding for mt8186 scp
>   remoteproc: mediatek: Support mt8186 scp
> 
>  .../bindings/remoteproc/mtk,scp.yaml          |  1 +
>  drivers/remoteproc/mtk_common.h               |  3 ++
>  drivers/remoteproc/mtk_scp.c                  | 35 +++++++++++++++++++
>  3 files changed, 39 insertions(+)
> 
> -- 
> 2.18.0
> 
