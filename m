Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1739CC636D4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 15 Feb 2023 19:09:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbjBOTJR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 15 Feb 2023 14:09:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbjBOTJQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 15 Feb 2023 14:09:16 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D65A63BD89
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Feb 2023 11:09:14 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id z13so14094851wmp.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Feb 2023 11:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8+RZTmWd7u5WQWkzFMPa+KxElUM1QLR/4kOd49BVhns=;
        b=DzrftypQWqJ2I+cM5brMYDser82T47lkagxcYKjVPWCk0LihiDvTBh+Ar7MK2rYnA5
         LHhWe1zpICsnmKJaxuDDnIiANxsn+RGaTL9N86IL6gmmYL6LYe/PlT+XsuxxGCHau3e2
         jSCrrGv/gUqNBMpdSZ/8haX4ib5iPRDima3Ue7lXfEE/5QL9tz3YdsCDBxsGRVN/Ctrj
         UOn5ex6fIyPBy7jXhRrSMRYRulHOhKk6saiMVLrNxuVL9YobbA+jdC3CJsm8cCaJvJMB
         8zAEX7E0nxz56vnsRpZsSSA87NXq1oVVGJwQYJKf4flB+Ptdnvcx1ghuK6nzVKBKhQBL
         1qKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8+RZTmWd7u5WQWkzFMPa+KxElUM1QLR/4kOd49BVhns=;
        b=6ojutp6dr3Tl0G1vIty59UYLl3oSLcFFgjGbTMkbOI+c9Am9HnqyvaVeleNm3aE7nD
         5nj0QyVkutykqaUZ0vOBX/aD8TSQy+oEuMvJBYgkviEqT94ElewCuYgOWKUVY0YoEfyU
         eOwNwY04HUcX9PFAq58xLeM1DGe53XulLK+3FC9dxnweiS9PfYWcOq2wl6hqI3toB3Pq
         XLQVAzOh0NCfXRKBLVVQKVfOpH0+jROoEe+YEGg/7peP4StF1UvzUzLlb3T2F91LnYeY
         3Sq1aDkIgjl5swXbdcoul2JVttZ470UHEdL2Byxl7MawM6nC7elx1RjMK7UcRH3DA4ma
         xC4A==
X-Gm-Message-State: AO0yUKU5Ts6pqDECJ2Z2v1zGvc8xwXOqICuFnB/cEGxIKExK2/4MOlrf
        6hsvAZJPMlYK9ylR4vhL9i2QLw==
X-Google-Smtp-Source: AK7set8WrxhjECCiJgFeFpXFwJhkNfXLtyqWxPp7ZXxzdG2j+FL4rPxH4J8jcXdyPzCVUYsxIZTSBQ==
X-Received: by 2002:a05:600c:4747:b0:3dc:4042:5c21 with SMTP id w7-20020a05600c474700b003dc40425c21mr2909301wmo.6.1676488153377;
        Wed, 15 Feb 2023 11:09:13 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s9-20020a05600c45c900b003e00c9888besm3286963wmo.30.2023.02.15.11.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 11:09:12 -0800 (PST)
Message-ID: <af2ee77b-a16d-d8f0-a5d5-814e1882f7db@linaro.org>
Date:   Wed, 15 Feb 2023 20:09:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: (subset) [PATCH v2 1/7] arm64: dts: qcom: ipq6018: align RPM
 G-Link node with bindings
Content-Language: en-US
To:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Banajit Goswami <bgoswami@quicinc.com>,
        Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
 <167639581474.996065.4144950480631659648.b4-ty@kernel.org>
 <CAL_JsqLpsiermwLON5B8Z99XQMAaK36Nv_GKLvRFQQokEwKY0w@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAL_JsqLpsiermwLON5B8Z99XQMAaK36Nv_GKLvRFQQokEwKY0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 15/02/2023 15:10, Rob Herring wrote:
> On Tue, Feb 14, 2023 at 11:28 AM Bjorn Andersson <andersson@kernel.org> wrote:
>>
>> On Wed, 8 Feb 2023 11:15:39 +0100, Krzysztof Kozlowski wrote:
>>> Bindings expect (and most of DTS use) the RPM G-Link node name to be
>>> "rpm-requests".
>>>
>>>
>>
>> Applied, thanks!
>>
>> [6/7] dt-bindings: remoteproc: qcom,glink-rpm-edge: convert to DT schema
>>       commit: fdafdddf7b2f5cab8d233ef97f1fad8ec7d2e7a0
>> [7/7] dt-bindings: remoteproc: qcom,glink-edge: correct label description
>>       commit: 6f9c2f19a8743c880903a031c7f3f3c534d4b813
> 
> You need to apply patch 4 too. There's a warning in linux-next now without it.

Bjorn, can you grab patch 4 as well?

Best regards,
Krzysztof

