Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE8CC48BC2
	for <linux-remoteproc@archiver.kernel.org>; Fri, 25 Jun 2021 21:35:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 162DC61921
	for <linux-remoteproc@archiver.kernel.org>; Fri, 25 Jun 2021 21:35:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbhFYVhu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 25 Jun 2021 17:37:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhFYVht (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 25 Jun 2021 17:37:49 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BAB5C061767
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jun 2021 14:35:28 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id x21-20020a17090aa395b029016e25313bfcso6313661pjp.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jun 2021 14:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uHfokonYY4IsHJIZe45nbhfdfmpS+hT7ERJ530OGkgA=;
        b=c+swM+bTpTsn863tPWig6yNcflU00kaWoBe6ho4se3LIMJM64/3IrVmVF9n9wy1RRn
         Ody/OPTuiky+oBUK/GTgcEgj1XJ70DzUow5zcjpMzFUFxEdCu+huRS2+Id3aJFAziRQd
         nBm7o+8j9nU0A3w/4ShYqeCY/g0MPAdehbDHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uHfokonYY4IsHJIZe45nbhfdfmpS+hT7ERJ530OGkgA=;
        b=C2OOvlp6FwKRm/TllRtBCMut51SpvuX7HOUutbw4xeGGZEysrmaYWsX7knR9NEimTc
         Gq9bz/tC4famZeVWwFUCMP/ugklj/sAPMMqb5FgmaZyxsankM23MlYtLnrQfLhTVg7qI
         OQYavA+0S01NwpHfmN4iVlEK5/ErKU/Kkd7hCZwyKC//PYDlYRG7dc/dRyPnfRDmH0p7
         dB/Q+fFGc2KchnRui0GAC6pBEZMXQpPuxTLOn4vSvOipI4xw+yBe1ezgY1qjpgkcxRoC
         67l7UPS8yi2NNhV9XPfY8W2DG8BGAv+y+bdUj32TcaD094qN/fQuJIE+k1h95wkgUxX2
         siOQ==
X-Gm-Message-State: AOAM5337OA2WN60VQpyrwr5gFX1WjznUz+8ksZxGbFk512BKqJO41Vdf
        m50Q1Ez+3MTq6J9WU8q/ddi6nA==
X-Google-Smtp-Source: ABdhPJwVJBb+HmRxybcQnH4mKaYXB5HATNb3IfW8BKVznv3WmHh4gQSSYZGN81p1sygiIjJPYlUqMw==
X-Received: by 2002:a17:902:6b04:b029:10d:8c9e:5f56 with SMTP id o4-20020a1709026b04b029010d8c9e5f56mr11270840plk.8.1624656927332;
        Fri, 25 Jun 2021 14:35:27 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:cc13:a7dd:f4b5:2160])
        by smtp.gmail.com with UTF8SMTPSA id z6sm6313346pgs.24.2021.06.25.14.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 14:35:26 -0700 (PDT)
Date:   Fri, 25 Jun 2021 14:35:24 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        swboyd@chromium.org, ulf.hansson@linaro.org, rjw@rjwysocki.net,
        agross@kernel.org, ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v3 05/13] arm64: dts: qcom: sc7180: Use QMP binding to
 control load state
Message-ID: <YNZMHGYTXV5oJLI7@google.com>
References: <1624560727-6870-1-git-send-email-sibis@codeaurora.org>
 <1624560727-6870-6-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1624560727-6870-6-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jun 25, 2021 at 12:21:59AM +0530, Sibi Sankar wrote:
> Subject: arm64: dts: qcom: sc7180: Use QMP binding to control load state

nit: s/binding //

> Use the Qualcomm Mailbox Protocol (QMP) binding to control the load

ditto

same for other DT patches if you re-spin

> state resources on SC7180 SoCs and drop deprecated power-domains exposed
> by AOSS QMP node.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
