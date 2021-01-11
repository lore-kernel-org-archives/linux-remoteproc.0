Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C06B1C433DB
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Jan 2021 18:40:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7257F2251F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Jan 2021 18:40:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389967AbhAKSka (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 11 Jan 2021 13:40:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbhAKSk3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Jan 2021 13:40:29 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A65BC061786
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Jan 2021 10:39:49 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id v3so281913plz.13
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Jan 2021 10:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9lAT4gKX4N+kdUDda1+JDYp8tK350gAlBUTh8cpLiXQ=;
        b=Ml5QXNX0McUZcH/qRcQsL68Omvcbc/J5ypXbrpMdc82fn1kt+R0oaoU+PLwar+pdbF
         C2zZqo2Jp7HUR1bR0q0Tiyy8GdeyZMFcC1nGizmtEBr0eHHKSP2keKuE5LV+tlKyLAy4
         DwdNpx8mM20lfufWJBq543oGdIqjpfInocEZVPtaZ5j9XuubyzgQD8N1o93YIKsbtFUU
         /oON46rmpCkoyYy4XI8RpG4bR+1UJozwcqnKiuHzI2ehoLCH19AWqiklMkKuHeN9oNRZ
         dsB6Cd0CQ2CibVQY9v55BRTBvR0sHM18rhGr3gI7pXfIaFDqxRzQTyWAlhmIj0HdlP60
         r4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9lAT4gKX4N+kdUDda1+JDYp8tK350gAlBUTh8cpLiXQ=;
        b=cwgKd3WVlDaZf6KPxQ42GGz83w5niTRC/bdznuRe7lSbeVuvTMUslt4ZUlFDK3mrq+
         3x4sB316sgcbJtUoWglXrQPd6SJCIcmgSxIyRNNjFAXoy5bWcq8GKgqFYFUsZvQ7j10W
         ocmZnoljhk0fHoLEBIkevrwVFWfSmI3S3Xi2mc07X0gdAgI4Z8EQCWfCNtkuwtg6t4ZL
         abDtgCN11YASd8mced3uJj+4MraQzLzH/uVD9LqhKH/PW9YolgvUcROOdmzmS3c9rKx8
         mFA3H4ft1VgleXymAOUBosYyp2JG94yB3OcJaIJb0nT1ALdyt9MTRXzIW4sK0wDeq1/u
         3Txg==
X-Gm-Message-State: AOAM532e2X2M6h4QF45qyoM0Ni3K/FQkB6NGn4ZSgv6jUlUbIa7FORWR
        NdKhvnH/8+UG+LHKWwRqB4mRoA==
X-Google-Smtp-Source: ABdhPJxe1wECB4rRLTdTsDQ2iih4uD9koBgZY0kmmOINViCN2trk/kywbpYH6QpBzsTWZSxuSj6aJQ==
X-Received: by 2002:a17:902:aa45:b029:de:2fb:995 with SMTP id c5-20020a170902aa45b02900de02fb0995mr1020149plr.81.1610390389026;
        Mon, 11 Jan 2021 10:39:49 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id v1sm410339pga.63.2021.01.11.10.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 10:39:48 -0800 (PST)
Date:   Mon, 11 Jan 2021 11:39:46 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/4] remoteproc/mediatek: support L1TCM for MT8192 SCP
Message-ID: <20210111183946.GC144935@xps15>
References: <20210108081738.2175224-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108081738.2175224-1-tzungbi@google.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jan 08, 2021 at 04:17:34PM +0800, Tzung-Bi Shih wrote:
> The series supports L1TCM which is a high performance memory region in
> MT8192 SCP.
> 
> The 1st patch replaces platform_get_resource_byname() and
> devm_ioremap_resource() pairs per [1] suggested.
> 
> The 2nd patch enables MPU for all memory regions.  The patch was
> independent but merged to this series per [2] suggested.
> 
> The 3rd patch adds a new reg-name "l1tcm" for L1TCM.
> 
> The 4th patch supports L1TCM in the firmware loader.  Note that MT8192
> SCP is still under development.  The patch breaks early MT8192 SCP
> firmware which should only break our own development environment.
> 
> Changes from v1[3]:
> - Adds 2 patches at beginning of the series.
> 
> [1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201214050521.845396-3-tzungbi@google.com/#23879113
> [2]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210107023020.3224002-1-tzungbi@google.com/#23879623
> [3]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=401287
> 
> Tzung-Bi Shih (4):
>   remoteproc/mediatek: use devm_platform_ioremap_resource_byname
>   remoteproc/mediatek: enable MPU for all memory regions in MT8192 SCP
>   dt-bindings: remoteproc: mediatek: add L1TCM memory region
>   remoteproc/mediatek: support L1TCM
> 
>  .../bindings/remoteproc/mtk,scp.txt           |  8 +--
>  drivers/remoteproc/mtk_common.h               |  6 ++
>  drivers/remoteproc/mtk_scp.c                  | 62 +++++++++++++++++--
>  3 files changed, 68 insertions(+), 8 deletions(-)

For this set:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> -- 
> 2.29.2.729.g45daf8777d-goog
> 
