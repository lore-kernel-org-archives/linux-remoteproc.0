Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9B9C7EE21
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 May 2023 11:23:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjEDLX5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 May 2023 07:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230157AbjEDLXw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 May 2023 07:23:52 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6018919B3
        for <linux-remoteproc@vger.kernel.org>; Thu,  4 May 2023 04:23:50 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so16067450a12.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 04 May 2023 04:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683199429; x=1685791429;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bob107kJR5IdsO7CGNgGuKJ33ZO9RYVaMCNnZGrzk2w=;
        b=H1bJrwvUWwl89Ha8tmDKWPT1t9oMzal0i7KNaes8/F8FeKOilrITk2ywpbaHrda43n
         1ncM19EuyyrqW17SxdGXc2QIFQB8WFMEUB/uYKHNh8zKBBUmdqhGSSDkg6tyjaZOd61m
         rdL/DJxshYEVpo5hHkBVvcLonBCrz21bgxGY5z6FIKYMJmdu+U00suIvKa2CkJyOqo6U
         gu0YpwURiaQKJ3jCG6e1kGwSJgKsM2eCBy+atmKAaNRQQDKJaccuw8h7W60VcZ744tcK
         GLU5f8CjCAr716dnj2B1vI6iCaG7VGL7m771r6lDndYifnQe8A/H59DVZZcAcjOe8UJC
         vE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683199429; x=1685791429;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bob107kJR5IdsO7CGNgGuKJ33ZO9RYVaMCNnZGrzk2w=;
        b=DAFIK9WepxYZQgnSJ6ys+372yTpd6XggGCjSbtjRJ7ITAxbQhzA8CNq1BOFACTfl5K
         CUvn1U5kFny+EhJfoWIHS72sQDZ6swn0CCpiz6/ChujgVdJGIXkZySXBhVbFeO8FxbXT
         AF/fplDXFQOg6p8qwyuYb/F/MpHfupvLwTQ7Jm/9akNidWxxPYVOUYlzQCwYllAdvvRM
         o2TQeqiTfuBUezJ03fJdr5LMpGhJMN0XDrh1eWJINZzU5u9r7IVtdoB/yYX0tAWITCn7
         H0wCk1NCNfWKmJJKMWre87bv2Kj8zCzQanPfbsoeljqAYA7jp7LesRa3DhAFPP78EyZF
         6BEQ==
X-Gm-Message-State: AC+VfDyL+Qo9l5SO6YwQ+vRIwt7tWOCgyCIB5R2x9NnltN8uoFGJAfLq
        BasorUd6HHg5x9ichTZhup0tiw==
X-Google-Smtp-Source: ACHHUZ5uM9zl610LV4XAjDqfmDLSlTnZVSOBWel//9dO+3tsqS3iV2+xYaXLBEkKvemCf/D4pHz9oA==
X-Received: by 2002:a17:907:96a8:b0:94a:643e:9e26 with SMTP id hd40-20020a17090796a800b0094a643e9e26mr4931794ejc.14.1683199428887;
        Thu, 04 May 2023 04:23:48 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:cbf1:e7ef:fb81:e912? ([2a02:810d:15c0:828:cbf1:e7ef:fb81:e912])
        by smtp.gmail.com with ESMTPSA id s21-20020a170906779500b0094eef800850sm18623659ejm.204.2023.05.04.04.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 04:23:48 -0700 (PDT)
Message-ID: <f8fdf967-a37e-423a-c6a0-ca0a2cf56bc7@linaro.org>
Date:   Thu, 4 May 2023 13:23:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 13/18] arm64: defconfig: Enable Qualcomm pstore
 minidump client driver
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, corbet@lwn.net,
        keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
        catalin.marinas@arm.com, will@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        srinivas.kandagatla@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
References: <1683133352-10046-1-git-send-email-quic_mojha@quicinc.com>
 <1683133352-10046-14-git-send-email-quic_mojha@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1683133352-10046-14-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 03/05/2023 19:02, Mukesh Ojha wrote:
> As we have enabled qualcomm minidump driver, so lets enable one client
> driver which captures the already existing ramoops region like record,
> console, ftrace, pmsg through qualcomm minidump infrastructure.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Squash with other change.

> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 831c942..1ccae8b 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1251,6 +1251,7 @@ CONFIG_QCOM_WCNSS_CTRL=m
>  CONFIG_QCOM_APR=m
>  CONFIG_QCOM_ICC_BWMON=m
>  CONFIG_QCOM_MINIDUMP=y
> +CONFIG_QCOM_PSTORE_MINIDUMP=y

This must be a module.

Best regards,
Krzysztof

