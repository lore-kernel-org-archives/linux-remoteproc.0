Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8380AC43460
	for <linux-remoteproc@archiver.kernel.org>; Sun, 18 Apr 2021 01:55:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66B98611AC
	for <linux-remoteproc@archiver.kernel.org>; Sun, 18 Apr 2021 01:55:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237093AbhDRB4N (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 17 Apr 2021 21:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236800AbhDRB4K (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 17 Apr 2021 21:56:10 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33DFC061760
        for <linux-remoteproc@vger.kernel.org>; Sat, 17 Apr 2021 18:55:41 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id t22so15590371ply.1
        for <linux-remoteproc@vger.kernel.org>; Sat, 17 Apr 2021 18:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=rTkjJTulG+ppsNDe/JVemSnD0G0lniH+huBXipnFnPU=;
        b=M0EX3nCTbthJnNOFP1+7/mW8tkxoj1NiaW5J79Z7MUvjIZvd3NdA3ABP5o5DBbVwAu
         KcFpoy61B3x/tTqi+bhwTt4Gs63vO5VdWVpjOAC9MATbrK2zDYVeHhlvX0F42hF5S1xB
         vhpglVh0pm+kInzFg8yBOQBo5KPiQlRx3pqGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=rTkjJTulG+ppsNDe/JVemSnD0G0lniH+huBXipnFnPU=;
        b=o+0VIBJtr5VSVv5jjuXO52MPWzYo6RnKpNxIoQ4OIymyIsszwOyseta1DZYjGHpAt4
         U29lz1sHC6+DKMrRTcWnWAAd7GDy3WCQ+E55R46GXsZbLa8gqCtZwZLqBn1XyiooQUr3
         aojV+meDkt1DhPDtQLgFDoPV2pkiyPZxBP6mvRFQkwvw1GHruMAsTLZZ4XKaMEIr+B7n
         5oxE9GTQO5uaU6isqOau8lilvyNudTfmheeA0vXBrJFFwGxRvK3NFpDSDr7uzzcJ++//
         NHSalugtwx0ssbiRr5edV5iCG+mepnmXAkXgqwCUxxe6MQndv2Wm/XhZ0++NQFDDhSZA
         pSaQ==
X-Gm-Message-State: AOAM530Ps1z5T8SKeeGfaxAJACRN/aEvoFeDAHLPRllP+bXl8V94IjhT
        YOTPZp5CYfwBmdz9BxsZudP9dA==
X-Google-Smtp-Source: ABdhPJwBZDMwGUmMc7vpVHh+Bx25dcFwEDnpourJ8L102VyxWqgwO2Ha+ec0r083CRWhUGrvAyu9jA==
X-Received: by 2002:a17:90b:1193:: with SMTP id gk19mr17440666pjb.143.1618710941533;
        Sat, 17 Apr 2021 18:55:41 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e47c:5232:82d9:6d3f])
        by smtp.gmail.com with ESMTPSA id g23sm5344346pfu.142.2021.04.17.18.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 18:55:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1618574638-5117-5-git-send-email-sibis@codeaurora.org>
References: <1618574638-5117-1-git-send-email-sibis@codeaurora.org> <1618574638-5117-5-git-send-email-sibis@codeaurora.org>
Subject: Re: [PATCH 04/12] dt-bindings: remoteproc: qcom: Add QMP bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     rjw@rjwysocki.net, agross@kernel.org, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org
Date:   Sat, 17 Apr 2021 18:55:39 -0700
Message-ID: <161871093917.46595.9385345299825618188@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2021-04-16 05:03:50)
> Add Qualcomm Mailbox Protocol (QMP) binding to replace the power domains
> exposed by the AOSS QMP node.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
