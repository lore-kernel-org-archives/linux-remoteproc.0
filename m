Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C26C77B61
	for <linux-remoteproc@archiver.kernel.org>; Fri,  7 Apr 2023 13:55:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239568AbjDGNzY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 7 Apr 2023 09:55:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240718AbjDGNzF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 7 Apr 2023 09:55:05 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A4B1BB88
        for <linux-remoteproc@vger.kernel.org>; Fri,  7 Apr 2023 06:53:19 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id l17so8573905ejp.8
        for <linux-remoteproc@vger.kernel.org>; Fri, 07 Apr 2023 06:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680875589;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1zzdPXrbK3r5iDo1cwu4EdwqJS32y505PzVqOYCGBbc=;
        b=UbiNnjwZwxnedFj6AMxEnsLewBIyusqJ+pRg2zUfgAUP+9+IbJgjCusXno8RBWcLbf
         +n3jfGpNxiX9Iqxq9iEO57kbXH7Vt+5ijSQNaDRLVb51EWC59yDUoriIA7QgUXGVw+xe
         MRKWiIRyMhcP7s54bF3znrbHuNlInbn95jaWsBt5SyuuLNnlajnPyAyah9oQ09AsskcR
         KKy8pEVrKwZ+aStSBKJXBAbcgKbD7Bpf5kU4Ypq09GvQIsXh9xi64lFWef9pg408DQpt
         ODHoR4moK36yLtNZwbLH+oMydv5czXUK7vZHMMQnH0Ugj6amn7+jdIEJ4but/68mmYbK
         73og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680875589;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1zzdPXrbK3r5iDo1cwu4EdwqJS32y505PzVqOYCGBbc=;
        b=DENDYZLta+faaL434ox2L7SLIDmBCN81i3aqKu4NrRkaDSWpbU2nCnZ8Al63tGcrhA
         zIBdJ4ygB9K8cw9vZSJaM7PwXUfzC/dx44kgZUXo9leA7CAbDMr2xQduc17uK3kI9i51
         diQkD5a45LJgeRNmBqvyDYM2xuU3LZyqpAOSyfNazwmhEJLTMvgysfjmq4hbXUmU+U4D
         XBbRk7IxPxIYhmgjoNd9+DXNOJfR1U/L4HNhWeLA6EXaoIpbFzuRvLvJ2a4CIOYkKgSZ
         s9IZ3Sk9E/M4R1QtAWwUmk57ZUIv5neeWiRNEhEFAQiOsWAa1XyzUG3Mr5c35syZli5J
         NbQw==
X-Gm-Message-State: AAQBX9dPrlAX9HOygZ/mp4xU8FxlmoH8ZllyJsQgU+12bhlpgiNrsIJg
        qTe8mq78lEStVdb90zrS1nq7eg==
X-Google-Smtp-Source: AKy350bgxm5X7doDqO5jZ4QBplTmI32AzFdYcvps4r4ECqjPKsPGQmcXk//k49UgIs1zxSsywQVKfg==
X-Received: by 2002:a17:906:b81a:b0:930:d17b:959b with SMTP id dv26-20020a170906b81a00b00930d17b959bmr3059761ejb.22.1680875589321;
        Fri, 07 Apr 2023 06:53:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:b20f:8824:c926:8299? ([2a02:810d:15c0:828:b20f:8824:c926:8299])
        by smtp.gmail.com with ESMTPSA id hb18-20020a170907161200b0093344ef3764sm2074829ejc.57.2023.04.07.06.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 06:53:08 -0700 (PDT)
Message-ID: <19f5a3c6-b699-868e-65cd-fb66732d3c4b@linaro.org>
Date:   Fri, 7 Apr 2023 15:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/6] dt-bindings: usb: dwc3: Allow dma-ranges
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20230407-topic-msm_dtb-v1-0-6efb4196f51f@linaro.org>
 <20230407-topic-msm_dtb-v1-3-6efb4196f51f@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230407-topic-msm_dtb-v1-3-6efb4196f51f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 07/04/2023 15:28, Konrad Dybcio wrote:
> Allow the common dma-ranges property to silence warning like this:
> 
> qcom/sc7280-herobrine-evoker.dtb: usb@a6f8800: 'dma-ranges' does not
> match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

It would be nice to see here explanation why dma-ranges should be added.
If DTS has it incorrectly, it might not be valid reason to add to the
binding.

Best regards,
Krzysztof

