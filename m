Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423E6C433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Jun 2022 12:31:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243708AbiFGMbW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 7 Jun 2022 08:31:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243722AbiFGMbU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Jun 2022 08:31:20 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FAB0C4E97
        for <linux-remoteproc@vger.kernel.org>; Tue,  7 Jun 2022 05:31:19 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id q1so34894258ejz.9
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jun 2022 05:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0bVBZIpTbV1NVEDZVAeiBc+vcx1NnNChCpdEL4H7wUg=;
        b=fEsNEyiVyn4LQ4vSljRmJJFYlOirmhQAdjjRVQ5sjPc2lZDUwqXiEZSkjZeXl7O8D0
         2rPoTTajTVEaV5zR3AKyzJpZJtBX/O/cScXf0hDJvIbYd5Hzpt3R+xG6SuDavZN4r5Vd
         MM/l79Yr1wWODXoyP5K0dUcxjRh2/CA3TJtJQ7Hh/AT+YWGWx0/DF57NdpMeVdIzngz4
         rAU4i2tmrZf6z/+eypOS0wKWko1BJ5LHXP9gzI49GWcYduRfwMY2c0Zz4rZVgjxhUBl8
         MOEzf4xkxvPEKMt6/naZlPLhXM8YdTk9dbH2ihTyFPw1O1MBsTmkCMRIm+tUiNDIAgTI
         vMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0bVBZIpTbV1NVEDZVAeiBc+vcx1NnNChCpdEL4H7wUg=;
        b=pGwYk3t6FMuUyjbmJiZ2CqxwEVewZUpX7PbwnN5CALIzHdYiu7aNKMckkdg+lqGLpp
         f9rdmJIU6jXpcY93VRJxTTz8JQ6Gu72ZxafPO1TOoUeNgOz9jswr3yrUq6yDQUWfQ6zd
         3qwVWSKgMyCOB5sqn3gdAJ+VH6uC9YFNSOnnO+R0u8V6dNIv6DZDTlnCtzRwpcmjFFE7
         Q4M6f4Y9QFE79mG1qoTvZQKkkjQYY9kUQT6GenswoafKCGengxOlHxjGC4V6w0D2YAG9
         NHZJ30G+HwAC63QOHGiOdPUWtRbpjt04vwdWN3eofQnc26iqCYY7gvJVUPYnEcYydgFT
         IXhw==
X-Gm-Message-State: AOAM532BLZZ9LaUC40+ISKi8UQmR0KdhZbtxuEr89z2rLamjZuC2c2bi
        onOyErnBKL5/qZwG4yjM4Ji5HQ==
X-Google-Smtp-Source: ABdhPJyJTPqtj65zaAKLcpzOo+Oyji+7r+MmVERsSyki9/O0672e5B8VTsFaRPkDbVji7Ok6efqskA==
X-Received: by 2002:a17:907:3f04:b0:6e8:4b0e:438d with SMTP id hq4-20020a1709073f0400b006e84b0e438dmr26317862ejc.391.1654605077853;
        Tue, 07 Jun 2022 05:31:17 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q6-20020a1709060f8600b00711edab7622sm24387ejj.40.2022.06.07.05.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 05:31:17 -0700 (PDT)
Message-ID: <cf79be5d-deb8-09f6-0f17-3c3639e670e5@linaro.org>
Date:   Tue, 7 Jun 2022 14:31:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom: q6v5: fix example
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220606132324.1497349-1-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220606132324.1497349-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 06/06/2022 15:23, Luca Weiss wrote:
> Use the node in the examples that is present in msm8974.dtsi, which uses
> proper flags for the interrupts and add required 'xo' clock among
> others.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
