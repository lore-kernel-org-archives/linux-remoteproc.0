Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B20ECAAD8
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Sep 2022 08:21:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231439AbiITIV3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Sep 2022 04:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbiITIUQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Sep 2022 04:20:16 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAAF45599
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Sep 2022 01:18:57 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id a10so2131151ljq.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Sep 2022 01:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=N+juPwhYXygoVLZ5FwCYsXkZBxWv1f+ksi4NS5ClCSk=;
        b=GIjpafKjmVIE02NDvn8jJD5yEpoRMt7fvlEC/QrNMJfTY18eQpR3fptNS5H06EsgnY
         jGEj5W2D4t539YId8TVn+5bUEQlTf9kwKrXC9b2v6V4LjbClPdVxT3BvJcZIIzCkoFAx
         E/w2YP6dLrkPT9+Mo/+blcg7qW9y3bmMFbdNd+jxng00rGrxkMVblg8y1f0iyMKYH5U/
         /jWJUfnUpDN7EVe6XrxXJHeLVsVggp/MdNqeefbY2ByshZT52LTWAhlcblrbLgqqu8/n
         1tkj7+SZbh60RlVwX7l7X7ruFLwCqpwLIfjivdW8RDcZIHbf0QBac9jIPLeOpzEA0sgL
         dU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=N+juPwhYXygoVLZ5FwCYsXkZBxWv1f+ksi4NS5ClCSk=;
        b=v8qDhojIuXwAmZ10uHV0kMWfSdCYH4lNBLhlfOVNLjz8IPBowJ5FBt9ajQeEcuvUDB
         V87cbl+6J85V02YCxbNoTVDykMUUPuiGIdMrXeA5sUUPiGJZXA76dv5J3Qii0xhkUWPu
         ijxakzbSb2Gak2z+CKtDw/X8rV0dXM/hd62Xt0NwgTEMR8WHpELymxi/W4EyFeHU45Dh
         OGvjpmEkC8mCc2NCfiVL72qm0hoiofdX5qZX6YM+SiTxavhG96X5ggl+ihDMS4kkN/PK
         5EZqydrzgTXqKZmU3/uGNAZk2KM6xnoa/DtpI9+XYRjNw0g3u0+rdHPL0PQVTefLQyyi
         eblg==
X-Gm-Message-State: ACrzQf1OiuOdNlei8CbBbyLKNecGWM3LBhtdyDE1hh2RgltgcvQ0ovpT
        vJxrHxtmqMiFzqDqRUKXmnIqXQ==
X-Google-Smtp-Source: AMsMyM7t7rB1wfZCVKbIzHcTfNTU/VZVxlfoar57U8XOg0YONc2uBqrv0baYybgTz5uENGKttyDiuw==
X-Received: by 2002:a2e:84ca:0:b0:25d:77e0:2566 with SMTP id q10-20020a2e84ca000000b0025d77e02566mr6839607ljh.78.1663661936144;
        Tue, 20 Sep 2022 01:18:56 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id j10-20020ac2550a000000b0049a747d6156sm185928lfk.287.2022.09.20.01.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 01:18:55 -0700 (PDT)
Date:   Tue, 20 Sep 2022 10:18:53 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sireesh Kodali <sireeshkodali1@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, andersson@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: remoteproc: qcom: Convert wcnss
 documentation to YAML
Message-ID: <20220920081853.3rzq7wo6rnpao6p5@krzk-bin>
References: <20220920030316.1619781-1-sireeshkodali1@gmail.com>
 <20220920030316.1619781-3-sireeshkodali1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220920030316.1619781-3-sireeshkodali1@gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 20 Sep 2022 08:33:14 +0530, Sireesh Kodali wrote:
> This is a direct conversion of the existing txt documentation to YAML.
> It is in preparation for the addition of pronto-v3 to the docs. This
> patch doesn't document any of the existing subnodes/properties that are
> not documented in the existing txt file. That is done in a separate
> patch.
> 
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
> ---
>  .../bindings/remoteproc/qcom,wcnss-pil.txt    | 177 ------------
>  .../bindings/remoteproc/qcom,wcnss-pil.yaml   | 267 ++++++++++++++++++
>  2 files changed, 267 insertions(+), 177 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.example.dtb: pronto@a21b000: compatible: ['qcom,pronto-v2-pil', 'qcom,pronto'] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.example.dtb:0:0: /example-0/pronto@a21b000: failed to match any schema with compatible: ['qcom,pronto-v2-pil', 'qcom,pronto']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
