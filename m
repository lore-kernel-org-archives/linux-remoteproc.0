Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8195AC4320A
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Aug 2021 18:55:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69759610A3
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Aug 2021 18:55:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233662AbhHSSz6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 Aug 2021 14:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231741AbhHSSz5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 Aug 2021 14:55:57 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41DC4C06175F
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Aug 2021 11:55:21 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id i3-20020a056830210300b0051af5666070so243806otc.4
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Aug 2021 11:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=mufyADO3wzTmydMEKiodSbUdOKfwxrgUWAkkX2NXaUY=;
        b=B5HzGRXYpErfLHRWHuRP+Zy33rYrnFdRVwP7Ah1gQGFk/i9zrg1aoABJzQa5YXItvx
         EqacP/RnFUoXW8QpswB3ajQvpr5tFQs9SFttQFyyGepb04kC6MSW7vr04ALR7Tp6YsL6
         2SKy8QijVzn+OMTjRbonokc8ztS6vlHAJCRJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=mufyADO3wzTmydMEKiodSbUdOKfwxrgUWAkkX2NXaUY=;
        b=ibuN3JS8X4OPqvAP31uSUaDmdG80xIiESG9P/ecbWM7Rkp5r3NjG3LCO0o2wUepakZ
         O757KZVwQbqfbUeWl+DH7TNN5i3iem7lzZ9z7GfW1FdAUbHT5RUV9OW0a7DUW1ZckQy1
         nvs+j8G3PEYZBUjWwdkuOuPOyjLBmnQpWk6kAegBvPRR7d/CgBz87Ifz8OgXgf0PvfSM
         rGgiz03UjPmF6hBiJK/xwe7u0lYHL5Dr4D9jMmeybf6FEkSGag31RaLDvvHCFn6vssrJ
         DLA7MGZBSAMMQ+TwXOQ/g/MtkwbHonm6OFXGOM6hIkGziKRgS1rhnQKEtaeNXA3i9ab2
         Ejrg==
X-Gm-Message-State: AOAM530HfRVKoQ9meWLv5qDYw8DVU2dx0nlbpTRwGQd9wQbR0AucFnxO
        6Ucom8kpX2AzjYh2lb9CX8CFGci0I64HZSS+Fynmug==
X-Google-Smtp-Source: ABdhPJyDkjYCzIY8JFWkTKloRjmY7nhy+s5wTC7enDEQ0Fet6vpBNfNpj9Ok/m3aRJ2NEVoUarlpUJanlewegEVS/E8=
X-Received: by 2002:a9d:5542:: with SMTP id h2mr13355291oti.25.1629399320024;
 Thu, 19 Aug 2021 11:55:20 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Aug 2021 11:55:19 -0700
MIME-Version: 1.0
In-Reply-To: <1629342136-3667-3-git-send-email-sibis@codeaurora.org>
References: <1629342136-3667-1-git-send-email-sibis@codeaurora.org> <1629342136-3667-3-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 19 Aug 2021 11:55:19 -0700
Message-ID: <CAE-0n531EgLx-gGJswmmNAFmy-P9z=Hh1N=fkLw_uemoeQnYVg@mail.gmail.com>
Subject: Re: [PATCH v5 02/13] dt-bindings: remoteproc: qcom: pas: Add QMP property
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mka@chromium.org, robh+dt@kernel.org
Cc:     ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2021-08-18 20:02:05)
> The load state power-domain, used by the co-processors to notify the
> Always on Subsystem (AOSS) that a particular co-processor is up/down,
> suffers from the side-effect of changing states during suspend/resume.
> However the co-processors enter low-power modes independent to that of
> the application processor and their states are expected to remain
> unaltered across system suspend/resume cycles. To achieve this behavior
> let's drop the load state power-domain and replace them with the qmp
> property for all SoCs supporting low power mode signalling.
>

How do we drop the load state property without breaking existing DTBs?
Maybe we need to leave it there and then somehow make it optional? Or do
we not care about this problem as the driver will start ignoring it?
