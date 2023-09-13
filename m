Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F08CA5503
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Sep 2023 07:16:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238541AbjIMHQl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 13 Sep 2023 03:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238509AbjIMHQk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 Sep 2023 03:16:40 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 452D01986
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Sep 2023 00:16:36 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-52a23227567so8330682a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Sep 2023 00:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694589395; x=1695194195; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yn21ujmkr4Sp+EA0gnf8dygODVc/XuXdjn0LI3sjZCE=;
        b=CpYHGOyHsVw3HAVKXZXFkjMqXx7MIGEFKEb57tnO79+DU2I0WpCz8e3ZlcxWM6w2kg
         YXFz74qnmSBnKL05oD2EST9HW3ax8yTOSKsvZh+eNMYRnSX/vfdHonqYbq59LKysVKrg
         OONjz9Y6SP+QbFo92+ytJsobL0nR7NZADxXzv6XcIB5cAV1ECzaxusJ9lmGhIyutwdwT
         j4xC/CWuGTh6hh9hGubUqEUgsm44KCNuzyey37Vnlz2UkUAkaoRiUH+qE+GtNaVEoNAE
         J5dLL8X/4Y+xifrUVIQ8unFEQr/Lc1ljdbxjcpKLVtM3vCAllHzkoi/9G7QS/P8FmvMT
         ksJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694589395; x=1695194195;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yn21ujmkr4Sp+EA0gnf8dygODVc/XuXdjn0LI3sjZCE=;
        b=Oyc5CYO7DQBlVJ+WycpvhRFMv9IHeXLH0VwsP29yb2s6jclBum5CnYQhvydOfQcoER
         Mhg+rYGpggKMhEY6h0EFMdUMGI1/o/590lJRbFzCujZoDLotJAGL0Cv6e+dItO7hnfGR
         H4VB4LZH9GBBpeLKYBCqgK1GvFk/3yc7pTFPJnDfkxScTU5G75G9FiA7cS28+YGya+YZ
         i5FadJnYeY1ndg6UgIFRW5x6EvXwrcXGnnfVSjkzvYb4kegGrUdzvkhZwzzFcsdWc9w8
         rJ0g9UXGUZ9vkeHSgV20gel6Id7J7t62yAmnHwFt5hQGhf5/+EuNpDifeFB0eElC01Fz
         z+Ww==
X-Gm-Message-State: AOJu0YwMyJz1wB4DE/BxuEwgCyccon8vAQFNG2mPSvZsxbGpJx6hjwtQ
        c7Q1nbmqXk253wRSPWZm+w0F8A==
X-Google-Smtp-Source: AGHT+IFyf9Fx/pf35KrNLfez0lmkNaBYKL0JSrB9CFz9ETZ9MnkjYUX40l83RXA8JXM9raiowLn7Ng==
X-Received: by 2002:a50:ec8a:0:b0:523:2274:91cb with SMTP id e10-20020a50ec8a000000b00523227491cbmr1504709edr.12.1694589394834;
        Wed, 13 Sep 2023 00:16:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id eg27-20020a056402289b00b0052f3e8c84fesm4786096edb.29.2023.09.13.00.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 00:16:34 -0700 (PDT)
Message-ID: <af5b83c7-94af-1779-68da-78976fc68fc7@linaro.org>
Date:   Wed, 13 Sep 2023 09:16:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 08/14] dt-bindings: remoteproc: qcom,adsp: Remove
 AGGRE2 clock
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
 <20230721-topic-rpm_clk_cleanup-v2-8-1e506593b1bd@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230721-topic-rpm_clk_cleanup-v2-8-1e506593b1bd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 12/09/2023 15:31, Konrad Dybcio wrote:
> The AGGRE2 clock is a clock for the entire AGGRE2 bus, managed from
> within the interconnect driver. Attaching it to SLPI was a total hack.
> Get rid of it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

