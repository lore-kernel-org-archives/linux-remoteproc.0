Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64AD8C71153
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Sep 2023 06:42:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346895AbjIDGmQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Sep 2023 02:42:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjIDGmQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Sep 2023 02:42:16 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBC39E6
        for <linux-remoteproc@vger.kernel.org>; Sun,  3 Sep 2023 23:42:12 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99bf3f59905so164760766b.3
        for <linux-remoteproc@vger.kernel.org>; Sun, 03 Sep 2023 23:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693809731; x=1694414531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WsUFTRV1ADNgpiaiDpK0K2zFTKd9GNQ15ec+B+26Uro=;
        b=Epzx5qhoD+mLS6DVtih/3vjSV+3hVVBBk8sINctiybv5i4MoVtGP08O/oSj28YZy0K
         XjPox8XJw/rCDnZJEmzSMj7Ns5a0Hj3cnDHvnThGVpGC2heNX/d5XVuEoVtvlmLv2Ju2
         EhPu8hE9tYHK/RRfHdB9ykNc4/KpxdsqQ4TaX8SbX2K7HmLEPU149YWhDGEP24/rEpqZ
         i5Gzr3uImQjTCc2DizRtV/My2qAypolTJB4Ib4KHuMRudAhEs1QE+kqzpPbHuR6HbHLK
         xim4jrveSB/p/H5lYaaRQadIW0WVdVJe19XD/OPTbqMD36vYjSrrNo3Vpoc4li4n2ggJ
         rihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693809731; x=1694414531;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WsUFTRV1ADNgpiaiDpK0K2zFTKd9GNQ15ec+B+26Uro=;
        b=OMSAdQHOkubJX976MzEWgtRJ8tKckqgPAqbUyRtmUSGC6RMXNo7pVNsJ9Cv8+HiR2C
         4FoUK6pnF+KZUbTQ8ZJ6TpCaHV/JZxQjy/chBz5qdPMEtQrcKIdM2OXb0p4dX5C+piqi
         KxJ6CnC5cdEWu9B3rS+t+qgSpeSSuMqE8mfqzg0D/1KQP6SjNQSr381sXW/u4+Kzx8Ae
         gHEWzyTscbVWumMjgb2sYP+lviNGv6gYv+dnkWMZcxOc0VgZuZwpi9KO0JBcBvDoyzg7
         JzaJVZadtRSY4By2TwgxAqIcsv4oMQnnne7o6JiFnroKna0bqKuUJZLXlkSiNl25OLum
         AeUA==
X-Gm-Message-State: AOJu0YxQcEZ3lj1V7bgXAD9l/8cJFEnXuUSnU7RpJjv9TicvBs/ZN7zm
        fLZLIMJjTu3YswTHhJALq3lL+Q==
X-Google-Smtp-Source: AGHT+IEaaWV9yXteXlnlYPSNYvUs/ypy4LmdmMfoJFmEAbXSewCFzdCBruWPN9E1aZR9R1NNpMn8jQ==
X-Received: by 2002:a17:907:58d:b0:9a2:1b6d:eeca with SMTP id vw13-20020a170907058d00b009a21b6deecamr5919237ejb.44.1693809731374;
        Sun, 03 Sep 2023 23:42:11 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id y8-20020a170906914800b00992f2befcbcsm5706933ejw.180.2023.09.03.23.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Sep 2023 23:42:10 -0700 (PDT)
Message-ID: <17c8ba39-2bcf-5799-13ff-bb96249dbf61@linaro.org>
Date:   Mon, 4 Sep 2023 08:42:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/3] hwspinlock: qcom: Drop unused qcom,ipq6018-tcsr-mutex
Content-Language: en-US
To:     Vignesh Viswanathan <quic_viswanat@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ohad@wizery.com,
        baolin.wang@linux.alibaba.com, linux-remoteproc@vger.kernel.org
Cc:     quic_kathirav@quicinc.com, quic_anusha@quicinc.com,
        quic_sjaganat@quicinc.com, quic_srichara@quicinc.com,
        quic_varada@quicinc.com
References: <20230904055010.4118982-1-quic_viswanat@quicinc.com>
 <20230904055010.4118982-3-quic_viswanat@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230904055010.4118982-3-quic_viswanat@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 04/09/2023 07:50, Vignesh Viswanathan wrote:
> qcom,ipq6018-tcsr-mutex maps to incorrect config of IPQ6018 and is
> dropped from the devictree. 

No, it is not dropped.


> IPQ6018 will use qcom,tcsr-mutex compatible
> string.

No, it will not.

> 
> Drop qcom,ipq6018-tcsr-mutex compatible string from
> qcom_hwspinlock_of_match table.

Why? Do not write what you are doing here, but why you are doing it.


Best regards,
Krzysztof

