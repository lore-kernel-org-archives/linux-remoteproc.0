Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82C3CE7B1E
	for <linux-remoteproc@archiver.kernel.org>; Thu, 28 Sep 2023 19:31:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbjI1TbX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 28 Sep 2023 15:31:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjI1TbW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 28 Sep 2023 15:31:22 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99E741A1
        for <linux-remoteproc@vger.kernel.org>; Thu, 28 Sep 2023 12:31:20 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c453379020so100161745ad.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 28 Sep 2023 12:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695929480; x=1696534280; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yiM835Qdr8r3YY1MsttP3YD4WAnIIepGWpUnlhXauk8=;
        b=qrRtX/iHC6Fhouk/Fk5b/cGsYjqc7q9ekjy1zaQAg8icBWDg+Ylf6qq/1fIt1iSMdB
         LHprXqVC1daW8xqjH/FXTPU0pgfSe3h6m0mHUVdDKZ/oVwQoXca4INuLHoCPhhErflxj
         u6Dz8c+yHn+2A3OuyrmyxdjPC+FbgvRAH0bNphzOVgfilEU0nqu6MgrUHbErGE9epNTe
         F/bZ6WBwmGkGD+wr8JSnLz7bQrlL++3PFBKGPNzZhwW/BV0UWEGOBzwr+y3WG1+VuMBp
         G4jkxYu1v7pIx7Ml1XWPCJpAEn/3bqTTXp8p2NsutIdptnkmbjS+gFyEwvJr/k8ugJlY
         iPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695929480; x=1696534280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiM835Qdr8r3YY1MsttP3YD4WAnIIepGWpUnlhXauk8=;
        b=HwQXW7jd1TMYlrl6X5mXIYeFS4pjre1SVKS7wgBmlaRm3+9mLzCD2+HwxzeN+zDXem
         xe5p+fVsay2DYUud46GbvvJwWopMTIeV5nRwymBLVx+vI/uBe4Ibf2fZyZGaaJaEUx1a
         44Hi2hOacRPMtn+YWY/KWyB0jIV8NJXG56XdQKhnSu0HkPcAmTky5HI95ZWBNDIBpxhF
         EHSW9wSkEYo2vy1F/VQfTFvgvMY0hzozA5TdkajG6lcX/94CCNlbOFLxPNOrRqCKp2e8
         z7NDfeHSBs6opkpiGEkPy9uNeFd3IXtTGtm/zoKG1VNTo480J0qIff4RBZ3I5Or6X106
         3dxQ==
X-Gm-Message-State: AOJu0Yw8+48/ij3ycVPFyQ6XRp+lvp7nxya8OmfVTLyBgtNt7Hl5L/ih
        sBioFPDEy/gTCVzT30Sn6R2iBA==
X-Google-Smtp-Source: AGHT+IE95MGmqksj4rnPsJlhQcIbTza6nvpDZ3jVQORmb3wxwujuxwIunVo313zxNSIjjCOnvIToSQ==
X-Received: by 2002:a17:902:8649:b0:1c3:1f0c:fb82 with SMTP id y9-20020a170902864900b001c31f0cfb82mr1816980plt.41.1695929480038;
        Thu, 28 Sep 2023 12:31:20 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:46f7:63a8:c7b8:44bb])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902c1c400b001bf8779e051sm7236931plc.289.2023.09.28.12.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 12:31:19 -0700 (PDT)
Date:   Thu, 28 Sep 2023 13:31:17 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: remoteproc: mtk,scp: Add missing
 additionalProperties on child node schemas
Message-ID: <ZRXUhSqHPt9R5Zd8@p14s>
References: <20230926164513.101958-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230926164513.101958-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Rob,

On Tue, Sep 26, 2023 at 11:45:08AM -0500, Rob Herring wrote:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present for any node.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index 895415772d1d..24422fd56e83 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -91,6 +91,7 @@ allOf:
>  
>  additionalProperties:
>    type: object
> +  additionalProperties: false

Things have changed in the remoteproc tree [1] and this patch doesn't apply.
Please see if it is still needed.

Thanks,
Mathieu

[1]. https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml?h=rproc-next#n80

>    description:
>      Subnodes of the SCP represent rpmsg devices. The names of the devices
>      are not important. The properties of these nodes are defined by the
> -- 
> 2.40.1
> 
