Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D75BCA0EC3
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Sep 2023 07:07:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231416AbjILHHO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Sep 2023 03:07:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231382AbjILHHL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Sep 2023 03:07:11 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FECAE7E
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Sep 2023 00:07:07 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-401b3ea0656so55741165e9.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Sep 2023 00:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694502426; x=1695107226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vBDJ7vsvnt66EwbjvTvsZHvz9TIcCrUT8XO9mcHsanE=;
        b=HuHJgkW3LgASLygXjE9BCfnP1gxEnUAv0Wq8guHbNHPcs3Jz0mnAvO1s5Ex1Fz6nRZ
         6twt9tIwide38DK2Fk5YPx157RQll4wRIpRP9lGGJKGCYjgDyi+AKky71TYpSqdIGcvi
         ukiTuwqchyu2W8HoPry+15kCOoPArpCfJz2nTqI//ZGIZw/ZlQcVDvEkAmBJBXR4zKap
         qgSktvKIyLBP7tHp+5Xk/++jROgCQzFFsE921GsYvSLymD4Iq2q3qG0URJhjtDW/sUNd
         aSg5JYX6dL8SPiG1wnUUEVENbpYKNi82fn0Nmb9VHWc1i3yqfeAahdloTLyi3sJ7pCHg
         0rMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694502426; x=1695107226;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vBDJ7vsvnt66EwbjvTvsZHvz9TIcCrUT8XO9mcHsanE=;
        b=XiaVYjxdjmR8VencKEqLv4VCf2+LkbKaIwkDnf+kW0bB71/zvTgXoXMFQZ84Tt/lJx
         84LSLd5jWvi4+MStaVHhYjudzrVq+WYTogrTotbJxmXetwG5/SkLyV1vwKXCzwOmLuVK
         ippY9IhGrr9YGNs3xK1jhldpz21q73eHys5/qRM55i/UFTnf1FHyo6ydy8zfWW8L4jcN
         J7aAZEc4cO4CHQO7eyxFccUncwnI1NVQLA5dip9o8Cm2pKpCGlb5U0Mvb9co+IZrcLMl
         SjYcVgp0XxbWH/t0FmXxRhjGyMcLLxenLgzu7vCOut0PWRIuPD8v/vUX2ZopQZRoHQoo
         W5dw==
X-Gm-Message-State: AOJu0YyBAjzZNKaixgo3aDtlIfBSsab9QjR3iklWbKQusKnd1fKlwXYf
        3bBhmTQi3z40fkvtZ6co1EwFGA==
X-Google-Smtp-Source: AGHT+IF32sHUwvxUn8ZMrRy0ut1goEP0q421iwFV0dTEcbzgZriGn/rEZodx0dHeXvz3gW6POJtf+A==
X-Received: by 2002:a05:600c:3b06:b0:403:8fb9:8d69 with SMTP id m6-20020a05600c3b0600b004038fb98d69mr3388514wms.25.1694502425774;
        Tue, 12 Sep 2023 00:07:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b003fe0a0e03fcsm15150292wmm.12.2023.09.12.00.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 00:07:05 -0700 (PDT)
Message-ID: <67de5706-d966-dd71-85c3-c95bc1b72733@linaro.org>
Date:   Tue, 12 Sep 2023 09:07:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/2] arm64: dts: imx8mp: add reserve-memory nodes for DSP
Content-Language: en-US
To:     "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "S.J. Wang" <shengjiu.wang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Mpuaudiosw <Mpuaudiosw@nxp.com>,
        Iuliana Prodan <iuliana.prodan@nxp.com>
Cc:     linux-imx <linux-imx@nxp.com>, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        LnxRevLi <LnxRevLi@nxp.com>
References: <20230911224452.15739-1-iuliana.prodan@oss.nxp.com>
 <20230911224452.15739-3-iuliana.prodan@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230911224452.15739-3-iuliana.prodan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 12/09/2023 00:44, Iuliana Prodan (OSS) wrote:
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
> 
> Add the reserve-memory nodes used by DSP when the rpmsg
> feature is enabled.
> These can be later used in a dsp node, like:
> dsp: dsp@3b6e8000 {
> 	compatible = "fsl,imx8mp-dsp";
> 	reg = <0x3b6e8000 0x88000>;
> 	mbox-names = "tx0", "rx0", "rxdb0";
> 	mboxes = <&mu2 2 0>, <&mu2 2 1>,
> 		<&mu2 3 0>, <&mu2 3 1>;
> 	memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
> 		<&dsp_vdev0vring1>, <&dsp_reserved>;
> 	status = "okay";

Drop this example from commit msg, useless and not really correct.

> };
> 
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index cc406bb338fe..eedc1921af62 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -210,6 +210,18 @@
>  		dsp_reserved: dsp@92400000 {
>  			reg = <0 0x92400000 0 0x2000000>;
>  			no-map;

Please test the patches before sending. This does not build.

Best regards,
Krzysztof

