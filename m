Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8A0C001B0
	for <linux-remoteproc@archiver.kernel.org>; Sun, 23 Jul 2023 09:34:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbjGWJev (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 23 Jul 2023 05:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjGWJeu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 23 Jul 2023 05:34:50 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B17BCE66
        for <linux-remoteproc@vger.kernel.org>; Sun, 23 Jul 2023 02:34:49 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31438512cafso2922823f8f.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 23 Jul 2023 02:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690104888; x=1690709688;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4RQzulAln68QaO9xCL+1uqZn0t96ask7tv6fnlyXL9E=;
        b=mxahKaJmQ9V/amzC/e6KwIs48UtlToaFXzkTmbqljUfs7owNzm+ROa+GSqcutQaXxx
         nKqYmNZ/eZorXs7fb8R8kCfDKpvIPM91Zw/yCLu5wErRC443YichwaqUP9NyLq8RteGZ
         e8/c8laNGwDh25TFszYPeCtJ9Z8EHyT7Naj+79RQAb3nxiLzAsXw6AaNuCCnaTcMZoe7
         B/LLndwWh6q8AGqsp+KGFPtze+6yykZxvKYXsyx7gpwncBFkST95DW5TMKJtEXH5cqtX
         moVIvxIJ1g9wfxVX5PmTh+EI5W3ZpHb7Ey6FlYmmoTx7E34J/LhMS02wSYPYEoCj8fMs
         jMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690104888; x=1690709688;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4RQzulAln68QaO9xCL+1uqZn0t96ask7tv6fnlyXL9E=;
        b=i0SKwMf7itdVF8xR9TDDmZsvToSoicK74S/9Iatad6pu+c+LkbkFUzna2gGLDxQuhk
         5I5rC0EOTwuUVJKlj8Wr7B4K5abA6C0bHzvMDL3BU7X6nDygpOUvl1f1GmhwjJsMQqL/
         /RoS6svmNcAt90PbUEh/uz4f/uC1WJset9Bo0MSZ0cMuvM5VioQbrMoovudJ8ZvVfMlo
         Ga6VKTkAf2wbcJ+dX0fkiOK87c9symxxPD5wdE8xX8PV26/PsHkZlI212jroWDFE7k3T
         aShNDhB8IXfY0Bz74nnL1ZyDMk+k+Z2JNlsB4fj/XUvd16dudxwLF5jsDw7Y29TKn+CD
         IbIw==
X-Gm-Message-State: ABy/qLZD9o/Owf3UFb4lT1n/buZ7fNfFQCWtRrq12mbWUIbA2B6MrOEe
        uvCoRd+X86NuhuXivlg8ukWP9XcMmyFZW20zaxA=
X-Google-Smtp-Source: APBJJlFriNeOwzy4enYAho2TrtX5YBSNV5iCxkOpDFw6Wt6bicliLHEWrHUekrzUkCyhRfMet3gV8Q==
X-Received: by 2002:adf:e34c:0:b0:314:336e:d4d8 with SMTP id n12-20020adfe34c000000b00314336ed4d8mr5779040wrj.8.1690104888099;
        Sun, 23 Jul 2023 02:34:48 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id v4-20020a5d4b04000000b0031411b7087dsm9241975wrq.20.2023.07.23.02.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jul 2023 02:34:47 -0700 (PDT)
Message-ID: <12079552-f724-b821-15c0-bf2ea6afc780@linaro.org>
Date:   Sun, 23 Jul 2023 11:34:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 07/11] dt-bindings: remoteproc: qcom,msm8996-mss-pil:
 Remove PNoC clock
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230721-topic-rpm_clk_cleanup-v1-0-cf6cd5c621d5@linaro.org>
 <20230721-topic-rpm_clk_cleanup-v1-7-cf6cd5c621d5@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230721-topic-rpm_clk_cleanup-v1-7-cf6cd5c621d5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 21/07/2023 17:36, Konrad Dybcio wrote:
> The PNoC clock is a clock for the entire PNoC bus, managed from
> within the interconnect driver. Attaching it to MSS was a total hack.
> Get rid of it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

