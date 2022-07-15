Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F729C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 Jul 2022 06:45:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbiGOGpO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 15 Jul 2022 02:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbiGOGpO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 15 Jul 2022 02:45:14 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F3125C950
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Jul 2022 23:45:13 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id r9so6332948lfp.10
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Jul 2022 23:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=s6eG0cWFmaFgptED2TWTYg714sGFdvYDMGa+KA8yB6Q=;
        b=WrYlFULL2rrZ5fZG9trqBVtXKTCzn4hkvVsKSWIrqQvkiMQs21w76DZ+gQpAzCeJDa
         bYJJ5Ajj5d/qW653vm8ay9eIsbm2A9xdaEGqZW9aR3FYujeiXMtXFnMUs9KgMPa8gZBT
         IftuyN4ZHnl7BiNc3QrzyMsdbGDOyVkRA/mk/74wEFhVXeNl1hM5taeZuejPNVKvjIkj
         spnFys8kt1VahKFwRMm/jTiufQv1m3R6mIVK5xT/9C7lncXoEERby8LfxEzC8M4R+64J
         05spCOlX/dyuZ4eA6TcPzT89bj7ZkwGILC3DAO2A636emauUn3lwjK+6B5pUR8qLbwX5
         Z7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=s6eG0cWFmaFgptED2TWTYg714sGFdvYDMGa+KA8yB6Q=;
        b=3v38N5MK+wkcaKjmKBOXTpeznwHySa/Ung9NxR7tN8ksAzdMrEOo7I35+pCAcC8Aid
         D9CV/vquB0BMj4ON7dO+CZV5LJOQFdVNFIY1zJpHsDUF1iCTlm6WIoIuMBxamKZgWzou
         BSBh/Q+lhbyv5W0mhyso5ompQOC6TRhMlBSQYO6P5SZ3twKGXw06FcQFjtZJo9AUtsko
         gCc0wJo/JI8Trc1jZ/oUv7L2h8Fcv1uTXDxo3pQkbX8A/Zpd27XGdJ4FoWCg4O0EVhYg
         KJ4+58dUwveMvbAI0vjh03/iOTTQz5dGHoECbX5hLvb5bYjxCpYpdZ778z01vHwbEHmQ
         MBpQ==
X-Gm-Message-State: AJIora+VTeWSoHX4mFGtKtB0btB8FTxs02Caq+OHhArPa5BgHgS22DU6
        T/NE3Ieq+AmWxZh67ymQMTbIMw==
X-Google-Smtp-Source: AGRyM1sxahtTvbaYmEdQrM2G7TMm3QM7tC9YNrozirTHaWcx6GFol3E84Jd5X4sFqg702kKUKzjeOw==
X-Received: by 2002:a05:6512:3e0e:b0:489:c79f:4019 with SMTP id i14-20020a0565123e0e00b00489c79f4019mr6936351lfv.68.1657867512823;
        Thu, 14 Jul 2022 23:45:12 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id d29-20020a0565123d1d00b0047255d21124sm752701lfv.83.2022.07.14.23.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 23:45:12 -0700 (PDT)
Message-ID: <9543f3ec-0c41-fc7a-e0f5-2646eee17f0b@linaro.org>
Date:   Fri, 15 Jul 2022 08:45:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 1/2] dt-bindings: remoteproc: mediatek: Add binding for
 mt8188 scp
Content-Language: en-US
To:     Tinghan Shen <tinghan.shen@mediatek.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220715051821.30707-1-tinghan.shen@mediatek.com>
 <20220715051821.30707-2-tinghan.shen@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220715051821.30707-2-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 15/07/2022 07:18, Tinghan Shen wrote:
> Add the compatible for mt8188 SCP to the binding.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 2 ++


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
