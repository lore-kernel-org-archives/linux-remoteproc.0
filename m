Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BBCAC433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 24 May 2022 17:28:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239937AbiEXR2R (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 24 May 2022 13:28:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238246AbiEXR2R (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 May 2022 13:28:17 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD587CDE2
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 May 2022 10:28:14 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id wh22so36628178ejb.7
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 May 2022 10:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=veu2FPBaI/1DFm4PUFxv9FNq6rpu8nFudiGrwlmGHSM=;
        b=gZ/XlZBlp4L8IWxs+qoqoVja1YNbIPorTCnCOL3ZtY+iokMWUUaD/qbXxH3FqDY/YK
         z2IDTP/hvjBYIrG/x3QYmaEeEdyDEheyjvJt2gpG0KV6gQqa1jEST15Jwb+iJG0rGBzz
         m+ASNmvLNq/1DpUjSDcrb5XeLLw7XO5AXyVgLdNcBCc1RkQ3tE4hDjk0tLb1Ypw2fogP
         R+Tv/EsU8qKhc2QDewyp6Z4H3wsn3SKJisGTmtnW7PZHcz4DlbCAKqtws7mOWNIYhTEm
         BphQU5c9xe4GllqpbcDeUDcjVlbjlQuWZ7VTVoGjrCnwhMAPaWbEgDRVa4dx1fS87N9X
         r5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=veu2FPBaI/1DFm4PUFxv9FNq6rpu8nFudiGrwlmGHSM=;
        b=gjPnEpcpoJva6f3BiWpZzTf0ZR6LFJmx4YR+7jNejyfc2uNpSIkJbeF3qIVKBweEm8
         /6LrxpnmR/4z+Jnje6pwUFYK+eCv6ptB4PVkKTygtLoAGV22URKI0jKWuoi+TXP5oj0s
         NRmEu8W/k16UWwmeHf77F4UaUJzUK1OpAzmtqEzR/gJvvfhUFVFCCQGTHca0AlbhtuGz
         Bz+uSJm78gqlbzU6iRXujVG9mQ3t4Oc+EOzyTfgS+WsR3DfFAspoWxzUJcuLdkZgsGOa
         aL+9Jrx/Va6V3JMdz1Aoa4ummbs5wv2BIp1chXrmQFU3bKkiXle0adVTl+kwfI4MzRyi
         +KHg==
X-Gm-Message-State: AOAM5338Y9m/OVCKzNRHQJN7N7PIc24fJMSi6YvtbgDLAR37nWThHKVR
        /yysDGwWmjCePb/lr29FLYzw8w==
X-Google-Smtp-Source: ABdhPJzNuf50ko0QWScaW7JCNXkoXZrgS/sd+uO6LY8fdrjSymVBWa5CO/EMaNYqNM1M5FqG8Jxnlw==
X-Received: by 2002:a17:906:350f:b0:6fe:a264:2cd1 with SMTP id r15-20020a170906350f00b006fea2642cd1mr20654456eja.735.1653413293370;
        Tue, 24 May 2022 10:28:13 -0700 (PDT)
Received: from [192.168.0.177] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d3-20020a170907272300b006f3ef214e53sm7308396ejl.185.2022.05.24.10.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 May 2022 10:28:12 -0700 (PDT)
Message-ID: <014a6c1c-2795-f066-f103-9a97afc35da7@linaro.org>
Date:   Tue, 24 May 2022 19:28:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 1/6] dt-bindings: remoteproc: Add Xilinx RPU subsystem
 bindings
Content-Language: en-US
To:     Tanmay Shah <tanmay.shah@xilinx.com>, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        michal.simek@xilinx.com
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220518194426.3784095-1-tanmay.shah@xilinx.com>
 <20220518194426.3784095-2-tanmay.shah@xilinx.com>
 <45fea4a1-387f-9684-a90b-58b695b54172@linaro.org>
 <c97d61b0-8a38-5054-d5f1-bc7c5e7bcf61@xilinx.com>
 <1b117e49-28d0-da75-68ee-c2fcef9fc9a9@linaro.org>
 <c7b248f4-9ec1-2ae8-c7e3-55f37592f56e@xilinx.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c7b248f4-9ec1-2ae8-c7e3-55f37592f56e@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 24/05/2022 17:43, Tanmay Shah wrote:
> With this, I will add 'maxItems: 8' in sram and memory-region properties.
> 
> If everything else looks good on schema in this revision, could you 
> please also review next (dts) patch in this series?
> 
> If that looks good, can I get your 'rb' on that?
> 
> so we can reduce scope of reviews for next revisions?

There is no need to resend after receiving a tag, so the amount of
reviews/versions won't change.


Best regards,
Krzysztof
