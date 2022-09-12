Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117CAC6FA83
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Sep 2022 10:47:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbiILKrT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 12 Sep 2022 06:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbiILKrR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 12 Sep 2022 06:47:17 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC96131EEB
        for <linux-remoteproc@vger.kernel.org>; Mon, 12 Sep 2022 03:47:15 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id f14so13179504lfg.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 12 Sep 2022 03:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=bS7LDsVs3qcnyEA5WCUeLMEdHfGdR6OQ6NC7pdWEKCo=;
        b=v9C7GeUH/ntRNwKKZ1I7TT6BQcjJBRkVZ1XpH6mXDdIGqsu2oqlY8NR6ikeS2VHyL8
         7XoeJToQeSx7WIMqvu9S5zhL+/zdPWkCJ/xRvKy5UYL5moSuGoTzW/rT+uXwRSG6Eiic
         vRv3Oy4PyY5Y4nPRruZEaZcvpvxM6lCfMQ0gzcT4tFsasIVkJa+3D6W6V8K+hfLskejA
         LNX5aQQbJSTAfgk7Upg8DIPsy+QVWFepdmlC4bDE/vck/eapbQzWJPan/jIBh9yCxMTn
         xdGGkKSLDDM4Cf8yXZKpajXEJTCiwphjC+CcMOkntC3mGhoodSx7fPj7QXXQPJ79Il6x
         BM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=bS7LDsVs3qcnyEA5WCUeLMEdHfGdR6OQ6NC7pdWEKCo=;
        b=ELSfksZNqzwDk0zMFzQ+5K298vJnwf14Nnf9DiJH3gvvnua6ylR9RlGKUkD/KhBbHr
         dSfPbIyiRsnxu3HwCqiEQYaR1CArmZGQG0NnbyJhGTrcqKRw/AlOvsuVdWAkMzChWvoF
         TIqwlKPxHuJ1JTvoKb2sL47a4nTYKiDxtmVTVw+SzGm2X8isV5snCUHE3SagPLk3EeCH
         716xjT2OCV6Uq7BLZgokQ8Vg7BW8Emqr11VMH23o+c3Rx3neYplCjuZDBw2/Wy6pMRMt
         qFVGj4VVbG7VyeRrkbf5Puz2z8caH4IwxQNY4TyrcabbYJbEjypBxjb3qVhtq4+isWQa
         SeKA==
X-Gm-Message-State: ACgBeo10RM8xnxjsdx7pUqaNi3DLiLv0ODTr5gUqJfbS3kuF8h7qFQwm
        ht2AYKlSTB6cuZ+vcmj47pCA1w==
X-Google-Smtp-Source: AA6agR5+jaTiqHAiQpzt1KGZYW6NOWDU4UIg3cF3n4GCh9g7ACcWMJRrb7wrqPm8IlRGzsNs5ZLcOA==
X-Received: by 2002:a05:6512:3f8c:b0:492:b392:bb84 with SMTP id x12-20020a0565123f8c00b00492b392bb84mr8267929lfa.368.1662979633605;
        Mon, 12 Sep 2022 03:47:13 -0700 (PDT)
Received: from [10.129.96.84] ([109.232.243.34])
        by smtp.gmail.com with ESMTPSA id p8-20020a2eb7c8000000b0026c111ac7bcsm188263ljo.86.2022.09.12.03.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 03:47:13 -0700 (PDT)
Message-ID: <79c11b6a-8f34-a5ee-373d-f88d5a980039@linaro.org>
Date:   Mon, 12 Sep 2022 12:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/4] dt-bindings: remoteproc: qcom: wcnss: Add
 qcom,pronto compatible
Content-Language: en-US
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     bjorn.andersson@linaro.org, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20220908184925.2714098-1-sireeshkodali1@gmail.com>
 <20220908184925.2714098-4-sireeshkodali1@gmail.com>
 <ad201ee7-d83c-9ebc-3619-64632f1f266e@linaro.org>
 <CMU3V4NK164X.1D3TDJPALGIDD@skynet-linux>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CMU3V4NK164X.1D3TDJPALGIDD@skynet-linux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 12/09/2022 05:33, Sireesh Kodali wrote:
> On Fri Sep 9, 2022 at 1:30 PM IST, Krzysztof Kozlowski wrote:
>> On 08/09/2022 20:49, Sireesh Kodali wrote:
>>> The qcom,pronto compatible is used in the wcn36xx driver to determine
>>> which register to access. However, this compatible was not documented.
>>> This patch documents the existing compatible as is, since it isn't
>>> immediately clear why the wcn36xx driver uses this extra compatible,
>>> rather than relying directly on the regular compatible string.
>>
>> The patch does much more - messes entirely all compatibles...
> 
> Is there another preferred way to handle this?

The one which does not introduces any other changes than what you wrote
here. You wrote here, that qcom,pronto is being added, so why some
things are changed to oneOf or to enums?

Best regards,
Krzysztof
