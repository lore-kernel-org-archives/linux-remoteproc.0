Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B565C43461
	for <linux-remoteproc@archiver.kernel.org>; Sun, 18 Apr 2021 02:03:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F39D06120C
	for <linux-remoteproc@archiver.kernel.org>; Sun, 18 Apr 2021 02:03:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237228AbhDRCD5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 17 Apr 2021 22:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237234AbhDRCD5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 17 Apr 2021 22:03:57 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20913C06175F
        for <linux-remoteproc@vger.kernel.org>; Sat, 17 Apr 2021 19:03:29 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id s14so11155457pjl.5
        for <linux-remoteproc@vger.kernel.org>; Sat, 17 Apr 2021 19:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=2UkCdcxCkeQ7ocXEI0Bytf+xWLtA0Qk4M5dxvPYcA7Y=;
        b=eICm1if6gp7Ae6efb8ncUSr6vByRuHeVXQFK+xnQ943WgFkJeGVGXu5H/b0HCyaFiH
         tX1CUeBM2OGDajDAJp6eZlavBXjpIpaJPRStW12cToGpbpdnX7U43ZdDQOtJj7k7cHWH
         TCOPbrDOY+JkNBPpORy64pBTk8WUaVY9+anNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=2UkCdcxCkeQ7ocXEI0Bytf+xWLtA0Qk4M5dxvPYcA7Y=;
        b=hOc9KpCDn/TyuG3BzRBbtZMMHxlAOiIHKIQRQuf7i1FIVV+FpK2udXLfOdsN454v66
         W8dXLL6zJAn8XLwokT/hQNli1b/y1KHtVgH3pBE9bEA1Pp9qRVSnHJTC8htaw+3JZdLE
         cGyK9nkypwvUnifz2lL2LFPuaXr9uCW87NlyF0OJu6OEff+KmoGZxBW2ym7PorjEXWyH
         wblwEqyPUQbM8Vc6+gDc2Z3E+FQRObwS4jDV0HpcUiev9/5Y9u3y5TH+Xy9vSp4Wy0vZ
         zbN60JlPOQo+8LW2bKswB0RROJWRBThgy1LhA9nvVB+Sa1gy+Msq2tjt6CKRC6MgUtMr
         rNbg==
X-Gm-Message-State: AOAM530uIZP13bcvH7hSEXsm+tMmv0EnAX1f36jSW0JhoiwrheUVFuoy
        Orj3VB4xpTGpS63D7DXhHWABgg==
X-Google-Smtp-Source: ABdhPJz+BPS7QP/pDLIllhg2nCqaVJIg+JdtU7rsoYM0r9g7cwSIGnpk5QD+k3MGQX38WOYOrSrbKw==
X-Received: by 2002:a17:90a:d983:: with SMTP id d3mr9637816pjv.99.1618711408774;
        Sat, 17 Apr 2021 19:03:28 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e47c:5232:82d9:6d3f])
        by smtp.gmail.com with ESMTPSA id q17sm9679712pfq.171.2021.04.17.19.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 19:03:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1618574638-5117-12-git-send-email-sibis@codeaurora.org>
References: <1618574638-5117-1-git-send-email-sibis@codeaurora.org> <1618574638-5117-12-git-send-email-sibis@codeaurora.org>
Subject: Re: [PATCH 11/12] arm64: dts: qcom: sm8350: Use QMP binding to control load state
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     rjw@rjwysocki.net, agross@kernel.org, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org
Date:   Sat, 17 Apr 2021 19:03:27 -0700
Message-ID: <161871140708.46595.7272450915110466257@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2021-04-16 05:03:57)
> Use the Qualcomm Mailbox Protocol (QMP) binding to control the load
> state resources on SM8350 SoCs and drop deprecated power-domains exposed
> by AOSS QMP node.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
