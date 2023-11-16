Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A45CFC5ACB3
	for <linux-remoteproc@archiver.kernel.org>; Thu, 16 Nov 2023 14:59:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345363AbjKPO7V (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 16 Nov 2023 09:59:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345360AbjKPO7U (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Nov 2023 09:59:20 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4351D57
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Nov 2023 06:59:16 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-507a29c7eefso1292368e87.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Nov 2023 06:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700146755; x=1700751555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wuJsJjmUw2d9PtB+l9SB05xhzzeK1y0VQYZA7F3rrLU=;
        b=wCwI/Z557/DsPIG7DlLAAp/JZuaNWlcJ2VoDWqyB0TV2ibTsKRh7VehWEBmEJQ62qc
         CZLhNLfFwOIXDeWS9FQ7gx9xvoGHqwY87SHUcdA1NGeAPjp7czPKYP8xPgDEhnI8oVpR
         ZQZfgHWtV28faUSILCdIdlwqvaa7kYHD9E62phgY91YYOAy04OPv5a/ok/X68CHtPUt3
         +EG9JrQvx+iD6J5xpWVu7wWE5xL/Ptwpt3vKvrGDF/S8G8hJOYbNv5ewvTmzpETRTB5v
         8ajKVNa/qQnKhNeI5PoULewDVppI7eK4wMO9eY4paCoxuPxEy8e6/DUWkCg4PPvNeio/
         uMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700146755; x=1700751555;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wuJsJjmUw2d9PtB+l9SB05xhzzeK1y0VQYZA7F3rrLU=;
        b=hfzZvZ51397IjOqlPGiU9Zm5ZBSXggwZS1/C9unquwKkAIVfsh3CDCHIeca5IRMzTe
         GFDY8AGGWK3lWTj+aZU6Rn/xxHcaGQ4k13IP1SGOdeyxmE0DV4OJnRVSdi5XoGafk7FU
         Yh8X5DTk1XNv26O3jR62Uh0vqLT/9ze71vfAa04dgkMDRV1t5PeURN0Jabbf2sTgQnDu
         mMLe5gMM2tzRLxrIieHm41G90VREw7Nmw1oU4LaUp8HgQW5wwHvPHQAIFu7/yTIVvzdr
         txsL4JL49i14FZRVqfHpV0edHb8GddL5Z3Sm7MxFUy5WsqgzJ6ytnuBW0qBDXdc5mEcP
         kqVg==
X-Gm-Message-State: AOJu0Yz85mCMOx0bznJLv97WIudkSKGPoeZ0kV0/aHQ5CuEfpCqi4BaK
        IW8lvbguHIfwi5gCV6C/eTB5UQ==
X-Google-Smtp-Source: AGHT+IEf8+qrlVb+GbRjYPGoEKsgRRhuDHuoMBNbQOIWd8XcfdkT2zFsm1SHWPJgOwBGPeC3uPrVUg==
X-Received: by 2002:a05:6512:247:b0:507:9e56:5b1c with SMTP id b7-20020a056512024700b005079e565b1cmr10925871lfo.13.1700146754757;
        Thu, 16 Nov 2023 06:59:14 -0800 (PST)
Received: from [172.30.204.128] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id y2-20020a199142000000b00509463003e7sm17278lfj.186.2023.11.16.06.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 06:59:14 -0800 (PST)
Message-ID: <32aacdd3-6d3c-40a8-8952-68e23d81dedf@linaro.org>
Date:   Thu, 16 Nov 2023 15:59:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable
 various remoteprocs
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231113-sc7280-remoteprocs-v2-0-e5c5fd5268a7@fairphone.com>
 <20231113-sc7280-remoteprocs-v2-10-e5c5fd5268a7@fairphone.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231113-sc7280-remoteprocs-v2-10-e5c5fd5268a7@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 11/13/23 09:56, Luca Weiss wrote:
> Enable the ADSP, CDSP, MPSS and WPSS that are found on the SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
