Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9BDCC6FA83
	for <linux-remoteproc@archiver.kernel.org>; Sun, 11 Sep 2022 22:57:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbiIKW5O (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 11 Sep 2022 18:57:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbiIKW5O (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 11 Sep 2022 18:57:14 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2B8A21E18
        for <linux-remoteproc@vger.kernel.org>; Sun, 11 Sep 2022 15:57:12 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-12b542cb1d3so9245032fac.13
        for <linux-remoteproc@vger.kernel.org>; Sun, 11 Sep 2022 15:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date;
        bh=pVS7bTONLkZB3+cDrU8TPMMOnP+Z4vmVq9BPhDF4ly4=;
        b=L5yOeUqc2rtJy2Lee262h1//ZOpxGCQKa1YIzyiaDjObJsUY3dG0q3Y4PTk6VRl1lP
         +KinOOuiAy3wCGHamWeC0rNY4rIzzKr4RyTjs0q643DO8zqlideTQzVYzVEYbvO4Lboq
         ftpXb8AZE1g49+iprxzizCxoj5qJBIIAL+CHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=pVS7bTONLkZB3+cDrU8TPMMOnP+Z4vmVq9BPhDF4ly4=;
        b=X2/gV7SjWynkzC6a4X8EVZcQ7pQrF8uLnMIhD0tt+7lp69BsdJxVjVgCQKtF37dv8g
         uIYUjhIOnfa/zeX29PZrMoQlq7Nr3GKA+ROG9IbL+atuQXAbbzOSyWNjjPFpXuGM/jUr
         bmssybja9Kw+jIX/FjDJkJMW09I7zv8J2qvjXVL7NqPromPH9MEheyVotlr71RXjHHiY
         il2XLwZGrytYtmxvcCg+s1k4Z6UzN2/y0EdsexJcaJf6aoqEXQ7qf8xW9Gw9X1XYfCUC
         q1UJPuAijMmMPB7QmvSIXvZzU8XbfSJI4cOX0UPhBZLrGh4Gh+G8aB6V1uW1iWYeGX0B
         k9gg==
X-Gm-Message-State: ACgBeo2Dvq76QXd8U82wZZnZj49VazuJX5s445NPy5mTrN0qPLKgMqCm
        Yi4umbFFlGLgXqUyMYF7ast70r97yWR9hRuKjYVK4Q==
X-Google-Smtp-Source: AA6agR7Gknt665dcjQGkcGHk1lrhFk+/hwDPLVqBvqwsv4VUJpmZ6ZfUing+21n82woe2ytImsGVHGiVUyZIogehABc=
X-Received: by 2002:a05:6871:6a1:b0:127:3a21:7e00 with SMTP id
 l33-20020a05687106a100b001273a217e00mr10579741oao.44.1662937032318; Sun, 11
 Sep 2022 15:57:12 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 11 Sep 2022 17:57:11 -0500
MIME-Version: 1.0
In-Reply-To: <1662643422-14909-7-git-send-email-quic_srivasam@quicinc.com>
References: <1662643422-14909-1-git-send-email-quic_srivasam@quicinc.com> <1662643422-14909-7-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Sun, 11 Sep 2022 17:57:11 -0500
Message-ID: <CAE-0n53xOdgbPcsQr40N0HbCaC7gpM=QLByoUh1qhQ-=PzA90Q@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] remoteproc: qcom: Add efuse evb selection control
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, bgoswami@quicinc.com,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org, judyhsiao@chromium.org,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        perex@perex.cz, quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org, srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-09-08 06:23:40)
> Add efuse evb selection control and enable it for starting ADSP.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
