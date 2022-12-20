Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2260C3DA6E
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Dec 2022 11:44:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbiLTLoM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Dec 2022 06:44:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbiLTLoL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Dec 2022 06:44:11 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E98B910FD1
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Dec 2022 03:44:09 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id ay40so8495983wmb.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Dec 2022 03:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zhyhy5U0fOnDFurDHyG5ClSYRlLksNWsMqWm7b8MUoI=;
        b=y4i1t1+3lrpGf2ojZOl90bsqbiDCt4XcRV/jAqTetQo6SwuLHT3iERSr/LwJZH4Qm1
         6/xqztMqV2SvKeLhmqR3BSa8numRurhmXG7s1fgOdR7QVIu0iOFm8YVQwrsbWubMSZh/
         XwYGgMlHur03s0ijdRAh5gcgscCXWpivkQ1c/XI2f0ziIR1TIcYHdwhLpHB3UI3yZzX3
         BVjSSnTZ6d/g8fJdZ83CEWwR/KM2hZLN9Y60ZjHyie+uwgGZWTrb03GwCNj712/O3ICB
         1LTQSdae7i+hzUOx9Mvg034/DL06tzzudkLY4Pvzj4kO0dw/CHqKUqSDaUYrbVTsmigK
         MVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zhyhy5U0fOnDFurDHyG5ClSYRlLksNWsMqWm7b8MUoI=;
        b=Ztw02CIINW4yHZMNXTfuYrRz57+ygPIzYkYc188MDG/YPK7EHXxZusS32tmFNza1sN
         +fFMS9uEeCYydKKPZLsFO38Qolk6WRLKDPz+hrJweNyoJd9Ymv8TW8jyRXFcjQjELvco
         HDwIHbfRADpcUUWMolp6zlZNxpH2G8I9PkdkSnvUMWG4Bd1M1F/TMoxIpSlpxzI/t4td
         12obIa1yVenLZPCUnOghmY70ZfDKpkY265GAiorzGGBgWtVWVGHDghNCZB7vEH+NgkzH
         jNAD8dy844Xk0Gu8lbcyL1hQYbd1HxGmig1ib/kHr6QY4p1hOUc9UvVOz65gBMjVTrSW
         PRNA==
X-Gm-Message-State: AFqh2kod5KOzz2pPWnjnR+YL1d+Rbq7iqsudjR5MLtb62v/sdgWlJaq6
        OF80ZpyIQnPzEsJ0lo+s2/iXag==
X-Google-Smtp-Source: AMrXdXsyJj1fe5HYqdX7+Kvu2ToSIFB48vX1Q9tXAfmgtY97DdGX4ImB5cDXiydgK4nsjE95BixjvA==
X-Received: by 2002:a05:600c:5493:b0:3d3:5709:68e8 with SMTP id iv19-20020a05600c549300b003d3570968e8mr5694385wmb.36.1671536648565;
        Tue, 20 Dec 2022 03:44:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id u4-20020a5d4344000000b00242710c9910sm12488291wrr.8.2022.12.20.03.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 03:44:07 -0800 (PST)
Message-ID: <58a86c74-49aa-05e7-36ca-99995b5efed6@linaro.org>
Date:   Tue, 20 Dec 2022 12:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v3 0/2] Update section header name check
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        linux-remoteproc@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org, devicetree@vger.kernel.org,
        krzysztof.kozlowski@linaro.org, mathieu.poirier@linaro.org,
        corbet@lwn.net
References: <1671523269-21154-1-git-send-email-quic_srivasam@quicinc.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <1671523269-21154-1-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 20/12/22 09:01, Srinivasa Rao Mandadapu wrote:

> Srinivasa Rao Mandadapu (2):
>    remoteproc: elf_loader: Update resource table name check
>    docs: remoteproc: Update section header name requirement

Series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

