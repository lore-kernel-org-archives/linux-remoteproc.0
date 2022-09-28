Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C5EC32771
	for <linux-remoteproc@archiver.kernel.org>; Wed, 28 Sep 2022 16:49:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233713AbiI1Qth (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 28 Sep 2022 12:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234278AbiI1Qsk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 28 Sep 2022 12:48:40 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C2E8E7E1B
        for <linux-remoteproc@vger.kernel.org>; Wed, 28 Sep 2022 09:48:39 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id b23so13007775pfp.9
        for <linux-remoteproc@vger.kernel.org>; Wed, 28 Sep 2022 09:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=XBBM5T3kVHHT7hpHVLU7V4Xrc0MtiKbWJ4TBJ3+cCpk=;
        b=opVvXxvFqmzmhFSe3McNIRfbDxHZyLqwwfnN2oiJR0s8dEpM/VbkebaihvAOV5QXbL
         c6xLPhIr9m81Z3kkYo2gBLy0HNfSOG/Vrs+D0JFk6qDRrM9SRvYBWftrgh+uo8fLQkzA
         4QharKQprH3YHSKgGpdPz9o283cO+wM0j1VgT/mkvY20psp98F9aYGd+KOwF11IrtrCk
         TijaoGWohBL/iqZsY2sOY6FhWuy/Yar2SXOXPIephM1jzv8tzqSyuMkM+jmvthdMSJBU
         UGB3R+RVq0IVVmTG1IIJUgezPW7yHPDpcZqxkc9z0sg6UkssmsgjDRBZWeaUXOmhoMdP
         9NUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=XBBM5T3kVHHT7hpHVLU7V4Xrc0MtiKbWJ4TBJ3+cCpk=;
        b=0n8rU9b8CoK6E/n9b0cEkhWiHJq2U9lcm2bCcmwBpDxOYCWT4cmXGUEQK84DV11mJt
         MRtafjPvgy0bZItxRT/sQ0mNLsHLoGXjrg7ffZn+OhpXfVUz0XuSsg6EV0YoJ+FYhUc9
         lalP012O57j16DGeCSbFZYSyvNwGLOdu+g66Jeb4pgTZYHtvrMQ/+XBTsaYlQngKIKz0
         vwTsm+CU8QOa+MI/yxUU0YC5ofIoKy+kdK/rbZLDa+CpSV0/X1KAtt5a1U4h4WugKPen
         vgmQCGbzIZQGdBCIhw873fefs3rY1dBzJXutxs91ftme2lwn8ZjDIawOnbLSwrNWZEPM
         MbHw==
X-Gm-Message-State: ACrzQf3bWwg+btRUI7wTV9lxPWQTMqUg5ItcRsJpgfQqw2wv0+X0FFBy
        dKc3EVBm9JZ4w6m6zDpBiFUdIA==
X-Google-Smtp-Source: AMsMyM5dru/zrIlWCWOMM3MR+PAPQVvCs5DEfgM87qvE7/g6h5FWngslHTI+i/+ewSbIZhUTwEzRQQ==
X-Received: by 2002:a63:db4a:0:b0:43c:9d3b:9c4a with SMTP id x10-20020a63db4a000000b0043c9d3b9c4amr18325130pgi.474.1664383718552;
        Wed, 28 Sep 2022 09:48:38 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id x188-20020a6286c5000000b00537e40747adsm4209922pfd.36.2022.09.28.09.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 09:48:37 -0700 (PDT)
Date:   Wed, 28 Sep 2022 10:48:35 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     andersson@kernel.org, arnaud.pouliquen@foss.st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V8 0/2] remoteproc: support self recovery
Message-ID: <20220928164835.GA2990524@p14s>
References: <20220928064756.4059662-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928064756.4059662-1-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Sep 28, 2022 at 02:47:54PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> V8:
>  Rebased on linux-next/master tag: next-20220927
> 
> V7:
>  Per comments from Arnaud Pouliquen:
>    Typo fixes
>    Added A-b tag
> 
> V6:
>  Rename rproc_firmware_recovery to rproc_boot_recovery
>  Drop the unlock/lock when do reproc_attach_recovery
> 
> V5:
>  Rename RPROC_FEAT_ATTACH_RECOVERY to RPROC_FEAT_ATTACH_ON_RECOVERY
>  Add kerneldoc for rproc features
>  Change rproc_set_feature to return int type and add a max feature check
>  Use __rproc_detach and __rproc_attach when do attach recovery
>  https://patchwork.kernel.org/project/linux-remoteproc/cover/20220615032048.465486-1-peng.fan@oss.nxp.com/
> 
> V4:
>   Based on Bjorn's comments on V2-2
>   Move the rproc_has_feature/rproc_set_feature to remoteproc_internal.h and
>  Keep rproc_features still in remoteproc.h, because we use
>  RPROC_MAX_FEATURES to declare bitmap.
>   Update commit log for patch 2/2, and add comments
> 
>   https://patchwork.kernel.org/project/linux-remoteproc/cover/20220323034405.976643-1-peng.fan@oss.nxp.com/
> 
> V3:
>  Resend the wrong labeled patchset
>  https://patchwork.kernel.org/project/linux-remoteproc/list/?series=621311
> 
>  Write a cover-letter
>  To i.MX8QM/QXP, they have a M4 core self-recovery capability without
>  Linux loading firmware. The self recovery is done by
>  SCU(System Control Unit). Current remoteproc framework only support Linux
>  help recovery remote processor(stop, loading firmware, start). This
>  patchset is support remote processor self recovery(attach recovery).
> 
>  In order to avoid introducing a new variable(bool support_self_recovery),
>  patch 1 introduce a new function, rproc_has_feature to make code easy to
>  extend, cleaner, such as we could move "bool has_iommu" to
>  rproc_has_feature(rproc, RPROC_FEAT_IOMMU).
> 
>  Patch 2 is introduce a new function rproc_attach_recovery for
>  self recovery, the original logic move to rproc_firmware_recovery meaning
>  needs linux to help recovery.
> 
>  V2-version 2:
>  https://patchwork.kernel.org/project/linux-remoteproc/list/?series=621311
>  Introduce rproc_has_feature
> 
>  V2-version 1:
>  https://patchwork.kernel.org/project/linux-remoteproc/patch/20220126085120.3397450-1-peng.fan@oss.nxp.com/
>  Nothing change in V2.
>  Only move this patch out from
>  https://patchwork.kernel.org/project/linux-remoteproc/list/?series=604364
> 
> Peng Fan (2):
>   remoteproc: introduce rproc features
>   remoteproc: support attach recovery after rproc crash
> 
>  drivers/remoteproc/remoteproc_core.c     | 62 ++++++++++++++++--------
>  drivers/remoteproc/remoteproc_internal.h | 15 ++++++
>  include/linux/remoteproc.h               | 16 ++++++
>  3 files changed, 74 insertions(+), 19 deletions(-)

Applied.

Thanks,
Mathieu

> 
> -- 
> 2.37.1
> 
