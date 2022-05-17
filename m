Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42620C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 17 May 2022 09:43:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245081AbiEQJnS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 17 May 2022 05:43:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245253AbiEQJnJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 17 May 2022 05:43:09 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B137C46B14
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 May 2022 02:42:10 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id fd25so9032035edb.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 May 2022 02:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=siNpk3iy/2AiI/CebguH+obcJ5iL3RxgB8kelVAB/A0=;
        b=flcjJKUCXVDcDKfZLAcf2dTd/cE3yhkSrMqpLMEF4zqyodwEXUgqoRvuiKCZ+Dbdou
         7QJVvCa6zEiBzarwRA+ZZzLhQ8RDLmCnqWXyL+r9hGEUstMGB6k6LX4l6/cemQnxgNf/
         cVPJIXcyu814uTKjvXTRGR+kI4MOoOSWZk+PfZ2LRucLvoAYm1LakeYeJ1lSyvSkFeR4
         6EIJUdmQicJInp5VQZF8kX7XQBRg2InnYnVTarcPFAv3/H03PE+uqmZLPgSIaUwYS5OX
         7mYHqZm71VMB9ta16A87RyzplT+snNiJHs07Yc7INs+yu2Gv+Aaq/Y8GuDlNXbCR9U0l
         S1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=siNpk3iy/2AiI/CebguH+obcJ5iL3RxgB8kelVAB/A0=;
        b=pVHJk5+yDHRC9PDi31gTlnO8hIdrxgELUi87ZA2IHUhmdBdHov62QutD00tTEn1DCt
         G6vEn1B6rJE/n0KovHCn3wsqv0lpF2Sfe5Un0vFQhuZ3qrA/neX7349UIzb9KrKm1KWm
         PBXTJr1EwJt4liOD6YGrVodD239GygRLFHBofG2+yXrl0NPd127ICYloL8xWW047C/vM
         uz6VI8u25EBakIIGyai1quveistDIvaBhA35bOezQkEH6bYJa6RObu08I8PbfvKatnOM
         uABeWrcKV8UncngGjbiJg9V12gqKBcfyrsKhFSjC22UsauvXupJhXx2tAOxUdB8fQS/+
         1XNA==
X-Gm-Message-State: AOAM531FV9qkTZTV5WrSm4XC8pcF2lxflPrHTRsbkIdaV1YgQl0mmWl7
        nejyLRxcPJyFF9uXpIkutxpAU4oiv+PmcjQIsPrN9Q==
X-Google-Smtp-Source: ABdhPJyQwTl6/5xSRooPjamNgZDctgSI/lL5Ultsn4da+PPMTic/fwusW8sjtz1w8bZjOtUGY7FX64a+XwYtJqlE908=
X-Received: by 2002:a05:6402:509:b0:42a:b6c9:eac with SMTP id
 m9-20020a056402050900b0042ab6c90eacmr7750279edv.225.1652780527711; Tue, 17
 May 2022 02:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220323034405.976643-1-peng.fan@oss.nxp.com>
In-Reply-To: <20220323034405.976643-1-peng.fan@oss.nxp.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 17 May 2022 10:41:56 +0100
Message-ID: <CANLsYkx089h16omSwAuteQz4RX9BMgT4_gWg9OqggqXk6m2-rw@mail.gmail.com>
Subject: Re: [PATCH V4 0/2] remoteproc: support self recovery
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     bjorn.andersson@linaro.org, arnaud.pouliquen@foss.st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        peng.fan@nxp.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 23 Mar 2022 at 03:42, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> V4:
>   Based on Bjorn's comments on V2-2
>   Move the rproc_has_feature/rproc_set_feature to remoteproc_internal.h and
>  Keep rproc_features still in remoteproc.h, because we use
>  RPROC_MAX_FEATURES to declare bitmap.
>   Update commit log for patch 2/2, and add comments

I have received your patches but there is a significant backlog to go
through before I can take a look at them.

Thanks,
Mathieu

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
>
>
> Peng Fan (2):
>   remoteproc: introduce rproc features
>   remoteproc: support attach recovery after rproc crash
>
>  drivers/remoteproc/remoteproc_core.c     | 67 +++++++++++++++++-------
>  drivers/remoteproc/remoteproc_internal.h | 10 ++++
>  include/linux/remoteproc.h               |  7 +++
>  3 files changed, 65 insertions(+), 19 deletions(-)
>
> --
> 2.25.1
>
