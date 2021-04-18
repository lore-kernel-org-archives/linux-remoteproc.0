Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CAAC433B4
	for <linux-remoteproc@archiver.kernel.org>; Sun, 18 Apr 2021 02:03:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BAED6120C
	for <linux-remoteproc@archiver.kernel.org>; Sun, 18 Apr 2021 02:03:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235868AbhDRCET (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 17 Apr 2021 22:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236847AbhDRCER (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 17 Apr 2021 22:04:17 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D874C061761
        for <linux-remoteproc@vger.kernel.org>; Sat, 17 Apr 2021 19:03:48 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id y32so21802307pga.11
        for <linux-remoteproc@vger.kernel.org>; Sat, 17 Apr 2021 19:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=C2HEOji+lkE5tYxtcPnkjsb+drTF+enO01dc9wFWorM=;
        b=SZvqil2ehY1UQMfRbMxDzYuySIf9LIymH+MgcHm9ka6xu9qS0JSv2a5mZITl8a5QiY
         6hoJUORBanFBxbqlu5Rmava05kTx/0uljQeQv8DDuzNdiLuPfsidCy7FkpSt6eHwgJUl
         TwFQlspdeIShxELRJ0K8wDTOWqGQAKRzbq1lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=C2HEOji+lkE5tYxtcPnkjsb+drTF+enO01dc9wFWorM=;
        b=IXIol0rTnFPiju5yFaqeGYj6uipXWj/0qegQ3qz5haW0FkcT8op0Ih6uNydtiY1FRx
         bUL428gBngog6IfwJFeDZWg27TmIbpw732YfFJFxm5kOxUvk1jerYGHvdc65mir/DM2h
         2ZQ+ii9fN7ItM+QXcyLEL0WKGyn2heq6bWWaEu4poQe/5N04I5uS8a5Jz23mAZLiWBRE
         wAW/xOr50X81uMdoYSqLnXOgxsyEjwa90d2Mj+rfigrs2InmDfeNw7keIRUfCSMWYBC/
         fGVE/fpO2EVAW+ZOSh4hffCfhgwzg1yoxjL9yYpn/T5y5CaTwP5MfAKq6SuUFtUqeKf6
         BgPA==
X-Gm-Message-State: AOAM532Kt0CyalRLKkrWcwy79IPKItRaLNwP2VA4t/8zK27Em/D7Ih0s
        hWJn77V0iH1Trh/5wU2R61yLUw==
X-Google-Smtp-Source: ABdhPJzRJqoJpM6U/GqIkIGfW6T8N9btDhAPA3n7hEbWDKYriPvfsj3W96eAuQWswG97A/jq0OWIFg==
X-Received: by 2002:a63:c746:: with SMTP id v6mr5509957pgg.192.1618711428524;
        Sat, 17 Apr 2021 19:03:48 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e47c:5232:82d9:6d3f])
        by smtp.gmail.com with ESMTPSA id v8sm2311556pff.220.2021.04.17.19.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 19:03:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1618574638-5117-13-git-send-email-sibis@codeaurora.org>
References: <1618574638-5117-1-git-send-email-sibis@codeaurora.org> <1618574638-5117-13-git-send-email-sibis@codeaurora.org>
Subject: Re: [PATCH 12/12] dt-bindings: soc: qcom: aoss: Delete unused power-domain definitions
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     rjw@rjwysocki.net, agross@kernel.org, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org
Date:   Sat, 17 Apr 2021 19:03:46 -0700
Message-ID: <161871142685.46595.13849836535825785791@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2021-04-16 05:03:58)
> Delete unused power-domain definitions exposed by AOSS QMP.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
