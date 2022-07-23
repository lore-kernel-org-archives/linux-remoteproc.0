Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E17C43334
	for <linux-remoteproc@archiver.kernel.org>; Sat, 23 Jul 2022 20:42:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237087AbiGWUl7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 23 Jul 2022 16:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230461AbiGWUl6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 23 Jul 2022 16:41:58 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3322B1B79B
        for <linux-remoteproc@vger.kernel.org>; Sat, 23 Jul 2022 13:41:57 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id j26so9034654lji.1
        for <linux-remoteproc@vger.kernel.org>; Sat, 23 Jul 2022 13:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=e+52KOSnNLi1FnR7UcmyU23RLE7OF4gwD0vDM9TqnXE=;
        b=lt838N1vQInPt6XzODyLpcijt1IMK7TP5auI3pOUummc98aV/T69Tev/nxr7yQGXI7
         ZvZnaiilpHn3xoS27QFeFVAWt2yY225tsP5xo9CAeuHVqE5dwa8Rx0zQOrsegjj2RMcA
         W9nBPMITGALRMK4gyB1xUQqF0QZZJZU29p8mCXFpQlVfRpDEf1FGivFoiXsi3sqS+xNm
         i4sRl9/0Dlhp+gM83g3Sk9KPGo1TTN8cIDhJcw6xEDaqKM3EKWh6GG08UBTMsR14oCY+
         ELhd/Ueb4vzk19C9fg16/tVW6g0MZvAU+ROmM5MeWJ0KurC0gDtXImP6D5SJgN/FPtjB
         806g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=e+52KOSnNLi1FnR7UcmyU23RLE7OF4gwD0vDM9TqnXE=;
        b=ktzsbqOaEpEDATf7ecXRwz6IrBzyaOaHD9xw/RPvPwUiE1PcRzXY7Zrgn3HINeFCLR
         EHlrwWPi1yLPnkm2VcaFprrxDYZvY103QrSkXUYVmxwyqAtfagqfQLbgIQAj5gn3r2l1
         AuAW3xdRsCCScvcp9KpIhgh7WKaVbJmjE/qePlQPKgs1xabQgewwWEMJNtO8Wg31/QpN
         fZNDRHEabbg/7KPSuc10W/+jTJNtucgbHxAe+Vcn4bCizSWXaiCjKSaSiRn+PsVUEk2Z
         QVYuPhsTJbr2At7uK/F4BIMDqKZ3RhrII2Gad/I9VPvveZbnc6/ZeL4VtMdQ8lB7hpnJ
         lOyA==
X-Gm-Message-State: AJIora9TwvVDu/+SJgUJgE8Edfesd0f18//UxYAa4Fi4MpnVLYMF0T8r
        apfmtmmzwxy+cbEdQHNAACNvkw==
X-Google-Smtp-Source: AGRyM1vvcEOP9CXilnAMzwZwb7YML7xsZQfVNpAqOzCtDCbNdi5tZQInlhj6NLu2AYDSVN0VZUx6xw==
X-Received: by 2002:a05:651c:981:b0:253:b87e:ba6c with SMTP id b1-20020a05651c098100b00253b87eba6cmr1927223ljq.530.1658608915336;
        Sat, 23 Jul 2022 13:41:55 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id t9-20020a19ad09000000b0048905c6103csm1819433lfc.9.2022.07.23.13.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Jul 2022 13:41:54 -0700 (PDT)
Message-ID: <27b0d451-4cef-cfc3-c6ae-3bb6cb448083@linaro.org>
Date:   Sat, 23 Jul 2022 22:41:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/5] dt-bindings: remoteproc: qcom,q6v5: Move MSM8916
 to schema
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Rob Herring <robh@kernel.org>
Cc:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
References: <20220718140344.1831731-1-stephan.gerhold@kernkonzept.com>
 <20220718140344.1831731-3-stephan.gerhold@kernkonzept.com>
 <20220720224608.GA4107504-robh@kernel.org> <Ytmw41giZ/4S+Pp0@gerhold.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Ytmw41giZ/4S+Pp0@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 21/07/2022 22:02, Stephan Gerhold wrote:
> What remains is maybe:
> 
>   - "qcom,smem-states", which is already used in several other schemas
>     and could be possibly defined together with #qcom,smem-state-cells
>     in some generic schema(?)
> 
>   - "qcom,halt-regs", "firmware-name", "smd-edge" are used by different
>     Qualcomm remoteproc drivers, so they could possibly be defined in
>     some common "qcom-remoteproc.yaml" schema(?)

smd-edge and glink is already in remoteproc/qcom,smd-edge.yaml
qcom,glink-edge.yaml


Best regards,
Krzysztof
