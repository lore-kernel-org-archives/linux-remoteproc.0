Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD12C433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed,  4 May 2022 06:23:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344887AbiEDG0h (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 4 May 2022 02:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238792AbiEDG0g (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 May 2022 02:26:36 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19E2B19280
        for <linux-remoteproc@vger.kernel.org>; Tue,  3 May 2022 23:23:01 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id p4so601050edx.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 May 2022 23:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/ICd+RLy/KAw7d3EVe6ay1LDqzY/81IaixYgq9AcSbY=;
        b=rpwOrbkET0kIgwT7jgjkT9abeD7MXV7F16sWCFY0XYvqrnO9XNOO9/DhkjGKo5fEC8
         LQVGsydxJeUsHsjGtYloSsO5mOjhiWjLOVsbTG1TaixjN+bAoacL2iw/GxBj0zkBodx4
         vLA3Gp05nHYroPmKMrYUDf/Nh0BvwS9USecPBZLzVJNf+qSRjLPvxsitLcIao/AyGxT4
         fXJ9HGJKtPlmfBh31lgK0Vrzphy55k/UPpusjkV28x0tlBwd+8/woFCDU6lsFOjHjx7D
         rcX8BYTVfgpq1QmhxC401z58fYWnlv2HQ112BoTHSgFA6fNMgw+zWPgMxqcMKXF/EE+5
         2bjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/ICd+RLy/KAw7d3EVe6ay1LDqzY/81IaixYgq9AcSbY=;
        b=8BiOb91sm3MyOz7kj1sxW6xGRolpgYlgw+xxyjedOhjWbYLqsNgWA2YjYVccGnK2sN
         NDnaa1zo1Bi42EyIu1g0g5ny0a/JyG76SyytVYRLkcPVCSwsxWHS58WvfS9jx/lSXu/6
         LbSDcpGWDElWElr4lVpAV7PgTmJjEqCZK1qM+S0MzsGMYPp5Imxl/li4MpTCPgTsvgcK
         z9+PJkN0IS4brdpRjG0V8s1BeykCC8Gi02MJM4nj/35m4P8NZoL5wwCd9K9454PXF/Qw
         riae5ivLWJrGT0ir4TMXtWNB6H7fJ+lA33rCNUE9ZbcJUAkgeux1YtWbV+cvpxCRt36F
         MzEg==
X-Gm-Message-State: AOAM530zrAM48YKLvgoDQNaFQ8G97DS2au3+3/9xWfrb4UEr/0x9yG/j
        G+ttX3Pxeh/ydp/sgDQD4M9V9A==
X-Google-Smtp-Source: ABdhPJxFJJFSk1xLxRDDUo6zVnxtiMbpr2Qusve+SaBXHlAci0YLKutD2xiWzzJnWIPhl2fkSQ8riA==
X-Received: by 2002:a05:6402:154:b0:423:dba8:c7fc with SMTP id s20-20020a056402015400b00423dba8c7fcmr21473341edu.346.1651645379646;
        Tue, 03 May 2022 23:22:59 -0700 (PDT)
Received: from [192.168.0.207] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gz25-20020a170907a05900b006f3ef214e63sm5351504ejc.201.2022.05.03.23.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 23:22:59 -0700 (PDT)
Message-ID: <a86ead7c-4bea-c4f3-b53f-38fa33e74942@linaro.org>
Date:   Wed, 4 May 2022 08:22:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: mediatek: Fix optional
 reg-names for mtk,scp
Content-Language: en-US
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, kernel@collabora.com,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
References: <20220429211111.2214119-1-nfraprado@collabora.com>
 <20220429211111.2214119-2-nfraprado@collabora.com>
 <a95fc4a9-af6b-e2c2-ef41-df9742d393de@linaro.org>
 <4bf2343b-3760-6ebf-7463-0b25fe9d942e@collabora.com>
 <20220503204125.a4xwd7a5e3fxf7et@notapiano>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220503204125.a4xwd7a5e3fxf7et@notapiano>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 03/05/2022 22:41, Nícolas F. R. A. Prado wrote:
> 
> This was also supposed to fix the warning for mt8192, where the order is
> different: "sram", "l1tcm", "cfg". But since Krzysztof said that we want a fixed
> order, then the mt8192 DT will need to be updated.

Yes, please update DTS.


Best regards,
Krzysztof
