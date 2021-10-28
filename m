Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38BA6C433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 28 Oct 2021 22:05:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 217E361056
	for <linux-remoteproc@archiver.kernel.org>; Thu, 28 Oct 2021 22:05:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbhJ1WHv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 28 Oct 2021 18:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbhJ1WHv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 28 Oct 2021 18:07:51 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121AFC061767
        for <linux-remoteproc@vger.kernel.org>; Thu, 28 Oct 2021 15:05:24 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id n11so2274306oig.6
        for <linux-remoteproc@vger.kernel.org>; Thu, 28 Oct 2021 15:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=K9UBnDgY425QDygPvGt3o1Td/4RRZ5EAJhMXHkdozRU=;
        b=FM0rLYNu1+ErBFuS26Bd+y+C6G51CyTBQZ2r5DkqkLzOKvN6ApYpobItt2PNtXDs2b
         AzSg5WVoRoSBQT3oB8FrHN/bGv5G2+wGLFKpfZXPZS0KBpTTXlKTovdMsKIDLF9yGKjx
         gkv/ZVNFnzoKgHcc7DKHaXnrk7PlDgQFf1CwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=K9UBnDgY425QDygPvGt3o1Td/4RRZ5EAJhMXHkdozRU=;
        b=eiQWeF9+jX63+cE9NQrZ4aIaUbOhLQM0uyipEU3Dd0AO8koIPLft1rxlURIOWPLicX
         NifGt08ACv1mYbclCDT/+DA6DQjIuj667cSVvjy1Zuuztfnr+4xfsNn0gXsRNiexkaQd
         sn/8XL1ykODuvYIaVGpeSAXHuC41m5P+HQUOn/B5aM8bb6qb3dJFvLRMsGeg6WXzhCuj
         iiKJYDbLCCXiJzxxh5j+Ppzxq6SsjJBj7mKJJjnIq3wrrXyQodRSd2GcrKx0IaJQvUl+
         urAMsEfQCjZOBlXZBja7NJJ5IWyPcI1Y+/guYxZ6qPyjiYGyuAp5smyNCuGw0H1JK9Uy
         vB8Q==
X-Gm-Message-State: AOAM530pV9rAtEoWqD+seVdZRTNy609SPQ1Ysm/kqle835lyDPV/SHOw
        F4Hq09my/xNe+Ws6wu+k/sOxBcPgE3ANTaPmDZATig==
X-Google-Smtp-Source: ABdhPJwg2zw1/jW0y61U8U7GYDUhUDAXyhoBEIGD5TwRhN4mcpqiCyxsEbT8u9/uL4TUn7cBNIBdRV+TaG1F7YXwbzk=
X-Received: by 2002:a05:6808:2124:: with SMTP id r36mr5286797oiw.64.1635458723366;
 Thu, 28 Oct 2021 15:05:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 Oct 2021 15:05:22 -0700
MIME-Version: 1.0
In-Reply-To: <1635408817-14426-2-git-send-email-pillair@codeaurora.org>
References: <1635408817-14426-1-git-send-email-pillair@codeaurora.org> <1635408817-14426-2-git-send-email-pillair@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 28 Oct 2021 15:05:22 -0700
Message-ID: <CAE-0n53_qNfsdXa2eLY3g74bpq2HhN2DjSGCe0gCwDfovnWPdw@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: remoteproc: qcom: adsp: Convert
 binding to YAML
To:     Rakesh Pillai <pillair@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        ohad@wizery.com, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibis@codeaurora.org, mpubbise@codeaurora.org, kuabhs@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Rakesh Pillai (2021-10-28 01:13:35)
> Convert Qualcomm ADSP/CDSP Remoteproc devicetree
> binding to YAML.
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---

Found it. I think it hit spam :(

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml
> new file mode 100644
> index 0000000..90ca7e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml
> @@ -0,0 +1,161 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/qcom,qcs404-cdsp-pil.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QCS404 CDSP Peripheral Image Loader
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description:
> +  This document defines the binding for a component that loads and boots firmware
> +  on the Qualcomm Technology Inc. CDSP.

What does CDSP mean? Can you spell out the acronym once?

> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,qcs404-cdsp-pil
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      The base address and size of the qdsp6ss register
> +
> +  interrupts-extended:

I think the recommendation is to use interrupts and the schema will know
to treat interrupts-extended the same.

> +    items:
> +      - description: Watchdog interrupt
> +      - description: Fatal interrupt
> +      - description: Ready interrupt
> +      - description: Handover interrupt
> +      - description: Stop acknowledge interrupt
> +
