Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080D4ECAAD5
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Sep 2022 16:30:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbiIIQap (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Sep 2022 12:30:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231770AbiIIQam (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Sep 2022 12:30:42 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7855AA0E
        for <linux-remoteproc@vger.kernel.org>; Fri,  9 Sep 2022 09:30:40 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id x10so2488066ljq.4
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Sep 2022 09:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=GhijzOpjBSZ7nCgUhoccck5ZIQUlIFoaWDsMZJ6nH7k=;
        b=I4j7Pcd20LpWaZq4vo2jbbXxGnuCGPC0vRNNXv1pXnQQ36vo7i4bBmWp3N7c5Q0UaR
         pJAQr2bZFOrGVsPkVjaaWMcaApx1uJ/8uNzOErXc0bZQ3H1MIoZR1MwQK+OLtAyomOXb
         6+cFZbBG77MIxiPYQEVIWAuWmOJQJTG1dkg2nfnkkh8DranTyzJhy6ZryT9gbUyD2c+q
         /U0VayMgCPIEwYHEYKVRVWJRHiYMQPa44xPTj8typjdYNZ09p0O6QikgvEGnxmcyEHT+
         XYgzmsuF1duIulbUaWkT+IuAdxaRDgmm+c9f4pBglM3YqKnBu4NTORRCVrZvwmAVGdl+
         rzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=GhijzOpjBSZ7nCgUhoccck5ZIQUlIFoaWDsMZJ6nH7k=;
        b=YK2BUUKM5nBayN0pnL5f0byqYUbVsLW2PMCxtxo7I0p+bSxiPhVksZ53jXrJ1Daatt
         MVOXvqNBCAPsv79t+p+sSR7SutC2KegOtrHTV5xbnwgZZOmCbqtpXAU8z6Y3Oazqo1Ol
         hWjKyC3HtwhVweFjjvN5WrbAT3qw/Xh6gYLN3rNzJa6h+9MlnM1qFaqlJXYDLC2MkVm1
         yOgtqOKJv5/JTAtWBuGtBMpJjsXhrhXUcmI5uMMbIKU/nEdDjvUUjs0wF1RNshIvwAhN
         R6zgvQGnJW3fkXUYw2u0MmARzc1SHIbxmm8OugJVURGA+YqVmud7X2CZUpGYwm260qeb
         Rnkw==
X-Gm-Message-State: ACgBeo1JracTPFzQ2ACieuo2NzyjyjnS8tHFdooyAAkFok4Cjp5/wPXy
        CDrl5NNA80n796ePtDIVOezrIA==
X-Google-Smtp-Source: AA6agR7w7saLxlIJEBvuYi+z1NoLl7P1vzJYXRWF1pav4TOZ4YU2x0cHschDHYJ9ylCz+VQq0/EW3w==
X-Received: by 2002:a05:651c:4ca:b0:268:10c2:87bc with SMTP id e10-20020a05651c04ca00b0026810c287bcmr4529265lji.241.1662741038516;
        Fri, 09 Sep 2022 09:30:38 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h27-20020a2eb0fb000000b00261b9ccb18esm147240ljl.10.2022.09.09.09.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 09:30:37 -0700 (PDT)
Message-ID: <9e5ec2a2-7b69-648d-4069-8d169abd7f4f@linaro.org>
Date:   Fri, 9 Sep 2022 18:30:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/7] dt-bindings: remoteproc/misc/qcom: stricten SMD/GLINK
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        David Heidelberg <david@ixit.cz>,
        Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20220909125403.803158-1-krzysztof.kozlowski@linaro.org>
 <20220909162351.GA1455181-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220909162351.GA1455181-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 09/09/2022 18:23, Rob Herring wrote:
> On Fri, Sep 09, 2022 at 02:53:56PM +0200, Krzysztof Kozlowski wrote:
>> Hi,
>>
>> This depends on qcom,fastrpc.yaml conversion in Rob's tree, therefore
>> everything should go the same way, I think.
>>
>> Best regards,
>> Krzysztof
>>
>> Krzysztof Kozlowski (7):
>>   dt-bindings: misc: qcom,fastrpc: correct qcom,nsessions name
>>   dt-bindings: misc: qcom,fastrpc: add compute iommus
>>   dt-bindings: misc: qcom,fastrpc: restrict channel names
>>   dt-bindings: misc: qcom,fastrpc: correct example for GLINK edge
>>   dt-bindings: remoteproc: qcom,glink-edge: require channels in children
>>   dt-bindings: soc: qcom: smd: restrict child name to smd-edge
>>   dt-bindings: remoteproc: qcom,smd-edge: define children
> 
> Series applied.


OK, thanks!

Best regards,
Krzysztof
