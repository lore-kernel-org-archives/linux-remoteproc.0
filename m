Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E989C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 Jul 2022 06:44:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbiGOGo4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 15 Jul 2022 02:44:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbiGOGoz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 15 Jul 2022 02:44:55 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF26932D86
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Jul 2022 23:44:53 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id r9so6331811lfp.10
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Jul 2022 23:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=BFuyTYkBVntkAJpFDOkI8y4Hk3hNpnGc2UGb3LZbDEw=;
        b=kfb0C6aOG8uLCkeGPJ7N8KhreB+pWGlZoCCOA+XdYGRzHO3piXPxPiSvHEqY1fHf7A
         YEyDFcfuqO4sUOYfYwlcn46+VZn68TZ3I5jAMfns7RzO3XcqiEncV+GiHbSCBkfstC0M
         WNNQZOjVDrSFJuX7iXO8A5M1762WuWDhihpPnMJ7CYqhkKAvLWw12b0QELoX7pOy5vww
         KMPBjWSmgxQrNReTcTA4DxEl64UCvAeDmRiN8RixZl2Zif+a1bFlxNOnJaLze/hzvOLm
         bUiiDlDTe+FrKs/kv3TrG7TEscIn+BsbLA91+cj0EXyYdPgZ8/ZdSFX0uaU73hAzml9M
         hdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BFuyTYkBVntkAJpFDOkI8y4Hk3hNpnGc2UGb3LZbDEw=;
        b=U6vE0PaYs2ab/32EvcTGcPwz0jS9KeprWYkWTNM1kaejD1rgcLViRIxdR0yCeXAB+f
         o2xOVnjI8Ee1ZKfdwp1VZZU08QcpM1IxzKxhAac7PoUVbXvbYgwJxsyPRYhOiq4hnFQF
         mOAwjvDjF7T3yzGPlQh9VFatJL6BysnPkX1CX5DL2Ft4WoEi8P8QIzpWBqVb+4+UbFVl
         hOcG2sqkAHq6ZabilM/UFOdl8irlzOEke+JFPJMhqg03khCV3OUK3jOSgLIwcXOdKmCi
         2KQIIasshgxYi27dU3f1kyxX67QUsGFLieoLGtH954yLEKyp5SXwYWw2+5+NvxWF1AIm
         kZGw==
X-Gm-Message-State: AJIora8A+IK4tt3o3IEXXzaoGHf1S5RJcOZc0yhERxR9MK+S80U6/6r3
        fYJ5ornoQt2Gnxym3idJASTaJA==
X-Google-Smtp-Source: AGRyM1tusjo7K/CrIx+FyfrDaTeHF+KvjM1lTvwa+TEaF28CXKZx96MGu9QItkPom1HWj9jfEkcnPQ==
X-Received: by 2002:a05:6512:3d8c:b0:486:d81c:4365 with SMTP id k12-20020a0565123d8c00b00486d81c4365mr7479851lfv.194.1657867491964;
        Thu, 14 Jul 2022 23:44:51 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id bg11-20020a05651c0b8b00b0025d72c1f646sm619244ljb.58.2022.07.14.23.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 23:44:51 -0700 (PDT)
Message-ID: <65101d7c-a1c4-5569-922a-2f9750ce5589@linaro.org>
Date:   Fri, 15 Jul 2022 08:44:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/6] ARM: dts: qcom: msm8974: Disable remoteprocs by
 default
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
References: <20220712124421.3129206-1-stephan.gerhold@kernkonzept.com>
 <20220712124421.3129206-4-stephan.gerhold@kernkonzept.com>
 <bcb1e0ec-f0b7-ce45-a63f-7272c1f398c9@linaro.org>
 <YtBoG1mAwOlylGP2@gerhold.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YtBoG1mAwOlylGP2@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 14/07/2022 21:01, Stephan Gerhold wrote:
> On Thu, Jul 14, 2022 at 11:55:44AM +0200, Krzysztof Kozlowski wrote:
>> On 12/07/2022 14:44, Stephan Gerhold wrote:
>>> The remoteproc configuration in qcom-msm8974.dtsi is incomplete because
>>>
>>> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
>>> index 814ad0b46232..35246bd02132 100644
>>> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
>>> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
>>> @@ -1172,6 +1172,8 @@ remoteproc_mss: remoteproc@fc880000 {
>>>  			qcom,smem-states = <&modem_smp2p_out 0>;
>>>  			qcom,smem-state-names = "stop";
>>>  
>>> +			status = "disabled";
>>> +
>>>  			mba {
>>>  				memory-region = <&mba_region>;
>>>  			};
>>> @@ -1639,6 +1641,8 @@ remoteproc_adsp: remoteproc@fe200000 {
>>>  			qcom,smem-states = <&adsp_smp2p_out 0>;
>>>  			qcom,smem-state-names = "stop";
>>>  
>>> +			status = "disabled";
>>> +
>>>  			smd-edge {
>>>  				interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
>>>  
>>> diff --git a/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts b/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
>>> index 58cb2ce1e4df..8a6b8e4de887 100644
>>> --- a/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
>>> +++ b/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
>>> @@ -147,10 +147,12 @@ wcnss {
>>>  };
>>>  
>>>  &remoteproc_adsp {
>>> +	status = "okay";
>>
>> These go to the end of properties.
>>
> 
> All the other nodes in these two files have the 'status = "okay"' at the
> beginning (just like most of the Qualcomm boards actually). I know there
> have been some discussion to change this, but until existing boards have
> been changed I would rather not introduce a wild mix of both approaches
> (within the same file at least).

I would say less code to fix later, but OK.

Best regards,
Krzysztof
