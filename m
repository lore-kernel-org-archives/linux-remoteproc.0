Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A369C07E95
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Jul 2021 21:16:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 344F861003
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Jul 2021 21:16:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234796AbhGTUf5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Jul 2021 16:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235900AbhGTU3q (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Jul 2021 16:29:46 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C642C061766
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 14:10:21 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id x16so12056200plg.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 14:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iPLLJNllretlsCYSinbnRj7C++Fhv0zvpc25JToQyOg=;
        b=Rz5apqxo85l0olxLbgekp5Uxit+gY0ong++/SmfwhIQCi5GFWTfd6XQmxsGYLLI8jZ
         ALM3OerFRMaEDv1M/Xh3x1BIhjfVY9BDp4qLLCc4VQs/fRB6iUR8aFnPbEuiATs7sIg9
         bEW+kve6hKmbd1hdEZp7C7IONST3pQQH+E4fE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iPLLJNllretlsCYSinbnRj7C++Fhv0zvpc25JToQyOg=;
        b=BBLxzW4/iOdi78rbChKX2Yc/IcIUCj56ZbzOB7QQdVoiTV/+JbPuDFJdnr8rNJX0Nw
         1dyEnyFOLynF0TSYsuR6N1w7xHt5QER5KbYNTXLyPyh2cSEPfoCxEssAQSllnJdde3Zf
         rnR+8l8i78EpO9ReB0hpJxDuTjeV7nLbFJGplVLp6kWtxYqu4wpcVbm6GXIoga4mIJMK
         iVQ84oD+rxDsti0zUQjSYwyyejYMOgw3zZuy0QT+GDFIkZDtg3bj0hwbhLIWliab0n6I
         l/p8ythAW0OXHxWoak47btK9kPFttaJY/PdhEtWC/6EgY70W3o4IZuq7Axk/OclrOOVM
         JTBQ==
X-Gm-Message-State: AOAM530ku3KlWAX8EoohDcctqs8XGSeOAfcPte6jRSskQ77MRbQ9qLLJ
        ssNYrmUi+QbScW7F61C1qNAn0A==
X-Google-Smtp-Source: ABdhPJzu7JcPGOKnCGpaQdLaXwgf4J/KFtla0/QwS8D48x/nYI/Ftq3D/6P9RfLFqDgzRflg87PJlg==
X-Received: by 2002:a17:90a:df04:: with SMTP id gp4mr351635pjb.164.1626815420908;
        Tue, 20 Jul 2021 14:10:20 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c9c3:db46:7281:8e32])
        by smtp.gmail.com with UTF8SMTPSA id f3sm20576515pjt.19.2021.07.20.14.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jul 2021 14:10:20 -0700 (PDT)
Date:   Tue, 20 Jul 2021 14:10:18 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     swboyd@chromium.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, ulf.hansson@linaro.org, rjw@rjwysocki.net,
        agross@kernel.org, ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v4 01/13] dt-bindings: soc: qcom: aoss: Drop the load
 state power-domain
Message-ID: <YPc7uoyHhGUj8hu3@google.com>
References: <1626755807-11865-1-git-send-email-sibis@codeaurora.org>
 <1626755807-11865-2-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1626755807-11865-2-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jul 20, 2021 at 10:06:35AM +0530, Sibi Sankar wrote:
> The power-domains exposed by AOSS QMP node are used to notify the Always
> on Subsystem (AOSS) that a particular co-processor is up/down. These
> co-processors enter low-power modes independent to that of the application
> processor and their states are expected to remain unaltered across system
> suspend/resume cycles. To achieve this behavior let's drop the load
> power-domain and replace them with generic qmp_send interface instead.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
