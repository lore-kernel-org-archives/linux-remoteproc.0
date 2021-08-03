Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58727C4338F
	for <linux-remoteproc@archiver.kernel.org>; Tue,  3 Aug 2021 08:01:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4011D60F11
	for <linux-remoteproc@archiver.kernel.org>; Tue,  3 Aug 2021 08:01:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234303AbhHCIBP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 3 Aug 2021 04:01:15 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:52148
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234260AbhHCIBP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 3 Aug 2021 04:01:15 -0400
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id BD1883F363
        for <linux-remoteproc@vger.kernel.org>; Tue,  3 Aug 2021 08:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627977663;
        bh=xcgPwRTVNnlB9Ca1BryW6jcXJ520XlA+QdA5eYCuNqY=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=DDLXhx2OZEybII3k7FgTgiBoIUPNrPqSKn76jx9CAWZreKOcUFuUr5x9QVMVOpd0z
         yvCxC/TYawRI8hnuDIzQmQzu8X7Y8OqtCggfbO7Dlp12Sx281JNVt4m2+pbSep56t6
         TrDY5QHxrkID69cH0lGiPvDurP5bJUqm3fgQU1fSHh93A2GYPGoV4IjeATbPFwgt84
         RnOH13h8ZmBXN1DJIC6ETcn9NM6r2kklQtGKGehvFnE8f1lQ9LDK7zS/fKuTEoHikF
         bSpVl5ZF01asVc/CzjGYCA2IIgVQaURlaSpFqHPukUq57nx6/qdQollWFnmf9Ebv2Y
         7Gys5qX6rFLNw==
Received: by mail-ej1-f71.google.com with SMTP id k22-20020a1709061596b02905a370b2f477so696086ejd.17
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Aug 2021 01:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xcgPwRTVNnlB9Ca1BryW6jcXJ520XlA+QdA5eYCuNqY=;
        b=b4J6tf32AR7utoLlVLwBAE2tKAPxm+CG535kJCCj4+bL3UMqCoOwtwogQXEonOuj0Y
         RsfP562uwaVgK7oE/yNBZX+l5Vk2rJFUnEQV9fsDf81MnwHZJtFZxHPdfGeuGKUnkZSQ
         CQlKPVjFTiz+k7WoDIEhi/uozr3rhFt5TszoSUKB0gIq1RDDNC6ErhSqp+wysaq+E9bt
         TFC033hY3MDr4dEtvRcXfkb3Tgf21gUfQ44s5JybE3C7sFO6hJ11Gl4nWIrrLyIrj9Mc
         zZUq6tq7xmXtrv7o4hX4HPtOL5pmGJG6WIR/dnpxZlS3llWY8aBxbHfNrj9fexlgHzdK
         tAVg==
X-Gm-Message-State: AOAM533MIWhBooIqucGZoP1d89Gisw3y7TpKSX6olpzpCy+w18uE1DTG
        xlknNYOnwVllnqEMwdvGaCuNFLOQlcSmxqGnIYzsBrZkidCXUH2R4Z3GcqJL92qZREPy/Nb+gXT
        8dRLLjQF4qOmJpKEK50sgtRBIRUPTzVpH4pXTepTAkKeCy+U=
X-Received: by 2002:aa7:d7c1:: with SMTP id e1mr23476349eds.251.1627977663348;
        Tue, 03 Aug 2021 01:01:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwj/qP1Q41wUE0MaM16YNSLHgwdPMzFI76UL7qB1dSy57AzxsYBf1Q0TLraQrcJ7Xxi0YM1oQ==
X-Received: by 2002:aa7:d7c1:: with SMTP id e1mr23476321eds.251.1627977663186;
        Tue, 03 Aug 2021 01:01:03 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.43.172])
        by smtp.gmail.com with ESMTPSA id c7sm7763197edn.45.2021.08.03.01.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Aug 2021 01:01:02 -0700 (PDT)
Subject: Re: [PATCH v5 3/5] dt-bindings: vendor-prefixes: Add another prefix
 for Mediatek Co.
To:     Tinghan Shen <tinghan.shen@mediatek.com>, ohad@wizery.com,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, matthias.bgg@gmail.com, shawnguo@kernel.org,
        sam@ravnborg.org, linux@rempel-privat.de, daniel@0x0f.com,
        Max.Merchel@tq-group.com, geert+renesas@glider.be,
        fanghao11@huawei.com
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210803075922.11611-1-tinghan.shen@mediatek.com>
 <20210803075922.11611-4-tinghan.shen@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <f084bd57-c6df-cade-fefd-217897caf88e@canonical.com>
Date:   Tue, 3 Aug 2021 10:01:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803075922.11611-4-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 03/08/2021 09:59, Tinghan Shen wrote:
> Add document binding for mediatek.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 07fb0d25fc15..c4252cd570b0 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -760,6 +760,8 @@ patternProperties:
>      description: MStar Semiconductor, Inc. (acquired by MediaTek Inc.)
>    "^mti,.*":
>      description: Imagination Technologies Ltd. (formerly MIPS Technologies Inc.)
> +  "^mtk,.*":
> +    description: MediaTek Inc.

NAK, you already have one MediaTek Inc. I doubt these are different
companies...


Best regards,
Krzysztof
