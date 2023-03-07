Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C04C6FD1B
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Mar 2023 15:21:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbjCGPVc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 7 Mar 2023 10:21:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231171AbjCGPVK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Mar 2023 10:21:10 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B78D11BB
        for <linux-remoteproc@vger.kernel.org>; Tue,  7 Mar 2023 07:18:47 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id k10so29745221edk.13
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Mar 2023 07:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678202316;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bwl4tCXVwjpJh7IhcTJKMi7gkXOGrvpoou3pIHWnxxM=;
        b=u4y2ycachlHPFB/neVV7xdZG1TNs4w0W6CUPYi/mJ61GcBiSCyCyxeckpOEFcXGJoV
         6Q+9x82W4fYzaIVTj588a4TfJVz50lIYVzKJadiNp6lvBlv7H7Kj2YnHSgH15oV5wj00
         lo6u/H97zvfhVqKmUWi1SZ0iRzSEses9vD+gobXRfBUMJBVEc3fda8YyQs5bc+UCwI/A
         CLwV0sbNMptzUkOcBBu/YYcNMRX0fyosfRNstR2BNiNP+kB5PVJsRv05yXJkm0hUYUq9
         B7s6Pi4aLp4v4oywhpwQuc/fc0Y048bJj7SJJvPqosdkeOR0ZaqnXgP1sIpOY8BFv0sc
         mTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678202316;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bwl4tCXVwjpJh7IhcTJKMi7gkXOGrvpoou3pIHWnxxM=;
        b=FwhIXUXIkZcvIBJRJ6R7kXkDnF6qlh1Sq7q+81c4tM97z6rk8ncMB8rszWCqdMwBop
         MaEpGhhR53e/aq868kPqVwGat8SAYEHpe4gpp31XL0xkHQunpwOi+3z8U/5H4wBLhuHs
         07R5K02s8YUHAzmggXrz8FmriF9HcaQIclG63ojIqi307gKPhE0eHYAomBqYRvadecQS
         xYpWQucWqTTJfUtSEX7+pR0OHK6sDJkbdB4g2EHm3NZ6hCY7pREZfvQWiUCAWaS9HEXR
         p5IJ3eLwfz76Cu9HxLaVZbT5RiUW9QX9Cq0ufwNBOEHa1UPfE7gWPU5QIhI084E+a6bF
         vqtA==
X-Gm-Message-State: AO0yUKU0+736xt7KQiMlG2HTd2k+iPoBBfMZFj06lVv8b1mMOsprqhmf
        eqnODJnk3e9+vyBd5eI1Wz6HUQ==
X-Google-Smtp-Source: AK7set/OTiyBx5HQzigvX9pyuSerEVTOaJqZrHtQx4SxfYIW/eKaiPNd7K+ki4jEhrErvL0QOFGhfw==
X-Received: by 2002:aa7:c983:0:b0:4aa:a0ed:e373 with SMTP id c3-20020aa7c983000000b004aaa0ede373mr9891525edt.7.1678202316731;
        Tue, 07 Mar 2023 07:18:36 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:a60f:e604:c252:1f3d? ([2a02:810d:15c0:828:a60f:e604:c252:1f3d])
        by smtp.gmail.com with ESMTPSA id n13-20020a170906164d00b008deba75e89csm6252637ejd.66.2023.03.07.07.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 07:18:36 -0800 (PST)
Message-ID: <ef0f48ac-f258-e7b5-405d-5def6c63c1c2@linaro.org>
Date:   Tue, 7 Mar 2023 16:18:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 03/11] dt-bindings: scm: Add compatible for IPQ5018
Content-Language: en-US
To:     Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jassisinghbrar@gmail.com, mathieu.poirier@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_gurus@quicinc.com,
        loic.poulain@linaro.org, quic_eberman@quicinc.com,
        robimarko@gmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <1678164097-13247-1-git-send-email-quic_mmanikan@quicinc.com>
 <1678164097-13247-4-git-send-email-quic_mmanikan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1678164097-13247-4-git-send-email-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 07/03/2023 05:41, Manikanta Mylavarapu wrote:
> Add the scm compatible string for IPQ5018 SoC
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

