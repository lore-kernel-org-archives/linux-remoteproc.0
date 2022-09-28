Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3469C32771
	for <linux-remoteproc@archiver.kernel.org>; Wed, 28 Sep 2022 17:47:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234653AbiI1RrZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 28 Sep 2022 13:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234625AbiI1RrY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 28 Sep 2022 13:47:24 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58115F6866
        for <linux-remoteproc@vger.kernel.org>; Wed, 28 Sep 2022 10:47:23 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id x29so15203547ljq.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 28 Sep 2022 10:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=im9XgETRxegMUR78LTkoFFDmVSoYc1KHVKiHFv5Z2KY=;
        b=a0JNO+DzxwYmo8m4zvCjgit8yewjJ/rCYwUMgSkwxCPXyb8MliNAyp3skj1+3k01/F
         M56hDpGrQJCbaoHs9BdSfS6hcHio2xAckACPJRjtAQvTDIBD1DOrA7cC1mOzPy8GkefX
         N1RkhaulmRkZPF7HGBB9wpJ/o23HY9wDawXIo2WTG6B3iQIOSXt32J5K+b6mrynF7Hid
         BbFiBR0wFjTa3FLwSuODAYnbGWUv1u+FNJH3gLszI1MX7sVtsDf9zmu5i42QMCPbceEb
         oulGVSsqEBN73DUOcJ130okuum1nwAtStdUR8qXWWsCWTscNXqXo1dKqN/7+Poj0WZPO
         DfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=im9XgETRxegMUR78LTkoFFDmVSoYc1KHVKiHFv5Z2KY=;
        b=adZRhmshvhtqlR0/i4/D7yjFVLmwK3pQxsHyxnq+FylU7bER/xoNwwrS4ZO4VtivBW
         GY0aewI/4Ab57K82VMvrdDTCV4S+LDZWrviJPcNBOpdp7wGtVTRSNb6zn+c6p9ybbgID
         F7xH+uRBDhb1A4ei3mPhRfOuG51lOEqp1uqpEusPiT4cbl3jFHtnDjIUzD+MQRq78IZh
         q4ggja1qgK/d3qM9zDAvODO28Y+/7M/se8l7n+3xrkm0oxdyypSHdOiI7RteX2y2kSlX
         Sj9o6rJxLnQlkD5NiazwZ2wlReIL7aLLJI0kbdlx/JFR1vopL9FayPC1VZ7+HnJke0su
         lJzQ==
X-Gm-Message-State: ACrzQf2Qcd7GTKKHM08s4DEwjd4W/mSs1Mgkh5EpgxeKsBci7E0qe7i3
        VRi1gtrz1+psaG5PfgptCZTduQ==
X-Google-Smtp-Source: AMsMyM5lItS8m+a3tjAri2PadLRMGws9Z/yEkLDSyn/WAlOVnniMT1nbYT5FjnGrixQi+wl7GkLLRw==
X-Received: by 2002:a2e:b016:0:b0:26b:f00b:a8cf with SMTP id y22-20020a2eb016000000b0026bf00ba8cfmr11755167ljk.24.1664387241691;
        Wed, 28 Sep 2022 10:47:21 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id i8-20020a056512006800b00494935ddb88sm531221lfo.240.2022.09.28.10.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 10:47:21 -0700 (PDT)
Message-ID: <b748aebe-09b5-d4b2-a6e4-0f13e440bc05@linaro.org>
Date:   Wed, 28 Sep 2022 19:47:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3 01/11] dt-bindings: remoteproc: mediatek: Give the
 subnode a persistent name
Content-Language: en-US
To:     Tinghan Shen <tinghan.shen@mediatek.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20220927025606.26673-1-tinghan.shen@mediatek.com>
 <20220927025606.26673-2-tinghan.shen@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220927025606.26673-2-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 27/09/2022 04:55, Tinghan Shen wrote:
> The node name doesn't matter to add the subnode as a cros-ec rpmsg device.
> Give it a clear persistent node name to simplify scp yaml.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../bindings/remoteproc/mtk,scp.yaml          | 35 ++++++++++---------
>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  2 +-
>  2 files changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index 7e091eaffc18..786bed897916 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -58,6 +58,23 @@ properties:
>    memory-region:
>      maxItems: 1
>  
> +  cros-ec-rpmsg:
> +    type: object

additionalProperties: false on this level

> +    description:
> +      This subnode represents the rpmsg device. The names of the devices

What are the devices? You wrote that it is one device, not devices.

> +      are not important. The properties of this node are defined by the
> +      individual bindings for the rpmsg devices.

??? No, you need to define the properties of the node, e.g. by a ref.

> +
> +    properties:
> +      mediatek,rpmsg-name:
> +        $ref: /schemas/types.yaml#/definitions/string-array
> +        description:
> +          Contains the name for the rpmsg device. Used to match
> +          the subnode to rpmsg device announced by SCP.

maxItems... but is it really a string-array?

> +
> +    required:
> +      - mediatek,rpmsg-name
> +
>  required:
>    - compatible
>    - reg
> @@ -89,21 +106,7 @@ allOf:
>          reg-names:
>            maxItems: 2
>  

Best regards,
Krzysztof

