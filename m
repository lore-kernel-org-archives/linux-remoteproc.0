Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 249AFC636CC
	for <linux-remoteproc@archiver.kernel.org>; Thu, 16 Feb 2023 08:40:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbjBPIkA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 16 Feb 2023 03:40:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbjBPIj6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Feb 2023 03:39:58 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FE6338E95
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Feb 2023 00:39:57 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id gs13so789697ejc.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Feb 2023 00:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LBXmSjxP4oQwpZyGKuVQarXmpiHMmQiRINray2EXZRI=;
        b=E9BSBVEDRiQfpC6NWMMtL6J/fkUXbDzFqT+ZCZYeTxkStbDo2zCQgnaKjAOwI2NgUl
         BFINBxuQRTBbt8hdFzo3FOGKMywELfU+fDXgYj/0ZcT1chHbiuQ1HyJRb6oGvswTPGr3
         0Vqj5MD1qNhWMt46tLaT9cuN+FqzegKFuyws5P6buTgCRr8sNFD4cI2GUS2wZAuB0fkW
         pvu4jCP67MgL+fY6XwL/mkPl7bfnfhJM84UfSV/CcqkfVIAu1FMl6TvdvXrCPPFwXTAI
         Jb3pEBwlKzPhvmTomO8FJRleXw+vQnJANyr7xG1hGfl4b1KaUWmTI/FcMmn5atiIsLYR
         R8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LBXmSjxP4oQwpZyGKuVQarXmpiHMmQiRINray2EXZRI=;
        b=KY5UYFHAOa2yxFu5rfVIQohiDsu/O+IfMdAlwKue3bHnkwC7PNdJ6wIsKxi0GRuPoi
         G+4q9QreR0+JZgk9WIwo2fdPZMzhGOZdAvK6e/fFQw32lFIkkUyh9Zv3fIkzFo2kSdPE
         O8rf96tTIzztZ+QZqFetYF/1BegMZHk/AAF/qxnxPJQS9yXEIv0dpSflneobx+gBzYI/
         bss6PBhTvD3u1fxJrRDuM30rtbEBwJnjLsSmP7rgJFekN6AuTfjFv83xMSTA/56onNMf
         vkKBn+KYMCQpL0QnxTy6I+k1CzetiD/aWVpIbK+VPCfsg761m+xKItYjmMjn2b8ZjBF9
         aXgw==
X-Gm-Message-State: AO0yUKU10g7Sw/3p0nKe0f5WM8o9rHpZuCFbrGsi5hZGyQ5PrwJ8scLA
        iNHfTJhwHRyr/1Y3WFJAtGO3jA==
X-Google-Smtp-Source: AK7set9Vk7cPr0jfB62hOqufH+6uY6bemdi0YLoSE5G556cDl4CHT7iFm+KvS9EG7aTdtRmTrqELUA==
X-Received: by 2002:a17:906:c353:b0:871:dd2:4af0 with SMTP id ci19-20020a170906c35300b008710dd24af0mr5348190ejb.26.1676536795779;
        Thu, 16 Feb 2023 00:39:55 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u4-20020a1709063b8400b008b1709d45bcsm189361ejf.213.2023.02.16.00.39.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 00:39:55 -0800 (PST)
Message-ID: <500a29f4-d680-e2fb-2b6d-5f5309a646f8@linaro.org>
Date:   Thu, 16 Feb 2023 09:39:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/5] dt-bindings: hwlock: sun6i: Add #hwlock-cells to
 example
Content-Language: en-US
To:     Bastian Germann <bage@debian.org>,
        Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20230215203711.6293-1-bage@debian.org>
 <20230215203711.6293-3-bage@debian.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230215203711.6293-3-bage@debian.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 15/02/2023 21:37, Bastian Germann wrote:
> The dt-bindings tools will compile the yaml dt examples
> and this prevents an error about this node not existing.
> 
> Signed-off-by: Bastian Germann <bage@debian.org>
> ---
>  .../bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml          | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

so Bjorn can fix his tree. Can be also squashed with original one.

Best regards,
Krzysztof

