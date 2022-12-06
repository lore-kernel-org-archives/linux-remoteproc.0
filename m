Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 787D1C352A1
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Dec 2022 07:58:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbiLFH6q (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Dec 2022 02:58:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbiLFH6p (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Dec 2022 02:58:45 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3A98765D
        for <linux-remoteproc@vger.kernel.org>; Mon,  5 Dec 2022 23:58:43 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id g7so22430855lfv.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Dec 2022 23:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kuxMKSbqC/Jgu5E4lIjy0a2xiVCLdx5Bzf0OSzdJ9K4=;
        b=gGYhjUU2P1UY3m/14PaCJ9X0vDZV735yOUxXjy6fkwqf0urvMLYvdOZu8W+2LnUpYE
         g9czDvAqWIgftLA+YWCRI7RHT17qnLtPgaZIS2VArFuk23wHsU6wtjN1Ir1UmfDu0NPD
         q2VsHpfsEK4R7Rdect34HbJALcStt2SWbF9s+hE50UBjTJ/F9sSr+Mt6KnBdULGvccsb
         HrByjPeBAUs8HLXuf9RUaNNRu+3na4I/8ezrqiw/J7uy9JFK31/QeDt3ZnWpvQoguTSw
         EmOQPnBu8BkT47yS7tVdEhmDAr11ZapcF+zgPhEWdKTgPIDPDGt3LgHqqOZyWBhfKwis
         qPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kuxMKSbqC/Jgu5E4lIjy0a2xiVCLdx5Bzf0OSzdJ9K4=;
        b=4gHgryHPaQGHCGAMuQLB9+qFYe8YNgyHvecZk1CpEh5tbmXeaKmdECaQ9xLuMoicvB
         mHEo+KQzor4slKvt9OpBC+ucvBzOh13gECZwYSc9bgbTckTdSOX028a8uHQ28Ko0Wh27
         g/88FBrl+gpxxlTsmoQFnrWWkEl0MIC3Vyv4TlTI65RUrQasM3CNgcEVnK5sF+3rwiHi
         eRU8sJrWw3hpyhOnwu9oLI6FOKFE2VYpntofVZGFrJ9VT325ZqcbgOVYr+ngtJw4o2Sj
         0+vpdmypogRh8rNxCtb5s+1b8uA9znsD3D7mGjKx3Cs3qPagripV/9mktdeNtk21DIf3
         SbUg==
X-Gm-Message-State: ANoB5plSU7h+4Qjqw+159MVK9VBuTH5a4RcLOrt1CDFoSMQ0Tozugrn9
        e3btRrDDnUqVtAYwJ25csoPVHQ==
X-Google-Smtp-Source: AA0mqf7q59b2daQSmHIbeePPXZzwACGd8uOQbPwr12ZU/qnQ2r8IuZVlVwJQ3jj5MPPt9ZSJVrkAtw==
X-Received: by 2002:a05:6512:1112:b0:4b5:6375:32d9 with SMTP id l18-20020a056512111200b004b5637532d9mr4282236lfg.480.1670313521912;
        Mon, 05 Dec 2022 23:58:41 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id r10-20020a19ac4a000000b00499cf3e3edcsm2391600lfc.296.2022.12.05.23.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 23:58:41 -0800 (PST)
Message-ID: <26091130-1572-6a86-8590-7f3ec7654100@linaro.org>
Date:   Tue, 6 Dec 2022 08:58:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 08/15] dt-bindings: remoteproc: qcom,sm8150-pas: split
 into separate file
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221124184333.133911-1-krzysztof.kozlowski@linaro.org>
 <20221124184333.133911-9-krzysztof.kozlowski@linaro.org>
 <20221205194934.GA2476927-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221205194934.GA2476927-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 05/12/2022 20:49, Rob Herring wrote:

Hi Rob,

>> +  clocks:
>> +    items:
>> +      - description: XO clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: xo
>> +
>> +  qcom,qmp:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: Reference to the AOSS side-channel message RAM.
> 
> Not ideal that we are defining the type here multiple times.


I was thinking to add it to the common file (qcom,pas-common.yaml,
created in patch 6/15) and just disallow it for other variants,
but that does not work that good:

Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml: properties:qcom,qmp: False is not of type 'object'
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml: properties:qcom,qmp: More than one condition true in oneOf schema:
	{'description': 'Vendor specific properties must have a type and '
	                'description unless they have a defined, common '
	                'suffix.',


qcom,qcs404-pas.yaml has "com,qmp: false" and it references
"qcom,pas-common.yaml" which has the definition of the property.
However it seems it is treated as new bool property.


----------------------------
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
index 007349ef51ed..62126e96d2f5 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
@@ -39,6 +39,7 @@ properties:
 
   power-domains: false
   power-domain-names: false
+  qcom,qmp: false
   smd-edge: false
 
 required:



diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 1d5e01c8d8bc..72cdcc2b157d 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -60,6 +60,10 @@ properties:
     maxItems: 1
     description: Reference to the reserved-memory for the Hexagon core
 
+  qcom,qmp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AOSS side-channel message RAM.
+
   qcom,smem-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: States used by the AP to signal the Hexagon core
----------------------------

Best regards,
Krzysztof

