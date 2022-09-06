Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8066C54EE9
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Sep 2022 09:43:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239104AbiIFJnI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Sep 2022 05:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239387AbiIFJmq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Sep 2022 05:42:46 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C39007674F
        for <linux-remoteproc@vger.kernel.org>; Tue,  6 Sep 2022 02:42:27 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id e13so14568386wrm.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Sep 2022 02:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=AZx+3K3BoIqYOQf32bjmF5LhfSd1CBJzz3H5OYRrses=;
        b=WW+LgiFVZWKYAY1s0egxDFDVyEeujteQa6G9ahhqfU/Uee6Ye4FG17Go/8iIsxq5Tj
         5EKTFU9qPAi+McU+k4Kjw8LqNU3wpVBfRe7o8LpsFSOIlHrWytu6BUP6M8olFxd77vpP
         5p4dZopHxbbjUn9q3sutXRQ5YAzWe6DGqQ8QN9lQbnMF96Qoybb9qYkBvK9mD0ueO6l3
         v1neSXgW0n/AB0nOZX+LZ8ZZ6w09TWn7dm+9u2NMB0xdSIH642dC+2e+nPl81uHzmMEw
         T7UN3sRg5yUllT6AlWxadli7eilDRloJ9DlIQEnddBtwmAnUlPfHXUz1o+5feaRGwdOr
         e5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=AZx+3K3BoIqYOQf32bjmF5LhfSd1CBJzz3H5OYRrses=;
        b=sr+RHtyP6ikFGUUmyaphOoVD87ivVtXPAMfbHTd4+CvLWpXFMG57Nul54J/hfr+Hqb
         wWGJWHKC8u/dn5DDFzmz0HONTfz87ncUtK+4McSaYlhb03zLECwQlHbG63WzorJ+CH3w
         SqPBneNiTb3396rqmrHi1+4qXQ4jkNeIK4RoEke3dotm+4fQS4pcuGYk1b8rBLGuq/tQ
         3ATBybKghSTya+JShMvBpl9e9/qyJVen2Nd/7UiUM3kS92BepvNxLeMjrUGx4cnnjcWm
         0Azj1Y0BHW6cNEBxDJB4WqI0SzRjWH0TIJfKWQ4rjmzMwNG8/b/ywmQ4qztI5mgq6jLS
         yOPA==
X-Gm-Message-State: ACgBeo2dhVxdvC2f3+Mm8j9OmOwS4kXBQM1SXDFpFiNM+kx7gGCHl8dT
        Xx+kqq3azGu73Emd6Ux7ze4LCw==
X-Google-Smtp-Source: AA6agR4EN0Y+AtIIiMTu9ibUaomfMjFMz3Urbiy/6AlyQYadUGfPzqeqjDWoXYD8THtJGNTUuAeIWw==
X-Received: by 2002:a5d:6483:0:b0:226:db59:2f94 with SMTP id o3-20020a5d6483000000b00226db592f94mr23082304wri.200.1662457332102;
        Tue, 06 Sep 2022 02:42:12 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v13-20020a5d678d000000b00228a45eb045sm5020774wru.109.2022.09.06.02.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 02:42:11 -0700 (PDT)
Date:   Tue, 6 Sep 2022 12:42:10 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v8 1/2] dt-bindings: misc: fastrpc convert bindings to
 yaml
Message-ID: <YxcV8kAQoqr6Bs1X@linaro.org>
References: <20220906092415.1989720-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906092415.1989720-1-abel.vesa@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 22-09-06 12:24:14, Abel Vesa wrote:
> Convert Qualcomm FastRPC bindings to yaml format, so that we could validate
> dt-entries correctly and any future additions can go into yaml format.
> 
> Use compute-cb@ subnodes instead of just cb@. Add qcom,glink-channels and
> qcom,smd-channels missing properties to make sure dtbs_check doesn't fail
> right off the bat. Correct the name of the parent node in the example from
> smd-edge to glink-edge.
> 
> Also change the file extension referenced in bindings
> remoteproc/qcom,glink-edge.yaml from txt to yaml.
> 
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> 

...

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
> index fa69f7b21eed..170b0601839a 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
> @@ -25,7 +25,7 @@ properties:
>    fastrpc:
>      type: object
>      description:
> -      See Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
> +      See Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml

On a second thought, this should be a $ref now that is yaml.

Will resend.

>  
>    interrupts:
>      maxItems: 1
> -- 
> 2.34.1
> 
