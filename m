Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131C2C4338F
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Aug 2021 21:31:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD81D60F4B
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Aug 2021 21:31:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232419AbhHBVbx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Aug 2021 17:31:53 -0400
Received: from mail-io1-f53.google.com ([209.85.166.53]:44608 "EHLO
        mail-io1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231764AbhHBVbu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Aug 2021 17:31:50 -0400
Received: by mail-io1-f53.google.com with SMTP id l18so21951769ioh.11;
        Mon, 02 Aug 2021 14:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LMgRhy6hctyBbGDHOH8RGjk1VRc0Fj5vVUTdjQrtcow=;
        b=Vizcz5DHGttd9ozYCyDQwTIQ251faqkHZucVMeFZHM5G9Fz2W8b6wRI8yv92neCmBJ
         xZMRF0/h4DlZkuh0jOtKTBk9DQS2XsxnkURHSl9/fMTcUTyX72LodzVcnz2l9mqYrfJ1
         fYsESzoyeyRkeXDQkvHTzPcmC/HRpFvTy0VA6TzRSJwkBSJN3cmx9kST7TCD45h6zMLy
         2Hf6erSJVoPBdpuDMncmKDxtoim7x2O39Kdyp4n9yLCZvvGZD8QwOQtG5N+qZ5xBkJJq
         szm1X3loOb3nyWn1s5DeCDZnVFEMT+WVsO0967tgi3+IcfuPWdG1zdb9Hvq7db3h0ela
         BwjA==
X-Gm-Message-State: AOAM530vy7Ad4FiqSQ0YlSxzMO0Y+GvNV5u5fCihRCRns9plorIrdMlA
        ZZhIsR38h/R0mXANpAxfhA==
X-Google-Smtp-Source: ABdhPJywEL177WRcsNGDOmEHk8cW91nV9jDwHkmis2MuSxnkUqZhe3Xrb96xaRz1m2dBieNoHMa85A==
X-Received: by 2002:a05:6602:218c:: with SMTP id b12mr1423523iob.82.1627939899489;
        Mon, 02 Aug 2021 14:31:39 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id g26sm7835048ioh.48.2021.08.02.14.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 14:31:38 -0700 (PDT)
Received: (nullmailer pid 1650185 invoked by uid 1000);
        Mon, 02 Aug 2021 21:31:37 -0000
Date:   Mon, 2 Aug 2021 15:31:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tinghan Shen <tinghan.shen@mediatek.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, matthias.bgg@gmail.com,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        srv_heupstream@mediatek.com, tzungbi@google.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4 3/4] dt-bindings: remoteproc: mediatek: Convert
 mtk,scp to json-schema
Message-ID: <YQhkOSEP0PAN9rY7@robh.at.kernel.org>
References: <20210728035859.5405-1-tinghan.shen@mediatek.com>
 <20210728035859.5405-4-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728035859.5405-4-tinghan.shen@mediatek.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jul 28, 2021 at 11:58:58AM +0800, Tinghan Shen wrote:
> Convert the mtk,scp binding to DT schema format using json-schema.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../bindings/remoteproc/mtk,scp.txt           | 41 ---------
>  .../bindings/remoteproc/mtk,scp.yaml          | 85 +++++++++++++++++++
>  2 files changed, 85 insertions(+), 41 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
> deleted file mode 100644
> index 88f37dee7bca..000000000000
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -Mediatek SCP Bindings
> -----------------------------------------
> -
> -This binding provides support for ARM Cortex M4 Co-processor found on some
> -Mediatek SoCs.
> -
> -Required properties:
> -- compatible		Should be one of:
> -				"mediatek,mt8183-scp"
> -				"mediatek,mt8192-scp"
> -				"mediatek,mt8195-scp"
> -- reg			Should contain the address ranges for memory regions:
> -			SRAM, CFG, and L1TCM.
> -- reg-names		Contains the corresponding names for the memory regions:
> -			"sram", "cfg", and "l1tcm".
> -- clocks		Required by mt8183 and mt8192. Clock for co-processor
> -			(See: ../clock/clock-bindings.txt)
> -- clock-names		Required by mt8183 and mt8192. Contains the
> -			corresponding name for the clock. This should be
> -			named "main".
> -
> -Subnodes
> ---------
> -
> -Subnodes of the SCP represent rpmsg devices. The names of the devices are not
> -important. The properties of these nodes are defined by the individual bindings
> -for the rpmsg devices - but must contain the following property:
> -
> -- mtk,rpmsg-name	Contains the name for the rpmsg device. Used to match
> -			the subnode to rpmsg device announced by SCP.
> -
> -Example:
> -
> -	scp: scp@10500000 {
> -		compatible = "mediatek,mt8183-scp";
> -		reg = <0 0x10500000 0 0x80000>,
> -		      <0 0x105c0000 0 0x5000>;
> -		reg-names = "sram", "cfg";
> -		clocks = <&infracfg CLK_INFRA_SCPSYS>;
> -		clock-names = "main";
> -	};
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> new file mode 100644
> index 000000000000..dc5fcbe65dae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek SCP Bindings
> +
> +maintainers:
> +  - Tinghan Shen <tinghan.shen@mediatek.com>
> +
> +description:
> +  This binding provides support for ARM Cortex M4 Co-processor found on some
> +  Mediatek SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8183-scp
> +      - mediatek,mt8192-scp
> +      - mediatek,mt8195-scp
> +
> +  reg:
> +    description: |
> +      Should contain the address ranges for memory regions SRAM and CFG,
> +    maxItems: 2
> +
> +  reg-names:
> +    description: |
> +      Contains the corresponding names for the two memory regions. These
> +      should be named "sram", "cfg".
> +
> +  clocks:
> +    description: |
> +        Clock for co-processor (see ../clock/clock-bindings.txt).
> +        Required by mt8183 and mt8192.
> +    maxItems: 1
> +
> +  clock-names:
> +    description: |
> +      Contains the corresponding name for the clock. This should be
> +      named "main". Required by mt8183 and mt8192.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +
> +patternProperties:
> +  ".*":
> +    if:
> +      type: object
> +    then:

This can be replaced with:

additionalProperties:
  type: object
  ... and the rest below here:

> +      description:
> +        Subnodes of the SCP represent rpmsg devices. The names of the devices
> +        are not important. The properties of these nodes are defined by the
> +        individual bindings for the rpmsg devices.
> +
> +      properties:
> +        mtk,rpmsg-name:
> +          description:
> +            Contains the name for the rpmsg device. Used to match
> +            the subnode to rpmsg device announced by SCP.
> +
> +      required:
> +        - mtk,rpmsg-name
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        scp: scp@10500000 {

Drop unused labels.

> +            compatible = "mediatek,mt8183-scp";
> +            reg = <0 0x10500000 0 0x80000>,
> +                  <0 0x105c0000 0 0x5000>;
> +            reg-names = "sram", "cfg";
> +            clocks = <&infracfg CLK_INFRA_SCPSYS>;
> +            clock-names = "main";
> +        };
> +    };
> -- 
> 2.18.0
> 
> 
