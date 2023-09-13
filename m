Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59EBBCA5501
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Sep 2023 07:18:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238562AbjIMHSG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 13 Sep 2023 03:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238557AbjIMHSF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 Sep 2023 03:18:05 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 740F7198C
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Sep 2023 00:18:01 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-52a1ce529fdso8540425a12.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Sep 2023 00:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694589480; x=1695194280; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5E2GWmaKgMk9eaNY11kumMiKx9QbIcNvdM4XUjWrJ44=;
        b=dtbcUaxcxcGEyOr/O1cRE+JinMzko/z31d/4lugS7cNJoHXNu1JnA4Z4WhoE56DV1v
         U4KD4KBc6boQbqzcEIKP9ZVlj5MKIH1emk7m16Wk5ZiN96CPeurfCmutbPwCYVb/K22M
         weK44nqVo+9pyRdsrD38VMW886f8Uw8HzkFqA6ZdXwtZXrY0ZM1hNrTbEd11cPnzmj8O
         8Et0yRjIbG1AuJauWWsBrNOdb7L/tJuKE9/e2QEMwubT5VUXLPzdnmXNECwWFbyfNhpI
         /3jw5U87GVHlt1X0jjSgl0dk1T9GWC8Sq6lpxYeP7xWt3220jU8yD1MMxNfsUgarK6XO
         FzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694589480; x=1695194280;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5E2GWmaKgMk9eaNY11kumMiKx9QbIcNvdM4XUjWrJ44=;
        b=N7Aimhc2ef686EcjMWTkIruM5hytsjf2dREqDtZ+/9ap2WK8n7WjfohwGA2Caxts/S
         bd7HjCxpsjMCDTvpEdxDVTIBfKYFiiqxHW5CSIeHowkEMxKiBgw7mVVgMSZ3NtsfsilC
         nmr5ieNFpiPDtNOpKdB0NnIpo9+nCpjfBBIy5EShknneqoTdEPi7wOU8MV0N6g+Ip0wg
         +Ku70Wzq0ATrn0YXZTfAO1IznMp3w6gvMklcwVr4eTQ+TmUVoRjvETH9xv0Lu6oiDtB9
         y3ZanX2kHCAUuJYmorBITa3ru/XDUMzruWZ3/AQD61uiy2qG5cGdyWhn0QUneYBfpPLx
         BfJw==
X-Gm-Message-State: AOJu0YwIips/wM/qbAYZRusCNKibCf3Ud/lhRtp2Zcd831VdgQJRT3gc
        K6Xc74Hzc9aBt02gUKhXoFR5Rg==
X-Google-Smtp-Source: AGHT+IEIxkxJMHTHddH6e9vxURb7vyya0U8l8ijNR3g0bzw+qT3mlAGtTd1Mz3CsBWlsWVc9jIz9CQ==
X-Received: by 2002:aa7:d1d6:0:b0:525:528d:836f with SMTP id g22-20020aa7d1d6000000b00525528d836fmr1588780edp.18.1694589479936;
        Wed, 13 Sep 2023 00:17:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id bc3-20020a056402204300b0052348d74865sm6702364edb.61.2023.09.13.00.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 00:17:59 -0700 (PDT)
Message-ID: <c4420c00-5c45-c46b-ae73-15c6d8af0694@linaro.org>
Date:   Wed, 13 Sep 2023 09:17:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 14/14] arm64: dts: qcom: sdm630: Fix USB2 clock-names
 order
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org
References: <20230721-topic-rpm_clk_cleanup-v2-0-1e506593b1bd@linaro.org>
 <20230721-topic-rpm_clk_cleanup-v2-14-1e506593b1bd@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230721-topic-rpm_clk_cleanup-v2-14-1e506593b1bd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 12/09/2023 15:31, Konrad Dybcio wrote:
> The last 2 clock-names entries for the USB2 controller were swapped,
> resulting in schema warnings:
> 
> ['cfg_noc', 'core', 'mock_utmi', 'sleep'] is too short
>         'iface' was expected
>         'sleep' was expected
>         'mock_utmi' was expected
> 
> Fix it and take the liberty to make the clock-names entries more
> readable.

This was already fixed:

https://lore.kernel.org/all/20230723141849.93078-2-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

