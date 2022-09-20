Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7D9C54EE9
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Sep 2022 09:55:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbiITJy7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Sep 2022 05:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbiITJyy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Sep 2022 05:54:54 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E32CE27FF5
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Sep 2022 02:54:52 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id a8so2808441lff.13
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Sep 2022 02:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=zaiJOfQLVu73Ck1GD1MriF7Mol9UFK9xKfuzOqaBT4A=;
        b=Jw/wO21Q4x/c5PtqYlxbn3TmvK1FXUJ7IayvEGytXCzNYKIVa8dlgeGHlu5l5ABHBl
         nLCCNMdTPTpCDoL4ENYZ+mZl4nHu6cy2TIZDpx1ragarQdDHKmkjzZ1k2+ARO6YpLVRY
         DzQaI0pxVkB05BXs5iIpatov7KhC1j+MaZKnNRx6MKfLIURTfMb2falryKInaCaMbZIh
         8wsU3hacgoyCqPHcoWD0E0sKTN+5P05WnwvvEURHnxAUJI7ZsFDUi3yttSGeZEHaJV8I
         4OPjhANihPng/LHLZQPi6AUfND/yovLT42sUAdw6rhA0VKwl0Kgj/4IDwAI51RYs72RH
         vjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=zaiJOfQLVu73Ck1GD1MriF7Mol9UFK9xKfuzOqaBT4A=;
        b=MHvuOo7yXUsPEfApYKQ1udHTpMTTHbatYOmrcxGCLb43tIBTl3SS6ZvpIzsZaGB02n
         s1ijextFjcJYVKUHb4jsjeu1GpIveZbhEzYaUP6zEvfRadCRiFkyBsibJI4EVzDG410X
         jg2J21QrPmPHOrff1bNLn9PLx3RYbjfvNtn11b9ipDqpUZ8C3PF9hKBxm+U39idw+Nj5
         Mf9WpkqzJh1l+6lEtqBYueKm3VKRrYTrtvp8wjlfwsegFH7we74ldvCpkKxBAkLlcJ9n
         5OqBkbezdFeCYAZG8z34vYHAyanLddPEjYqp3q0fDVl/+ccMYZ25paTYLg/53FIgJhNo
         864A==
X-Gm-Message-State: ACrzQf0v1eUeIXGeYwdOKQcyZWFPhJvgs2jBQF+AssHihFvJ10NnmrIq
        nHKU5PEizSap41WrkfbwFEmXXA==
X-Google-Smtp-Source: AMsMyM5CfftZngElwySLO5p8IGXRjK+YA25ghlxdDuiuHKTzdzeUgn57EGrNlet0OGabjvK1lKvOCA==
X-Received: by 2002:a05:6512:234a:b0:49d:3155:45a7 with SMTP id p10-20020a056512234a00b0049d315545a7mr7259519lfu.245.1663667690971;
        Tue, 20 Sep 2022 02:54:50 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t2-20020a2e8e62000000b0026a92616cd2sm184276ljk.35.2022.09.20.02.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 02:54:50 -0700 (PDT)
Message-ID: <a047f284-9af4-d5f3-4cb0-5c9955237fbc@linaro.org>
Date:   Tue, 20 Sep 2022 11:54:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 2/4] dt-bindings: remoteproc: qcom: Convert wcnss
 documentation to YAML
Content-Language: en-US
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     andersson@kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20220920030316.1619781-1-sireeshkodali1@gmail.com>
 <20220920030316.1619781-3-sireeshkodali1@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920030316.1619781-3-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 20/09/2022 05:03, Sireesh Kodali wrote:
> This is a direct conversion of the existing txt documentation to YAML.
> It is in preparation for the addition of pronto-v3 to the docs. This
> patch doesn't document any of the existing subnodes/properties that are
> not documented in the existing txt file. That is done in a separate
> patch.
> 
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>

You did not CC me on cover letter. There is no changelog here.

Please resend following Linux kernel process, so be sure that people
receive relevant patches, changelog and cover letter.

Best regards,
Krzysztof
