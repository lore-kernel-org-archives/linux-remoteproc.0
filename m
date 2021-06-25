Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4844FC49EA7
	for <linux-remoteproc@archiver.kernel.org>; Fri, 25 Jun 2021 23:20:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 280096195F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 25 Jun 2021 23:20:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbhFYXW0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 25 Jun 2021 19:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbhFYXW0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 25 Jun 2021 19:22:26 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6631C061767
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jun 2021 16:20:03 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id m17so5482118plx.7
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jun 2021 16:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WW8u/s/RwN9LA/+V7EDlUcg5hd+g4HfKjzv3HZqNazI=;
        b=XCmBVfN1F8v5/kQ+C5gaJ57Hc4hCPmBNddwkH7ybxfw05KXFtpn/pWo7h5i51+ovdp
         QDhkgAqpIuvEXC/ha/LBYeLHDnd8lDTe7f05fxFel6VjagTVnJQ3UzKxFiDaZYrIlIzW
         StzYLS6bqmqkSionlUJVOxWtJEizjyHFAlyyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WW8u/s/RwN9LA/+V7EDlUcg5hd+g4HfKjzv3HZqNazI=;
        b=n65InlEtPevIuPVQLzhETdpQNqQzOsRlHV5EqzwpMU9YPIMDILU3vv8NVUYlmA3mOd
         3UJm7QocroHvrtRUzAJkhvm8sASllSJG/CxtD77GHY1QHc7nakj4iS13/OGjGyJTrd+r
         Ls7gMNO3huIjIk6Vf74KgXcEUO9+ouOwcGoEv2G6n8THuGIFEP7nuEgIxzkQHT7OS8FK
         25W9VK2DZdi9Zy2kB28Vt5pVSX3o/FkRucvIdzupZ8qSdImBXGbfn+26yjm+4ejFa3ZM
         QIOifu6vnrjPEZnylxNHzsIGekanlQul0xsJh/RBpnAKs0//iCcMhmzuos7Qej460ZIp
         8/Qw==
X-Gm-Message-State: AOAM530855BiAqVBYsv0CwfAsEkAW0UFIYaF9MvvEjs6Yep8IHGt9UkX
        XK4nUJaCtjU2Xo/9TyofREWheA==
X-Google-Smtp-Source: ABdhPJxWeDUCoSLRK9FE/s31h1zNNeTdYapRWfF+gc13a8LbRk/gK4Ju1R1BU4tOcNkwRazh8HB3DQ==
X-Received: by 2002:a17:90a:9308:: with SMTP id p8mr13750390pjo.119.1624663203356;
        Fri, 25 Jun 2021 16:20:03 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:cc13:a7dd:f4b5:2160])
        by smtp.gmail.com with UTF8SMTPSA id x27sm699132pgl.74.2021.06.25.16.20.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 16:20:02 -0700 (PDT)
Date:   Fri, 25 Jun 2021 16:20:00 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org
Subject: Re: [PATCH 1/9] dt-bindings: remoteproc: qcom: pas: Add SC7280 MPSS
 support
Message-ID: <YNZkoMIFJXOlSI6t@google.com>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
 <1624564058-24095-2-git-send-email-sibis@codeaurora.org>
 <YNYOkmja0kfuzLpF@google.com>
 <ca7ca4df465f50c6db03a4642102c636@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ca7ca4df465f50c6db03a4642102c636@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jun 25, 2021 at 10:58:45PM +0530, Sibi Sankar wrote:
> On 2021-06-25 22:42, Matthias Kaehlcke wrote:
> > On Fri, Jun 25, 2021 at 01:17:30AM +0530, Sibi Sankar wrote:
> > > Add MPSS PAS support for SC7280 SoCs.
> > > 
> > > Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> > 
> > On which tree is this series based? I guess it must be the remoteproc
> > tree
> > since the conversion of the binding to YAML isn't in Linus' tree yet,
> > however the patch doesn't apply cleanly against remoteproc/for-next:
> > 
> >   patching file
> > Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> >   Hunk #2 succeeded at 144 (offset -4 lines).
> >   Hunk #3 succeeded at 285 (offset -4 lines).
> >   Hunk #4 succeeded at 416 with fuzz 2 (offset 23 lines).
> >   Hunk #5 succeeded at 492 (offset 25 lines).
> >   Hunk #6 FAILED at 485.
> 
> https://patchwork.kernel.org/project/linux-arm-msm/cover/1624560727-6870-1-git-send-email-sibis@codeaurora.org/
> 
> sry for wasting your time I missed
> mentioning that it was dependent on
> ^^ series.

Ah, thanks!

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
