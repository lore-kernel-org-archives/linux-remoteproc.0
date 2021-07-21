Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02225C636C9
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Jul 2021 05:45:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D183C6101E
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Jul 2021 05:45:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232684AbhGUFFD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 21 Jul 2021 01:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233283AbhGUFEY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 21 Jul 2021 01:04:24 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A532C061767
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 22:44:58 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id t143so1727666oie.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 22:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=OZ+eKXyM6tJgPfiMyzHLbhC2Gq2GeuohG8n3p1aQmww=;
        b=a3ltlIFw3PDaPGWCtUL30D2NpHapO5Ew/TlfmUCEZKmzpGNEwGkbUPHe6vnMTnS3T3
         SRzQtCjriEnnevgAxqb6+5turJkmn7YkBhK9zRjTD10ejpbCW4Giv3aLNrQHV/3PwCQv
         cjwUI5lGJC+bixz1gLOaXL3vtrin4B8En2Xq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=OZ+eKXyM6tJgPfiMyzHLbhC2Gq2GeuohG8n3p1aQmww=;
        b=Fc8g6RGWCepdnUGr5V44aP0Qr1nDATfqtUhkPk3rr8k53zcY4SgLpKqaoI2S1YSCNo
         cP2kH9zDK6wk3TQ+KVhV3rC1pmS+ZvI+Inxps0AZBAvUa1c48hUE/opx5NSl/gGbEdCk
         vHhraSAsuniRRIgjHTOa54RTQe1DceK6Ut4epvyTho0ByyGlHoSjYqwGfXI8cu16n4Y+
         JlG22PPKOvrlludilWOJDvaijLtQEsOvhhNasoFnKqIfD2X7VLHtVG8rp6c0okNRd5sZ
         1nv/qGZqdTAUlB+0YrnMlNcEXfrpwzFI2SUlkBoZLJ3PCTmGh5PyYNlXtTCHSw/nqpkM
         fyuQ==
X-Gm-Message-State: AOAM532Ieog9tF6ascncVyOHdBZ2MLelYEuAfNFt/9ZC/0WsrXDpiJ68
        YVNxG9WIEd7a/4BKlcdV1b2k7vB+55NHZ75S0rbheg==
X-Google-Smtp-Source: ABdhPJyGZbF5q862hBiaxTRq3Av5De0RIunb58CNjCEgt4NMQAmb8EQUvqsGkvMKuQY34ShS7h5O9N404r3ozTEhOl8=
X-Received: by 2002:a05:6808:114a:: with SMTP id u10mr4804173oiu.19.1626846298050;
 Tue, 20 Jul 2021 22:44:58 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 05:44:57 +0000
MIME-Version: 1.0
In-Reply-To: <1626775980-28637-9-git-send-email-sibis@codeaurora.org>
References: <1626775980-28637-1-git-send-email-sibis@codeaurora.org> <1626775980-28637-9-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 05:44:57 +0000
Message-ID: <CAE-0n50HwmuYWnqs9TYJYEoB=-BV8Bbz+AMUUy5t9dtN1jSsjA@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] arm64: dts: qcom: sc7280: Add nodes to boot modem
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

Quoting Sibi Sankar (2021-07-20 03:12:58)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 5ed7a511bfc9..3fb6a6ef39f8 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -1219,6 +1224,21 @@
>                         };
>                 };
>
> +               imem@146aa000 {

is sram a more appropriate node name here? Is imem a generic node name
in DT spec?

> +                       compatible = "syscon", "simple-mfd";
> +                       reg = <0 0x146aa000 0 0x2000>;
> +
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +
> +                       ranges = <0 0x0 0 0x146aa000 0 0x2000>;
> +
> +                       pil-reloc@94c {
> +                               compatible = "qcom,pil-reloc-info";
> +                               reg = <0 0x94c 0 0xc8>;
> +                       };
> +               };
> +
