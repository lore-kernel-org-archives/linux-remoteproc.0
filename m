Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A98C53210
	for <linux-remoteproc@archiver.kernel.org>; Fri,  6 Jan 2023 01:09:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236642AbjAFBJ1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 Jan 2023 20:09:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236622AbjAFBJX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Jan 2023 20:09:23 -0500
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8200872D0D
        for <linux-remoteproc@vger.kernel.org>; Thu,  5 Jan 2023 17:09:18 -0800 (PST)
Received: by mail-il1-x12e.google.com with SMTP id y2so439619ily.5
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Jan 2023 17:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a25YKiMypj1O1dkTeTf+41PYk2LkMRy8jApaMHcF3hQ=;
        b=GfxYAaRQLGPOFoa26ErjjUE1UpmyQRlEngmnyE784ps7wQu+AricDPJa32a22yCALt
         MhTCHBUleQASsrn09sMtfYq+H7L60n1dUwQJXnti6/CBbWRriMiw0gwrC/O9nGYfNf80
         VtBY32mpB98Hg5zawDJAzkbyNAKgHVFOwTbtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a25YKiMypj1O1dkTeTf+41PYk2LkMRy8jApaMHcF3hQ=;
        b=fXC9LfzFkhsh3YNUYQGWATsQmr3yr2K51tZPZgUxQ4h2TzN/3MYiief3ro8ARkuQoL
         h3v8TXzAom1EWMf9NLO2lgWYci5OEaPIhLNIBNWPyyAADN+tzTQEjKxh2Eds82Sc4hCT
         diMh1Lfg+FsY/iYjbAJuGvsNlbeYB/xsweGdoALkXtgGOJv4t1D3thaFzsMos4+c+aBD
         9iu2DMoebExnVrykepxRbwa2pYsY4WvV4FKy+NTMpLaMJgEs+UIao/bY1lEfzrozWFB+
         LeYDvPoUlNbuweNNZCn9/PYCgC4DhQC1pLFlRSslCoLVRKHwM++O0PINgQ/y0Mh9R+Fw
         fpdQ==
X-Gm-Message-State: AFqh2kozV5tLw0fLwD2iXZ2WXI3+aUKTOZHaz53dDmkfA39XDz9feSj0
        6i0fSPRhXV7hDetWyK/ViSlQKw==
X-Google-Smtp-Source: AMrXdXsIxoPdIf7iemjPcehOoQbWhnzgHIYcO03uSrBdXX69Tjy1MRwwWy0vr8DbtCAKgqVNGwRwdw==
X-Received: by 2002:a92:b10:0:b0:302:364f:68f4 with SMTP id b16-20020a920b10000000b00302364f68f4mr36470087ilf.17.1672967357902;
        Thu, 05 Jan 2023 17:09:17 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id i2-20020a023b42000000b0039e0a7bf3a2sm5385077jaf.179.2023.01.05.17.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 17:09:17 -0800 (PST)
Date:   Fri, 6 Jan 2023 01:09:17 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     linux-remoteproc@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org, devicetree@vger.kernel.org,
        krzysztof.kozlowski@linaro.org, mathieu.poirier@linaro.org,
        corbet@lwn.net
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom: Add reg-names and
 power-domain-names
Message-ID: <Y7d0vcAwNDsZouWF@google.com>
References: <1672924363-22938-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1672924363-22938-1-git-send-email-quic_srivasam@quicinc.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Jan 05, 2023 at 06:42:43PM +0530, Srinivasa Rao Mandadapu wrote:

> Subject: dt-bindings: remoteproc: qcom: Add reg-names and power-domain-name

For all qcom remoteprocs?

Please make it clear in the subject that this is for sc7280-adsp-pil.

> Add reg-names and power-domain-names for remoteproc ADSP pheripheral
> loader. This is to make compatible with remoteproc ADSP PIL driver.
> Also change power domain from LCX to CX.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml  | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml
> index 94ca7a0..b5bee2c 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml
> @@ -23,6 +23,11 @@ properties:
>        - description: qdsp6ss register
>        - description: efuse q6ss register
>  
> +  reg-names:
> +    items:
> +      - const: qdsp6ss_base
> +      - const: lpass_efuse
> +
>    iommus:
>      items:
>        - description: Phandle to apps_smmu node with sid mask
> @@ -57,7 +62,11 @@ properties:
>  
>    power-domains:
>      items:
> -      - description: LCX power domain
> +      - description: CX power domain
> +
> +  power-domain-names:
> +    items:
> +      - const: cx
>  
>    resets:
>      items:
> -- 
> 2.7.4
> 
