Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEEF5C433F5
	for <linux-remoteproc@archiver.kernel.org>; Sat,  9 Apr 2022 16:42:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233791AbiDIQoo (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 9 Apr 2022 12:44:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbiDIQon (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 9 Apr 2022 12:44:43 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 864A01DD3FC
        for <linux-remoteproc@vger.kernel.org>; Sat,  9 Apr 2022 09:42:35 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id z12so765735edl.2
        for <linux-remoteproc@vger.kernel.org>; Sat, 09 Apr 2022 09:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=XsH2pFq43CvFY73l+/GgB2uoztvGWddzgwUrA1kSrVw=;
        b=IRwgvKag9QSbIOlqy4VlWGOSiEVKZ+SqpZ1LeSzMCgjcu2ht5lp5ZLxW0SyCEFkPTe
         /oFoZ4TvrFr21eQpjo8aMrifvopWnj3qV1TsMO+XZqwDxMy4WLkFCYESoy/+btGXsrJS
         sfcLNB2KTWyTmpUbf8qD1pPAhK3Mlzj6AHSQvVCjw58KcrSfJz/aeu3gans4CoCizpNq
         SkWeXmhvoSDhzESqg4uSyyut/zoEDVUoFY5i4AWxsKfrcgxebcqT3eJShfz9ttis3ORW
         j7QCALpZkNakrQk6RWXaH8aofm97FtHAkihA1J2BLZfTvlCmeirPGUpw+VRpP7EZ+9b6
         aSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XsH2pFq43CvFY73l+/GgB2uoztvGWddzgwUrA1kSrVw=;
        b=llUlCcc88RKWpfsynQyyloKgUJg24wlquksoEIEh8TuY+AnUw2P84fc5Ij6HDa1uS3
         eovl45EU+pdigNia8HeGueqfBmS1YLsMbIe2I/HYbOe9tQAjixrJIi+V2uV463Zf2wKm
         tDBhgf+Jdqa5T5Hon3e2KhEmj4ubfrj+IL8GzPkOrcTnfRCRMYOKFrYHJnoPGkQMdU8q
         urukKJys+X1poDhYugdHl0ln801HroZF9XpSYYc6VaGoXTw91JYvMdbK8zkSA5vcVpjH
         PyZQDUjUIljfLSE5v9D1PaizT3rEUpAFs4yzxKocndVb1fp9AqTj36BPfC+adDTJ95sY
         96nw==
X-Gm-Message-State: AOAM531Z388tFVjSKiP9mIHPgqY5zlePFtLKARI8cdBQ6avjbqz5Hlav
        L4E5KjlPzkvsDDsptWh6TunF7A==
X-Google-Smtp-Source: ABdhPJz6aFkro9j5CioPZ/nYrDF9DGmaP1OpV4lKes4BKxuMXJC1nz8mDFZ5vktRzzk86gIaAKS+iQ==
X-Received: by 2002:a05:6402:492:b0:404:c4bf:8b7e with SMTP id k18-20020a056402049200b00404c4bf8b7emr24307832edv.318.1649522554196;
        Sat, 09 Apr 2022 09:42:34 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id v8-20020a50d848000000b0041cb912717asm9980305edj.91.2022.04.09.09.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 09:42:33 -0700 (PDT)
Message-ID: <de5e1f33-6e32-938d-953e-e54b217859ea@linaro.org>
Date:   Sat, 9 Apr 2022 18:42:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom: pas: Add sc8280xp adsp
 and nsp pair
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220408220539.625301-1-bjorn.andersson@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220408220539.625301-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 09/04/2022 00:05, Bjorn Andersson wrote:
> Add the Qualcomm sc8280xp ADSP and NSP pairs to the binding.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../bindings/remoteproc/qcom,adsp.yaml        | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
