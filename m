Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311B1C54EE9
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Sep 2022 15:06:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiITPGc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Sep 2022 11:06:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbiITPG3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Sep 2022 11:06:29 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C167213DD9
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Sep 2022 08:06:27 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id f14so4299338lfg.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Sep 2022 08:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=p4P0NeQ+Hs0UhBCJIe2tPG1fmTf8Df505EFaHwu7878=;
        b=NDTTn3LJdGo55R3e01AcgjrRXfHlQQm0T3o9ZEjVZ5hJvJd5cgDrOpjtPQ+GT9oBzd
         domJ+l5Aqw8+AoTPiZg2c9wwWuiVn15QKaE97F69i/knxCLqmswttrvL7UQ8/y9SZ44X
         DyDXo9cdOnKqW0z2bj0KnZAusB31jfwWS13thxjyHiEb+J22KBg/7ge6fbuL7BMDnOQo
         uVpPqQtEuojB8oSA068Qasf9FSnnUx6QMzqWOA8IT6OZwwSJ8IA33UTJc58tgJ4KUY0D
         a2ChbpPFpcu3PlWRQMDtT9u0jC350YcCBVo/8Zcym69E25pKih7UHltEQrMiuYo/68q1
         Ch6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=p4P0NeQ+Hs0UhBCJIe2tPG1fmTf8Df505EFaHwu7878=;
        b=bZfQ1o/y3htdLMREsNJ2LkyN8hEJ8Z7ka3UdKrGBuU2KyyKEfV6RerYxRpeCW5Zdhs
         +g4f+MJyeJoHJJ95DiWnxykKX8TuwFV1EiKhbQ2mZwTy1c1doLMwvjwg/47CJlACZHsk
         jSzyKpQVhvy2EXBcf9o5epeGgcBvm+xYLod51Ry2pH79KR5XGCxrBBmvDjDz7zKcGBYL
         hyC+5+iYktg4pCXg7XvZi0i6g6vWqmpAymWx394ZplnQoLZd2McXSarFTf/DWmtNRIO7
         hYNTq9eRXEJugg+5XaKaRn1/7jqqGWUa6lc5HZVN9Tz45ksquPoSinkijLrWZbmHL0qh
         ZHgQ==
X-Gm-Message-State: ACrzQf0ZZpvH6XPLu4wyYssyjnvQiTMOddaW80ki0TtGn6lWBsmQDuTg
        /lRWpPk5gtH+QNp7xe6Ayv2Vyw==
X-Google-Smtp-Source: AMsMyM5ATrQusUgyRLPhm8i+Xxz0V5beQbLVoUmOUwfeMSPV01vAXnRs9x5CHLxEWRXyIl5pvXZzww==
X-Received: by 2002:a19:7406:0:b0:49d:d448:59c3 with SMTP id v6-20020a197406000000b0049dd44859c3mr7932629lfe.300.1663686385856;
        Tue, 20 Sep 2022 08:06:25 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s9-20020a056512202900b00493014c3d7csm339824lfs.309.2022.09.20.08.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 08:06:25 -0700 (PDT)
Date:   Tue, 20 Sep 2022 17:06:23 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     quic_plai@quicinc.com, agross@kernel.org,
        quic_rohkumar@quicinc.com, swboyd@chromium.org, tiwai@suse.com,
        broonie@kernel.org, bgoswami@quicinc.com, perex@perex.cz,
        devicetree@vger.kernel.org, srinivas.kandagatla@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, lgirdwood@gmail.com, andersson@kernel.org,
        judyhsiao@chromium.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 1/8] dt-bindings: remoteproc: qcom: Add SC7280 ADSP
 support
Message-ID: <20220920150623.rhpeizf7ufkwqz2i@krzk-bin>
References: <1663655359-1402-1-git-send-email-quic_srivasam@quicinc.com>
 <1663655359-1402-2-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1663655359-1402-2-git-send-email-quic_srivasam@quicinc.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 20 Sep 2022 11:59:12 +0530, Srinivasa Rao Mandadapu wrote:
> Add ADSP PIL loading support for SC7280 SoCs.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
> Changes since V6:
> 	-- Update glink-edge property.
> 	-- Add qcom,qmp property.
> Changes since V5:
> 	-- Remove qcom,adsp-memory-regions property.
> Changes since V4:
> 	-- Update halt registers description in dt bindings.
>  .../bindings/remoteproc/qcom,sc7280-adsp-pil.yaml  | 226 +++++++++++++++++++++
>  1 file changed, 226 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml: properties:glink-edge:properties:qcom,remote-pid:maxItems: False schema does not allow 1
	hint: Scalar properties should not have array keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml: ignoring, error in schema: properties: glink-edge: properties: qcom,remote-pid: maxItems
Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.example.dtb:0:0: /example-0/remoteproc@3000000: failed to match any schema with compatible: ['qcom,sc7280-adsp-pil']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
