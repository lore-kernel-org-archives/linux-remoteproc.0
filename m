Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 655D1C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Sep 2021 20:01:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 380B661100
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Sep 2021 20:01:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346147AbhIGUCe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 7 Sep 2021 16:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346112AbhIGUCd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Sep 2021 16:02:33 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EDB3C06175F
        for <linux-remoteproc@vger.kernel.org>; Tue,  7 Sep 2021 13:01:27 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id i8-20020a056830402800b0051afc3e373aso582655ots.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Sep 2021 13:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=9Zw+ENmJBvtIj3INdZqSWHDc9XknMQ4poMiOqfGky9k=;
        b=N6kpr1y3WSumLzx9C+Q1Xl9F7ehngVdHOqu4nbZN30ggzXpYYeILncVCU3G0Le1aBF
         mtuP33EFdSOC7tJe6uW/VL2w9XgEcFrEfhB9j0J1AinEe1/LG2agZh2xqxDO7faseCft
         ppH5DeKIdxLZ7oM6qaxA4MOGLInnyiLWDqLGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=9Zw+ENmJBvtIj3INdZqSWHDc9XknMQ4poMiOqfGky9k=;
        b=j1d460/P4Al8TZrNqBP/Zl45Whncl227jAa87t2/yPMzk9NSN2KEMOVQMRsyWaHYd1
         9PqQjw2RI4Kg/IC1gAaH4QeQFbrzvXNqlaUhYSCgav06BwCKEScdfRHag/yFMaV6O9uN
         qbnlQN8vOnoe6JDpieFFjj/2kA84+bfGAhCk4IHihv17X8KCzgMvO+/N54oWxvfE/y0w
         Ona0DhP+m/kIQVO5MZdPrwgOdydGpIs6fsld+rntaumLv3LWm/vKbh1whdQ3zmNgEuIq
         6+QsulszWPS+qWrH58fj1L2YW1kGyQJQJdDuMwW0yd4MQiapq5K28xu+Vh6w84olvU9g
         R7+w==
X-Gm-Message-State: AOAM53136HTMWwMCqSazmosmT2v/2AgauvZi2R4PrEgby9nK6BrNXIek
        BZX1dG8mq/NG9fwcQZjVq3R40ym6XHpCYwqI3KqOAQ==
X-Google-Smtp-Source: ABdhPJw6kZGLqVVN2awlrCBOX28FZkbtM+22KzHFlQj9SR7EoCtFKrTWdARqtlf13fI6bZedxgJFZTkj9lPeBVK2G7g=
X-Received: by 2002:a05:6830:18c7:: with SMTP id v7mr128559ote.126.1631044886290;
 Tue, 07 Sep 2021 13:01:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Sep 2021 20:01:25 +0000
MIME-Version: 1.0
In-Reply-To: <1630918485-15052-6-git-send-email-sibis@codeaurora.org>
References: <1630918485-15052-1-git-send-email-sibis@codeaurora.org> <1630918485-15052-6-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 7 Sep 2021 20:01:25 +0000
Message-ID: <CAE-0n53LwrC=fL2_p-KQXpCP_1+rwteQbb9m0ejFHYz7G8Dvbw@mail.gmail.com>
Subject: Re: [PATCH v4 05/10] remoteproc: mss: q6v5-mss: Add modem support on SC7280
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mka@chromium.org, robh+dt@kernel.org,
        saiprakash.ranjan@codeaurora.org, will@kernel.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2021-09-06 01:54:40)
> Add out of reset sequence support for modem sub-system on SC7280 SoCs.
> It requires access to an additional set of qaccept registers, external
> power/clk control registers and halt vq6 register to put the modem back
> into reset.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
