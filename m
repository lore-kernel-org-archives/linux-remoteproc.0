Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E577BC05027
	for <linux-remoteproc@archiver.kernel.org>; Mon,  6 Feb 2023 19:36:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbjBFTgV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 6 Feb 2023 14:36:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjBFTgU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 6 Feb 2023 14:36:20 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD68C222CE
        for <linux-remoteproc@vger.kernel.org>; Mon,  6 Feb 2023 11:36:18 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id j25so7906402wrc.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Feb 2023 11:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=30k6aVZ3lQKYjywAhccCPTJ4QlS09nql1ha1KpCSPYw=;
        b=EZKhQlH5xDkFw6fmkr87KlD6I7BbCxotrN6jXkMcE8O1Utp2KYnnW0bJzWVybhkDPP
         JWDaCbPxDbpD8ZJdRIr4e7DkYW5auRFAgrhzXKK5fijt2IR4sr8ohruJQ9kiU1NZj31R
         lhEeu7XdY0Rmy5WiuMRs8CccluklMjNmt1CCNIJJkn53g+nhUxXkmeoF4i61wigSYkqc
         YzaVJUHfP5LrsgiNwAODJCV4a+ioPFrv81ut1yatbf6a/68QoOgW2RDCJMG+tub5sm1H
         risKh4iHFWgOGSYwdsAHYe1Jeos0lSbckScB250K2KtFMu7QOGyKtBh9Bp0ct1iRY2NV
         4jyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=30k6aVZ3lQKYjywAhccCPTJ4QlS09nql1ha1KpCSPYw=;
        b=fYeg09D7CgKzvkbxyUIBOboRxCRhx/Of1YJ9gUy5MkE/oeS6gddlHiDtftVx7otSCR
         6cUuSgT5Kkb+B/aCT/xWHjLvnrHYfEqWJilPkK4r9aheTN+6hzoRreP6/OINSPIpTYLv
         YL0p5tWjDRY1oX2dRnZQVqBwc8CzvjQhrj5CU4jyxzuVTXBjgO79xg2TrTUpKqFhx83M
         r7cXlCIFaup+9K8vHjLZbJWmmTmzJNaD8OLFqrJTUgzFU2M9R8b8cv6Yz8naA61+ybgh
         GroNxhbvzZYuUuqHPRzSHhH++mClfyVNS9pBsvqgRy1a8NDzcVW8XSZOgdNZXi1C9Xeu
         ny3g==
X-Gm-Message-State: AO0yUKWwQKL88Q46wkuUnvXgLk9VX7s6UjHtew38yNNPzv04CpDd2j62
        /XQx10RBZ+tmBTiOuwkPsXCnVA==
X-Google-Smtp-Source: AK7set8qKZ60WpOLGW/+Mx9lLQ+xssiCnYs/DSVaoCLJD5TFXE2AQl4xs01TMJHZsHxHfITAaeNsRQ==
X-Received: by 2002:a5d:60c7:0:b0:2b5:47ab:6fa0 with SMTP id x7-20020a5d60c7000000b002b547ab6fa0mr25347wrt.38.1675712177204;
        Mon, 06 Feb 2023 11:36:17 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u17-20020adfdb91000000b002bdd96d88b4sm9667603wri.75.2023.02.06.11.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 11:36:16 -0800 (PST)
Message-ID: <8c819cc7-5071-376d-5c1e-c06555eed539@linaro.org>
Date:   Mon, 6 Feb 2023 20:36:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: correct power
 domains
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230206193313.30667-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206193313.30667-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 06/02/2023 20:33, Krzysztof Kozlowski wrote:
> Correct CDSP and MPSS power domains to match what is used in DTS and the
> Linux driver:
> 
>   sm8550-mtp.dtb: remoteproc@32300000: power-domain-names: ['cx', 'mxc', 'nsp'] is too long
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

And probably:

Fixes: 084258d60712 ("dt-bindings: remoteproc: qcom: adsp: document sm8550 adsp, cdsp & mpss compatible")

Best regards,
Krzysztof

