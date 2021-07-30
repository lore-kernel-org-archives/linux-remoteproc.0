Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB93DC4338F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Jul 2021 15:56:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF56A60E93
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Jul 2021 15:56:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbhG3P4R (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 30 Jul 2021 11:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231722AbhG3P4P (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 30 Jul 2021 11:56:15 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A4BDC0613C1
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jul 2021 08:56:11 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id o2-20020a9d22020000b0290462f0ab0800so9953096ota.11
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jul 2021 08:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Xg5LLOd+ZVZa0FCK1UJtEwXy6lwS6Y0I8bC/j0Z8unY=;
        b=YjwloqPi6qyqga2J8/GuErJH/XkpjZIRsODaSYhBoqd7SS1QKQEabbwKJCX24Vf1Yn
         xJ4AipDGXaWEmwrtHSY8u7nSYP75B05IXUn3l92wuWJdjJeNyfIRfiOWGljf5rUPrEfR
         SvI/aARaRS69Cx+svmYrLRozh2Ol0qIAB/mmjQtv/EUJHvdnT+nrjE39MnMOT2n6La7q
         lezB4kG3b4KLJ8ThIbjU4PKXphn58UwJGSXRgWwzDcWmWWn/ddj2Fm370NpjrFUMFDUt
         ceDAapf+xsxeiuvKWmMnf9au3FzChHLBw7V7aArnyWBFPZowIZaFjELkDJHIuXQJGxnX
         TFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xg5LLOd+ZVZa0FCK1UJtEwXy6lwS6Y0I8bC/j0Z8unY=;
        b=Us9aOWt9YNCCPk6CXQBHHhNbh2pr93oD5mEShQ+r2X3P65DOFzJTiVfix9Nxk7PLej
         QgtjlOYUQzvAZ1Qvd1lDmic4ahr6Eg/yuycqcrWwvadtEkdS4I7Pc99AF7t7ZCtPKxU2
         dIKnkOOis8ToJyhz9a3wBtXf/xOYISSzVgA0eKOyVvKDJitGnGEnzf0/N4YAcl0+FSA7
         kg9nvZDf5BVsJGX8zJJVuYv8cDM6d1MoRx5q6YHfZH6Z498Us1GQ4IJOiFVYK8oGfLHs
         cUlptP20EFZ1NH2VJLp4kP7h8VBSlCIHK8sH/21Vj0yp/Uv7PvARSgQCWC52UdGxfZIm
         TiSA==
X-Gm-Message-State: AOAM531rapervA+kY5NwroCQ4GoDAOEw+Z7hmVl/TlIkTIIbqbVF1qio
        mTr0YqDgWCu9OUykJ4PbPU2iWQ==
X-Google-Smtp-Source: ABdhPJxQU7cVaBcuwAUjW5jYV/z2bowE9LH3Fqf1isF2WVeMYXsNhH1VdmY3+EpLQvuU3iYOTUSq9Q==
X-Received: by 2002:a05:6830:1c65:: with SMTP id s5mr2542557otg.256.1627660570521;
        Fri, 30 Jul 2021 08:56:10 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t7sm353447otl.25.2021.07.30.08.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 08:56:09 -0700 (PDT)
Date:   Fri, 30 Jul 2021 10:56:08 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Tinghan Shen <tinghan.shen@mediatek.com>
Cc:     ohad@wizery.com, mathieu.poirier@linaro.org, robh+dt@kernel.org,
        matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        srv_heupstream@mediatek.com, tzungbi@google.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4 3/4] dt-bindings: remoteproc: mediatek: Convert
 mtk,scp to json-schema
Message-ID: <YQQhGNeT/A5NLjdz@builder.lan>
References: <20210728035859.5405-1-tinghan.shen@mediatek.com>
 <20210728035859.5405-4-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728035859.5405-4-tinghan.shen@mediatek.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 27 Jul 22:58 CDT 2021, Tinghan Shen wrote:

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

The '|' means that you want to preserve the formatting of the text
segment, there's no need for that.

> +      Should contain the address ranges for memory regions SRAM and CFG,
> +    maxItems: 2
> +
> +  reg-names:
> +    description: |
> +      Contains the corresponding names for the two memory regions. These
> +      should be named "sram", "cfg".

  reg-names:
    items:
      - sram
      - cfg

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

  clock-names:
    const: main

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names

The old binding, and the comment about clocks above, says that clocks
and clock-names are required for mt8183 and mt8192.

> +
> +patternProperties:
> +  ".*":
> +    if:
> +      type: object
> +    then:
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

What additional properties do you expect?

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8183-clk.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;

Skip soc and the two #-cells, and rewrite the reg to only use 1 address
and size-cell.

> +        scp: scp@10500000 {

The label doesn't add value in the example, please skip this.

> +            compatible = "mediatek,mt8183-scp";
> +            reg = <0 0x10500000 0 0x80000>,
> +                  <0 0x105c0000 0 0x5000>;
> +            reg-names = "sram", "cfg";
> +            clocks = <&infracfg CLK_INFRA_SCPSYS>;
> +            clock-names = "main";

Can you please also add a subnode, to capture that part of the binding
as well?

Regards,
Bjorn

> +        };
> +    };
> -- 
> 2.18.0
> 
