Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 951E1C636D3
	for <linux-remoteproc@archiver.kernel.org>; Wed,  8 Feb 2023 09:52:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbjBHJve (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 8 Feb 2023 04:51:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbjBHJvd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 8 Feb 2023 04:51:33 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58D741087
        for <linux-remoteproc@vger.kernel.org>; Wed,  8 Feb 2023 01:51:15 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id r2so16134891wrv.7
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Feb 2023 01:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cyRYvJyCWI/JC6w1OyETD6RGehTmuMlsiaeC8jqJRf8=;
        b=HhhpXjGkga91Ht/Or9neGo0HwbyHY5UY8vw4lWSBuKPkFt/WMkA1uBS1G9oXVPciP4
         Snowf8jEYyA+8WBNB7R52KUhURGgOnBOiC9SNQSnDCl2f/5gpF0wFp4I7aUDw9KfF/Bh
         Fx5jx+ghwoXotQ3XWbV2Edq9h/mF0jzr+dvbM2TAZk/tNj35TNLc8uCEbXRJ3CtD8Mrw
         EO2ovRiDVJ80O64LQMT/G0WC+/gIaDD8PX/d296uy7swyGKh+MU/aKZ+vAsk1g9XCEEg
         ewnSDivSI51CNW1aw3+2NE4qfzDHjRrPCPuAqH/vSDor3M/cknhkRh1JZma8bbMX2EGm
         JltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cyRYvJyCWI/JC6w1OyETD6RGehTmuMlsiaeC8jqJRf8=;
        b=57XcJEDtklIEGivIQreGQcF3JyH8hGjp6942wD1nD9uyp00C8xV9QwGzYN/i8OrZzg
         jx7AMt0DrawWFXB5LV0lVtpC5NQqXEEhUslT57JRk3o5HNOP61jYZUctadS8eAXh8p6w
         LfrKoVV0y94EyLMLxIaiEtq0nb0d5/7gKOnpkX6PUZSejXSUxvwqLmSdxAUkzjMVjkHg
         IIvT5Qfdr5497tq8YSP9sDEOeUZYgFK2SxitFA4cmX705l7HUaR9zR+snUiNdMdGFZSP
         hokuJgVV8/UASuRgwhQcWzp5OQa8HiPUbiZa2TW7D+xLP89zTciU6bEy72cQQTW1heDY
         hhlA==
X-Gm-Message-State: AO0yUKXna+0AxzCaZbGNzrDd1tZnvfvr6zZBliWnomeDc50JoD/t2ZV8
        3IdsNhgmgmn8ndnH/J4MT+NZag==
X-Google-Smtp-Source: AK7set++Unt7Q/QYP1bYshyjzJ08uYUUK2mlbfn9Zedzo8Q1sGp65Kt0qdP9N/93pqakSbATQXV2ng==
X-Received: by 2002:a5d:6885:0:b0:2c3:f038:f38b with SMTP id h5-20020a5d6885000000b002c3f038f38bmr6682705wru.24.1675849874388;
        Wed, 08 Feb 2023 01:51:14 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s21-20020a1cf215000000b003e001119927sm1362996wmc.24.2023.02.08.01.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 01:51:14 -0800 (PST)
Message-ID: <7b71af71-ebb3-7339-2ae8-0c5d0148bdb5@linaro.org>
Date:   Wed, 8 Feb 2023 10:51:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/5] dt-bindings: remoteproc: qcom,glink-rpm-edge: convert
 to DT schema
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230207090852.28421-1-krzysztof.kozlowski@linaro.org>
 <20230207090852.28421-4-krzysztof.kozlowski@linaro.org>
 <20230207184230.GA3950598-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230207184230.GA3950598-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 07/02/2023 19:42, Rob Herring wrote:
> On Tue, Feb 07, 2023 at 10:08:51AM +0100, Krzysztof Kozlowski wrote:
>> Convert Qualcomm G-Link RPM edge binding to DT schema.  Move it to
>> remoteproc as it better suits the purpose - communication channel with
>> remote processor.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../remoteproc/qcom,glink-rpm-edge.yaml       | 92 ++++++++++++++++++
>>  .../bindings/soc/qcom/qcom,glink.txt          | 94 -------------------
>>  2 files changed, 92 insertions(+), 94 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml
>> new file mode 100644
>> index 000000000000..07cd67ec97c1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml
>> @@ -0,0 +1,92 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/remoteproc/qcom,glink-rpm-edge.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm G-Link RPM edge
>> +
>> +description: |
>> +  Qualcomm G-Link edge, a FIFO based mechanism for communication with Resource
>> +  Power Manager (RPM) on various Qualcomm platforms.
>> +
>> +maintainers:
>> +  - Bjorn Andersson <andersson@kernel.org>
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,glink-rpm
>> +
>> +  label:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description:
>> +      Name of the edge, used for debugging and identification purposes. The
>> +      node name will be used if this is not present.
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  mboxes:
>> +    items:
>> +      - description: rpm_hlos mailbox in APCS
>> +
>> +  qcom,remote-pid:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      The identifier for the remote processor as known by the rest of the
>> +      system.
>> +
>> +  qcom,rpm-msg-ram:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: |
>> +      RPM message memory resource (compatible:: qcom,rpm-msg-ram).
> 
> '::' is not a thing in YAML.

ack

> 
>> +
>> +  rpm-requests:
>> +    type: object
>> +    $ref: /schemas/soc/qcom/qcom,smd-rpm.yaml#
>> +    unevaluatedProperties: false
>> +    description:
>> +      Qualcomm Resource Power Manager (RPM) over G-Link
>> +
>> +    properties:
>> +      qcom,intents:
>> +        $ref: /schemas/types.yaml#/definitions/uint32-array
>> +        description:
>> +          List of (size, amount) pairs describing what intents should be
> 
> pairs? Sounds like a matrix then.

I'll fix also second appearance of this property
(bindings/soc/qcom/qcom,apr.yaml)

Best regards,
Krzysztof

