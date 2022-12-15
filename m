Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6FD8C4332F
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Dec 2022 07:26:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbiLOH0D (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 15 Dec 2022 02:26:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiLOH0B (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Dec 2022 02:26:01 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFE0020345
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Dec 2022 23:25:58 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id w15so2089798wrl.9
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Dec 2022 23:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mm2wMOJBU0KY5CK4G5XuPJWnbMPqw3bzwZnGj//J0bc=;
        b=IJ027xJjO2+v9bEloG9slnX6gLRHg9t1MMvGfOevcGjukcWsGVH+SAPCaW5j18HGrf
         mSgKQ8uYEIFewcYpKNLqjLRCJmDZ7Hf08tzaGsZCcYE3ktur3K1fNrOy4+PcNT2SAhRr
         gxG5rA8umj7lHwqtDJIGp4Moa0b7Re2Z1+NGxDwQJJEn1DD7aj0XbCGfzk0ChWBYoAwE
         jmpbTzF1TSUCKxVBlI90TX59HuE+t4WHUMgtFRg0V1tWTFMHs5sqE6azh0haI7p2DGCb
         2uDakyUpVab9ClcmoHWANWAkdm8bHEQ1NARrvXHcu1d6HqcYaaBsYGqWEuKDVz7BEWXd
         7YGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mm2wMOJBU0KY5CK4G5XuPJWnbMPqw3bzwZnGj//J0bc=;
        b=N3AoxwBmtGzXB3GhV7q86oc6cSLzlr38w8Xc8GRO1YGL3uEXC3QZRRQ//ORQ2M6Z1O
         Q9UPkLu41yCXS9SbwxRFjHRc3Cfbhghhx1WFQDelzTMIQ8slIpEfMTMFG+rJS+Fdvuhp
         Byd5NAsQUj2TTzbpG7ct7IX+iIUJE9umca5oqnLhTQf4qqtJORCtTaNxx+S8xHVPkrpi
         L/yf41lvFOcQwdUuRmDie4ZKn0LKYIr/61u/dbANw2z5OIzIH53QLhYjsJMimQPzwdTj
         qyJyu6WGlNorotWlB0Fo+XqvgCLSISp9iJE2RSzEyMSyKMz+90tp02xnF9BIrsfCnsvI
         zzSw==
X-Gm-Message-State: ANoB5pknKZSIbt4xtVX20CSxNQ+/PL95tTX0riRFfmz7LWu265yLVHHs
        87KcXQzWrDjE8C4UyZA6WacNNQ==
X-Google-Smtp-Source: AA0mqf6FUW6cVCTyvzhNaccE170mxSEmlyha2ZZvhJLzGO2eAwd7HoAqxqtaPydtZy7SLmvbY+rnjg==
X-Received: by 2002:a5d:5187:0:b0:242:9e8:84b6 with SMTP id k7-20020a5d5187000000b0024209e884b6mr16499660wrv.13.1671089157351;
        Wed, 14 Dec 2022 23:25:57 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id n9-20020a5d67c9000000b00228dbf15072sm5082277wrw.62.2022.12.14.23.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 23:25:56 -0800 (PST)
Message-ID: <ac2d90e2-6fc3-98dc-8c73-936132b6c8d5@linaro.org>
Date:   Thu, 15 Dec 2022 08:25:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 2/2] docs: remoteproc: Update section header name
 requirement
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
References: <1670924929-26507-1-git-send-email-quic_srivasam@quicinc.com>
 <1670924929-26507-3-git-send-email-quic_srivasam@quicinc.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <1670924929-26507-3-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 13/12/22 10:48, Srinivasa Rao Mandadapu wrote:
> Add section header name requirement specification in elf segments.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
>   Documentation/staging/remoteproc.rst | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/staging/remoteproc.rst b/Documentation/staging/remoteproc.rst
> index 348ee7e..3125030 100644
> --- a/Documentation/staging/remoteproc.rst
> +++ b/Documentation/staging/remoteproc.rst
> @@ -245,6 +245,8 @@ if the remote processor is accessing memory directly).
>   
>   In addition to the standard ELF segments, most remote processors would
>   also include a special section which we call "the resource table".
> +This resource table section name may have anything appended after it,
> +but it must start with ".resource_table"

What do you think of:

    In addition to the standard ELF segments, most remote processors would
    also include a special section which we call the "resource table".
    A "resource table" section name must start with the ".resource_table"
    prefix, optionally having a more descriptive string appended. For
    example, ".resource_table.my_rproc" is a valid section name.

Regards,

Phil.
