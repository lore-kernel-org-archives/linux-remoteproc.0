Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579E2C38145
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Sep 2022 10:24:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbiIGKY4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Sep 2022 06:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbiIGKYx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Sep 2022 06:24:53 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3205062EE
        for <linux-remoteproc@vger.kernel.org>; Wed,  7 Sep 2022 03:24:36 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id p5so2370036ljc.13
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Sep 2022 03:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=sjy4Jxxxofr/CNtkGo5BunwXXx20LZ0tjJE5uoNvdEQ=;
        b=OGIExj4MjF/TqRB81wkACNnrGKX0bsArf1wuHu+JuLcWpZFBEH/FUO3li6w7en8MOc
         BLUuPzWcKWHu0qkvn4tyyDD35IMJCiPA7kKPIJK/exdObqV1PKYINtL6jklXYs+e6dXj
         F7o1U4W5BNFBcwAv+6CnfLHtMwchNpTO7HnZ87n+zxPlDjZf3x7Ik2H8iWNpXE4+7hmg
         Z7aY3wk5FxM2z9e+KwbcGpO5nUaxq0kXVWtnC3vuSoEEzfC3GF5dDBe6LEvvKCxH/28x
         tQqe4FM+4AdMY5NY0TA5lHOQNZN+Ssm8LnTdaSKmCeGKektk437RS3cB6F/hiOs8LzRd
         igag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=sjy4Jxxxofr/CNtkGo5BunwXXx20LZ0tjJE5uoNvdEQ=;
        b=PwSKhyIIc3HIDiAYLrZjfatfj5jMwJjfF3ozDll/o3mF75SqO6qrp0GGBnfl4nKpQa
         OttSZx6/KVMFFYbvMGqluk2zboWtp9vcVQeVC1yWBTc6f+uhGSRf1ku/K0YB97ETrNYq
         5eo+SGXMjILYDh2gi4hj/p+DlnDfYqQbFZq5STsJyCxbuohEj5XFduG4yvm7nh7QVf7K
         pl51O7t70Wr/x9GeoHkrm1k36PqtjHvon0tiTUN9oa8xd+0x/77tWqq6YWu0GMAB1vMe
         FvFWx3uH8GUyGvcLhTrWcT73WFOFtseud8jscDcwUWYtyIWr/WsCcAl+c0hTXCA2VmQ6
         h+CQ==
X-Gm-Message-State: ACgBeo3PSe4/jDjeyguRq+rS+zcClE2Ly3WvNGERrZKJ/+vGS7eMSy5S
        svYyoyLODXras7HyKduNAwc/6g==
X-Google-Smtp-Source: AA6agR7LrS6Wpr0G0GMNseZ4mqfHBTC8LHNpanhfuhXUqUCYOVOmftOUiwx4o+SwlUSvSCvYDrDtOQ==
X-Received: by 2002:a05:651c:1542:b0:249:5d86:3164 with SMTP id y2-20020a05651c154200b002495d863164mr784613ljp.500.1662546274641;
        Wed, 07 Sep 2022 03:24:34 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q17-20020ac25111000000b004946c3cf53fsm2375739lfb.59.2022.09.07.03.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 03:24:33 -0700 (PDT)
Message-ID: <115bb541-57d1-23fa-d365-4e239f933d1b@linaro.org>
Date:   Wed, 7 Sep 2022 12:24:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v12] dt-bindings: misc: fastrpc convert bindings to yaml
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20220907074301.3996021-1-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220907074301.3996021-1-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 07/09/2022 09:43, Abel Vesa wrote:
> Convert Qualcomm FastRPC bindings to yaml format, so that we could validate
> dt-entries correctly and any future additions can go into yaml format.
> 
> Use compute-cb@ subnodes instead of just cb@. Add qcom,glink-channels and
> qcom,smd-channels missing properties to make sure dtbs_check doesn't fail
> right off the bat. Correct the name of the parent node in the example from
> smd-edge to glink-edge.
> 
> Since now the qcom,fastrpc bindings document is yaml, update the
> reference to it in qcom,glink-edge and also use $ref.
> 
> Also update the MAINTAINERS file to point to the yaml version.
> 
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
