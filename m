Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B79C61DA4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Feb 2023 08:22:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbjBNIW2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Feb 2023 03:22:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232005AbjBNIW0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Feb 2023 03:22:26 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DE21212A8
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Feb 2023 00:22:22 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso13064674wms.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Feb 2023 00:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7rZYNk/+SGPInJMtgZ1K6jQiSHv5cED0P/DIveONKHE=;
        b=b3lgCkM3PbWTCNRWh5Bf/k2/hpE7laCJLD5srPOBh4vskNvXGLVsydy5mjnSV0tRbj
         ADc8FA8wOnub6Yrcjx0c4AHDB733qO8LrYskiCsubK6PQMNw/LIQ1inzJc9vz4+Joyi9
         1n5ThnhS8Uq2VcGD7CUzAM3l8YRaXHLLpadILNk/isd6VHtv9k7no1eyByq9YZ0qUa6i
         0RrHYuz6s+vVsAIlR3mHvk+Nn6bOsB0a1fJpc5rSvrGDGUdSdv3xRdovk/i1W/506PSm
         KBrsfNogXSRyOxqnLyvEFr8WUf7vGTTsqdE0lvzjYStg7ETuv+s+G4xrrkF6zmKhVqNB
         GEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7rZYNk/+SGPInJMtgZ1K6jQiSHv5cED0P/DIveONKHE=;
        b=coxvqqEglgv96fzqnrmxhoR4WD9uEOpvPm/aQSrwZAXVPxAUK7zp3FV0jf5WycQAR+
         mRSxiEei/sxn/Fyp6HdydFfUnygSKQWU4Tnx61vCeC8UA8uwwdAkouEPsOtTHT51KV34
         cWg5yDSuVlHOiCIK8k+vYH1y9bm2XaBKTitxmY+FPM/kUrCQE8UW6w+ve/vyJCP1TIFt
         lIlyc+DkKS9tk44q2nJc45cfcpsuSrkjz1DUKYzFbRxfX2xplKjIx52XU0tYkKUcYo66
         jkbE+M2HHTFIksOuy8t+VVU6ti257AloQKoSGtFvPzUG0ar7rHp36W4+wjMChxI/dAqb
         lGBQ==
X-Gm-Message-State: AO0yUKUcndkNMvqICTHO7xR2pwKNMqZgRr3fgByuUTNSAayheCAHLWiv
        BRkeYpxeVAr+saJh9p4Q/A/0sQ==
X-Google-Smtp-Source: AK7set+Eb1ptTujhKIkoR8EnzxrayL+3WjJO5CiG0mbYdQv9ZVJ1BjiMvzwz6g06O0qsbAI5AEaHFA==
X-Received: by 2002:a05:600c:1652:b0:3dc:16d4:a99f with SMTP id o18-20020a05600c165200b003dc16d4a99fmr1205182wmn.8.1676362941215;
        Tue, 14 Feb 2023 00:22:21 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600c46ce00b003db12112fcfsm18040828wmo.4.2023.02.14.00.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 00:22:20 -0800 (PST)
Message-ID: <294ec301-2792-4bbd-4184-494dc62faf22@linaro.org>
Date:   Tue, 14 Feb 2023 09:22:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/9] dt-bindings: firmware: qcom,scm: Update
 QDU1000/QRU1000 compatible
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20230213185218.166520-1-quic_molvera@quicinc.com>
 <20230213185218.166520-2-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230213185218.166520-2-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 13/02/2023 19:52, Melody Olvera wrote:
> Update compatible for QDU1000 and QRU1000 to include the interconnect
> these devices have.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

