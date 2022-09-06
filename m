Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3721CC6FA89
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Sep 2022 13:44:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233220AbiIFNox (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Sep 2022 09:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239802AbiIFNoR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Sep 2022 09:44:17 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 159B1167C6
        for <linux-remoteproc@vger.kernel.org>; Tue,  6 Sep 2022 06:38:24 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id bq23so17426814lfb.7
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Sep 2022 06:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=FGAfxfKkRHB1+X0nCoIOj+4WDFCTsP9pFx1QUjl0ojo=;
        b=TCoSn7XllxmcxPyXUK0Yq6xbut+KHwhEbX5ZXXeVyi/8gY0yaT4VPWQHHFQXKgAndR
         4cz6x8VoZOV1gE/xw1c87r2ADFglq7VfiwsiQ8Qh2OZD6JUz/L1sc2R/5Atq1cUV63Q4
         XztDpPScZWzUMEc125vzMhKWN8ntso84iAruq9VXpLbIAUAFR2f4Yja6mmDASXNpTmvF
         yMxtjPptL2QPFnbLcE3LRrJZX5fzL0Fvg7np/sF7rL9PwrViL8asNvisWANHHEdVP44l
         T63OtqU75JCCN0Yl0uIAaV3lLZSSwhENj7SS9RVWYw4Q1THU9WJ2K7UVwCZxIYEfKBh0
         ag5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FGAfxfKkRHB1+X0nCoIOj+4WDFCTsP9pFx1QUjl0ojo=;
        b=Gm8Lx0UvkHQlRYbUoALS3P2MlxpvOnFr9bhBp17Vr3FoL93M24VJbTbEEj2Wenh4mS
         cNIEpw1DvEDpjK13bjwJi0J+wtbgXlz8MBKX871dcIJOajd94/hfj0o5S5GS+h5s4lkz
         5NhOaASK3jXHaGNXaG08uj+AfYjw+C3/mrETu3AiiigU1mFi7WwkY6vUnzQwb+8ajusk
         7nHWSLIar8VwAjW8vS/8de/Xg1qdR1eV8vLwQhk6KQR4hj4BZGt0K74GZlvzrGQ8byBS
         UlBV98FxNUMhkwfFEkyDLjZojWqmvkI8tYwiyD9Y5DIoVD0EBX2hCQfkhELjPM1iNgXK
         2V1g==
X-Gm-Message-State: ACgBeo0JfbM9boFK0b7KbMN+QWGNxbqAtMoNvrGvC85bbmEurqQVGNyK
        hKAvKuLXhG4KHspP98wdYEYlijVCZvSHgA==
X-Google-Smtp-Source: AA6agR7HMt3jRxYYr9GL/hcqPDjHGt8Ar/eDNQEVMoo6SnPFOm6tb5f9djjtp5Cc2fNPQL7mElqpyg==
X-Received: by 2002:a05:6512:168d:b0:491:3206:b63 with SMTP id bu13-20020a056512168d00b0049132060b63mr17167580lfb.149.1662471431549;
        Tue, 06 Sep 2022 06:37:11 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id r1-20020a2e8e21000000b0026ac3fedd20sm144706ljk.86.2022.09.06.06.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 06:37:10 -0700 (PDT)
Message-ID: <5fcc52c1-8124-7099-1373-4ca6482ff911@linaro.org>
Date:   Tue, 6 Sep 2022 15:37:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v10] dt-bindings: misc: fastrpc convert bindings to yaml
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
References: <20220906111930.2684225-1-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906111930.2684225-1-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 06/09/2022 13:19, Abel Vesa wrote:
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
> ---
> 
> Changes since v9:
>  * squashed to the MAINTAINERS file update to not break the
>    bisectability, as Krzysztof suggested.
> 
>  .../devicetree/bindings/misc/qcom,fastrpc.txt |  88 -------------
>  .../bindings/misc/qcom,fastrpc.yaml           | 123 ++++++++++++++++++
>  .../bindings/remoteproc/qcom,glink-edge.yaml  |   4 +-
>  MAINTAINERS                                   |   2 +-
>  4 files changed, 126 insertions(+), 91 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
>  create mode 100644 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt b/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
> deleted file mode 100644
> index 5ec124b138a6..000000000000
> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
> +++ /dev/null
> @@ -1,88 +0,0 @@
> -Qualcomm Technologies, Inc. FastRPC Driver
> -
> -The FastRPC implements an IPC (Inter-Processor Communication)
> -mechanism that allows for clients to transparently make remote method
> -invocations across DSP and APPS boundaries. This enables developers
> -to offload tasks to the DSP and free up the application processor for
> -other tasks.
> -
> -- compatible:
> -	Usage: required
> -	Value type: <stringlist>
> -	Definition: must be "qcom,fastrpc"
> -
> -- label
> -	Usage: required
> -	Value type: <string>
> -	Definition: should specify the dsp domain name this fastrpc
> -	corresponds to. must be one of this: "adsp", "mdsp", "sdsp", "cdsp"
> -
> -- qcom,non-secure-domain:
> -	Usage: required
> -	Value type: <boolean>
> -	Definition: Property to specify that dsp domain is non-secure.
> -
> -- qcom,vmids:
> -	Usage: optional
> -	Value type: <u32 array>
> -	Definition: Virtual machine IDs for remote processor.
> -
> -- #address-cells
> -	Usage: required
> -	Value type: <u32>
> -	Definition: Must be 1
> -
> -- #size-cells
> -	Usage: required
> -	Value type: <u32>
> -	Definition: Must be 0
> -
> -= COMPUTE BANKS
> -Each subnode of the Fastrpc represents compute context banks available
> -on the dsp.
> -- All Compute context banks MUST contain the following properties:
> -
> -- compatible:
> -	Usage: required
> -	Value type: <stringlist>
> -	Definition: must be "qcom,fastrpc-compute-cb"
> -
> -- reg
> -	Usage: required
> -	Value type: <u32>
> -	Definition: Context Bank ID.
> -
> -- qcom,nsessions:
> -	Usage: Optional
> -	Value type: <u32>
> -	Defination: A value indicating how many sessions can share this
> -		    context bank. Defaults to 1 when this property
> -		    is not specified.
> -
> -Example:
> -
> -adsp-pil {
> -	compatible = "qcom,msm8996-adsp-pil";
> -	...
> -	smd-edge {
> -		label = "lpass";
> -		fastrpc {
> -			compatible = "qcom,fastrpc";
> -			qcom,smd-channels = "fastrpcsmd-apps-dsp";
> -			label = "adsp";
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			cb@1 {
> -				compatible = "qcom,fastrpc-compute-cb";
> -				reg = <1>;
> -			};
> -
> -			cb@2 {
> -				compatible = "qcom,fastrpc-compute-cb";
> -				reg = <2>;
> -			};
> -			...
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> new file mode 100644
> index 000000000000..7f43b37bb2e1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm FastRPC Driver
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +description: |
> +  The FastRPC implements an IPC (Inter-Processor Communication)
> +  mechanism that allows for clients to transparently make remote method
> +  invocations across DSP and APPS boundaries. This enables developers
> +  to offload tasks to the DSP and free up the application processor for
> +  other tasks.
> +
> +properties:
> +  compatible:
> +    items:

Nothing improved here since my feedback. I other places also missed some
of my feedback.


Best regards,
Krzysztof
