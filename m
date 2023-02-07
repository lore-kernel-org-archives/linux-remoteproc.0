Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B359C636CC
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Feb 2023 10:29:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231382AbjBGK3F (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 7 Feb 2023 05:29:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231390AbjBGK24 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Feb 2023 05:28:56 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455813018D
        for <linux-remoteproc@vger.kernel.org>; Tue,  7 Feb 2023 02:28:49 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id ee13so8215030edb.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Feb 2023 02:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NDeIvkfb5WALcEqUuHkmQB+FrXcaWUx/WRzdBLJGHWY=;
        b=A9yHJZWGvValsmqpGy2foiQ3afLgIag4DfGudheIUYqirOQOBjqqZXyoBSHzMUvFqr
         OsGTyMCgP73m1v3JeDRQwCQyHAzj1Dw3yEZl9ETW0oLZrcrf8e1CK8hHLMlvzW0gp/gZ
         OtfHvqJC3RnnO8s7YptRbDWaRMuCbqAOvMdT8ndQGM/0tXECDWbcSen44picYk7O0nDb
         9rmNxL7/c638UhFDN61/NOT7kvX7VArtdgNydU40CPEdmVKwEs4/KygEHVQecLl1IxWg
         wkboYKzfsok+EUKW1BNXfvtNDNnjOZC/bDnP+yMnRrbv8cJk/ku6TyhPoge60N5TUQh1
         wC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NDeIvkfb5WALcEqUuHkmQB+FrXcaWUx/WRzdBLJGHWY=;
        b=0ZORn1pxBhCNpxOFounq9AKQ8Mkx94WJovPB9p2+igw68+MpXqZP54m8lq1Pbh4bjK
         YLhIvAtEuZmXrEe7X2XynqSBhY0wptGpRmcUvJ0ALooQxxyg/IdOHYvOW7UgWh0NfXS9
         KZqmFsDMMO3bBVeaiuDMt7G2tswbk28UEN2YuDa8SZSNIqqu8dUPhwDIgq3WuSWDvAX9
         wEtWXSo2tXOLnOGVZ2nVfgppHr73QLFpEgcy3GUc2nZ4gH75ChilrCKZ32UMZQvVrMRD
         i6ky97+m1PJuprIaqTvpRNzoK7jOn8SErH3ajgGFrQI4qM0QBpjfwHa2oDnpge+B1e1d
         PDOQ==
X-Gm-Message-State: AO0yUKXwu9eND0MrNSfcwKqd4Yr5vBLzG0Fej5A8hvLI6YdwLwyMPZTn
        7DGdrlOx0PmcJTSnx/Cd9rTsyg==
X-Google-Smtp-Source: AK7set9kKCifCK42oeHDJs/5pvIjngkAC9YWRKoP4Mj8rpJzrxtAhs/9bIDPBdDtKFMQNrjNMliK9A==
X-Received: by 2002:a50:ccc6:0:b0:4aa:c4bb:2372 with SMTP id b6-20020a50ccc6000000b004aac4bb2372mr2743682edj.32.1675765727684;
        Tue, 07 Feb 2023 02:28:47 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o10-20020aa7dd4a000000b00499703df898sm6165573edw.69.2023.02.07.02.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 02:28:47 -0800 (PST)
Message-ID: <70334e80-9516-5925-441e-01120ad3577b@linaro.org>
Date:   Tue, 7 Feb 2023 12:28:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/5] arm64: dts: qcom: msm8996: align RPM G-Link
 clock-controller node with bindings
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230207090852.28421-1-krzysztof.kozlowski@linaro.org>
 <20230207090852.28421-3-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230207090852.28421-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 07/02/2023 11:08, Krzysztof Kozlowski wrote:
> qcom,rpmcc bindings expect RPM clock controller to be named generic
> "clock-controller":
> 
>    rpm-glink: rpm-requests: 'qcom,rpmcc' does not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

