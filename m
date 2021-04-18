Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26528C433B4
	for <linux-remoteproc@archiver.kernel.org>; Sun, 18 Apr 2021 01:54:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED1E661352
	for <linux-remoteproc@archiver.kernel.org>; Sun, 18 Apr 2021 01:54:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236800AbhDRBy7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 17 Apr 2021 21:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231277AbhDRBy6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 17 Apr 2021 21:54:58 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B086FC061761
        for <linux-remoteproc@vger.kernel.org>; Sat, 17 Apr 2021 18:54:31 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id u14-20020a17090a1f0eb029014e38011b09so11755003pja.5
        for <linux-remoteproc@vger.kernel.org>; Sat, 17 Apr 2021 18:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=SbmkNJObxP9556wdW+xlQaE/Mp8r2OHG8tzhh7P27Xs=;
        b=LhKV87qH3gAOImsHtS8QBPR1qLMUI4TzeYbUJi0VIMueON/LYIs1FZtncqgfHHMYEN
         Wr4NoLqKLHgSEhbIHZK6XBXuuE4BMDE0QZxOfabkvABV0G9fZQ2Z8uEYd94VZpFThHbm
         uGH0PihCTwxkuhw2y+zXOMbtHEfPsP7RdaLNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=SbmkNJObxP9556wdW+xlQaE/Mp8r2OHG8tzhh7P27Xs=;
        b=goOxHP9WhttMXtwJ/XrcV2UQ367/zEHa7iseuJt6m6GhkY9X6cS2Td5UltNsosRhVo
         Ar7s3MjfXbfCNb2Av50cEvsfvldLlQzfsES0ZmaoQ1jbgryEnRvp6vD7sWmc9qXlfj8z
         t30ySdUNGpXcVZqc5gHm7ZqHLySPgrPEIsQ89ouIbNg+YvQRQMHCdmpeLLp3zJL7/hFB
         LEZSmWhezK76nWcbf7TPFIjoLcja2SLxPqrfvIo8SokgzDuC2e4t6dx1PQnyHszcXHzu
         B1SQ+T8t+6XQZsr81sbpxSmTa8BH+1HObFyZGIpnurLt0qnLCvBKmma7Og40+x3bpgsJ
         IFQQ==
X-Gm-Message-State: AOAM530kpjBxcJKEy3s9/v2vGlZfyfrj5jq5pEkwkjzkkJrOJZKTdMeR
        BVG/3Im2WsistH6FmtdDAKKwYg==
X-Google-Smtp-Source: ABdhPJyemFBIhm9Dndl7HZBNNf1HHGiN+9UjdhBbcR/ZeXECMvMKe2/UdI9Wmi8AF9bqnYYeHjfsUA==
X-Received: by 2002:a17:90b:1b0a:: with SMTP id nu10mr17597498pjb.118.1618710871167;
        Sat, 17 Apr 2021 18:54:31 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e47c:5232:82d9:6d3f])
        by smtp.gmail.com with ESMTPSA id a16sm9039400pgl.12.2021.04.17.18.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 18:54:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1618574638-5117-2-git-send-email-sibis@codeaurora.org>
References: <1618574638-5117-1-git-send-email-sibis@codeaurora.org> <1618574638-5117-2-git-send-email-sibis@codeaurora.org>
Subject: Re: [PATCH 01/12] dt-bindings: soc: qcom: aoss: Drop power-domain bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     rjw@rjwysocki.net, agross@kernel.org, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org
Date:   Sat, 17 Apr 2021 18:54:26 -0700
Message-ID: <161871086661.46595.17217922888505535304@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2021-04-16 05:03:47)
> Drop power-domain bindings exposed by AOSS QMP node.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
