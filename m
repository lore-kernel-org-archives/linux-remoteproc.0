Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D597C4338F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 23 Aug 2021 20:14:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 056A9613DA
	for <linux-remoteproc@archiver.kernel.org>; Mon, 23 Aug 2021 20:14:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232375AbhHWUPf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 23 Aug 2021 16:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232262AbhHWUPe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 23 Aug 2021 16:15:34 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3FD7C061757
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Aug 2021 13:14:51 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id x9-20020a056830278900b0051b8be1192fso18947222otu.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Aug 2021 13:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=hGriz5nEPC/9blprw2SSKn2ibNR/r6EGgeTF7xGzQOA=;
        b=VDYJUp7Plh2KyeGxRwUz2J+DE8zDTIowi27TR3jGY8L8VLlUHqO5eHIZziOva/WmBd
         b0CI1i0tDaq7XjlhJhNNNBK+e01KoatUkZ1GR0JbwXuZLKuAS4o6tfiNXIxglqz/X6wr
         gg2r1qr3DXtObXg0yY6XNpiRz3uPrYPpUSZ1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=hGriz5nEPC/9blprw2SSKn2ibNR/r6EGgeTF7xGzQOA=;
        b=qVNkFw4cOHBo+9R3fdQ0+V/7JqApoBcCu+SScwwwNOxvC41UR8tJ2LGE8p/Pv2flNA
         60mEY6RTd5e3q2Yj2s/bIhzx8qh8cKhCfut1vjuUGXClVVc66dntfAlmL2Nsxxcdm318
         PAdalItTzRhZGhd5+8Yw3+ObLBk+fwhPA85JuxG02daUA14Z2X5EJDbifuR3Zfo/QJhR
         shS57ay7bf98qwgCJhYG47n1jsT205U8xt/oJz9cnmLFKv2d+R5Po0sztAfjH+UOx+cD
         bf2h5DLubidW1wADrPOp49Rz33DxwWRCwulExltoFgeQRXtsSmh0NFkYmzyOOYuw5cQb
         lmrg==
X-Gm-Message-State: AOAM533LX8ZBMHRPbyfIHGGBjv2aeuIprNHhn308KEdvvH7pPowHlQ+Y
        oVGeclzYSSCScnA7+uIyOXEJmnT5m0pnCJ51rtCc2w==
X-Google-Smtp-Source: ABdhPJz7QvAa9cl0qW+P2JH63tRIV8M2034yxYv1URsomWS1n7tP7NRfkZ7UKUIw/0NSoy2rXfEUugVzPRXMYhw+n4M=
X-Received: by 2002:a05:6830:88:: with SMTP id a8mr29450117oto.233.1629749691263;
 Mon, 23 Aug 2021 13:14:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Aug 2021 15:14:50 -0500
MIME-Version: 1.0
In-Reply-To: <1629344185-27368-2-git-send-email-sibis@codeaurora.org>
References: <1629344185-27368-1-git-send-email-sibis@codeaurora.org> <1629344185-27368-2-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 23 Aug 2021 15:14:50 -0500
Message-ID: <CAE-0n52t6QkvgzxbmV_sy6b-Bmou7Rsx8WyxN8LKOpJKP7S4KQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] dt-bindings: remoteproc: qcom: pas: Add SC7280
 MPSS support
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

Quoting Sibi Sankar (2021-08-18 20:36:16)
> Add MPSS PAS support for SC7280 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
