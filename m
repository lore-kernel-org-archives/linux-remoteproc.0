Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB56C433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Apr 2022 23:18:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238791AbiDDXUH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Apr 2022 19:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243643AbiDDXTk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Apr 2022 19:19:40 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1CEFE09
        for <linux-remoteproc@vger.kernel.org>; Mon,  4 Apr 2022 16:17:35 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-e1dcc0a327so8014540fac.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 Apr 2022 16:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=3oavjVNL5tvXCS8rCyRmNRZyTNOmhHfeYfiVBThyPpY=;
        b=X40oLTAq3dSUcjtkQd9V5X6dkLJqgWLCPb38tSrT2KASFKB4M72dgY9+i9r7tRkAJX
         2WFTZ+Ls9Q46VhlgNLPHIorWQUAP/fwrYFHj1hg36kmxAgfvB+wWX1Daa4Fr7NL50Jwn
         6vlDJZw+urzzAJIWP9KHH0jDXdF4AqjIXKi3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=3oavjVNL5tvXCS8rCyRmNRZyTNOmhHfeYfiVBThyPpY=;
        b=E9J5Q/brbY1MlLV/0nRucbVLjvHIO6BZM6pwJLxNPvOVBJOQ+smr1F82DfN1nVoOBu
         3m67QuS9wR0BiYRBkkkVgYr+8oCD8OEuHh+sf/E3ECVLoaYS/CozBsK6D09v3zQw8rsR
         NM7JTC2C3DdfmHuMu9sSDMuo8JB4lCp3b69qAOm6K2/igH4/8aBRwRPib9Tjm6st9PLS
         O/I99ng/YMhkfF9n4pa6d8A3PbABQ9wP+Q9/wkbQ8ib9ZdL1twPLBFVgK3aMDNacETZ0
         42dIbzYEKcpp8na1weiwhwEtJ1n6vMnNDNecMCkpmWs8gO1AYSaZnHz3DY/W8uBRXSQa
         qqJw==
X-Gm-Message-State: AOAM533nYmZpqJvVUSRk7tTaDGQSXjw61/Wkm7xN+rggSKPNO4u+ZaiL
        gPVTJ1MNqgfcQnwr2SCXe9CU3KR3hpk+AFLTWuHSmg==
X-Google-Smtp-Source: ABdhPJw/tm7Cn1JQZT4ViERftJOcoWdd0d2O+5vIOoyfW+N1pdWhsxvqITjnxp3nXTPe4Psm2WQze1TU1CgHCqhalIQ=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr274655oao.63.1649114255219; Mon, 04 Apr
 2022 16:17:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 Apr 2022 18:17:34 -0500
MIME-Version: 1.0
In-Reply-To: <1644813252-12897-1-git-send-email-quic_sibis@quicinc.com>
References: <1644813252-12897-1-git-send-email-quic_sibis@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 4 Apr 2022 18:17:34 -0500
Message-ID: <CAE-0n51qygskCKAv7MwJmM8BVV2D0wT46YCBwxtGKybP4QA+jQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add support for proxy interconnect bandwidth votes
To:     Sibi Sankar <quic_sibis@quicinc.com>, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, dianders@chromium.org, mka@chromium.org,
        krzysztof.kozlowski@canonical.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2022-02-13 20:34:09)
> Add support for proxy interconnect bandwidth votes during modem bootup on
> SC7280 SoCs.
>
> Sibi Sankar (3):
>   dt-bindings: remoteproc: qcom: Add interconnects property
>   remoteproc: qcom_q6v5_mss: Add support for interconnect bandwidth
>     voting
>   arm64: dts: qcom: sc7280: Add proxy interconnect requirements for
>     modem

Is this patch series going to be resent? Does it need to be applied to
sc7180 as well?
