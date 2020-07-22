Return-Path: <SRS0=Av4F=BB=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14DFBC433E0
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Jul 2020 04:48:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF130207CD
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Jul 2020 04:48:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nG39IMDj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbgGVEsK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 22 Jul 2020 00:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgGVEsK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 22 Jul 2020 00:48:10 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDDE7C0619DB
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2020 21:48:09 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id j19so535459pgm.11
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2020 21:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=58zKMZOPt1u3jpGyc+egvpdxr0peyatL+Nyz70ratxs=;
        b=nG39IMDjujMeRh/4sbcvRxIPQSNRe2DOZ6Nx2FVG6gFBmEZfpbR8IHnABB/ZFmmuYq
         L9xik+zNqwLx6t9ltZtPjSlPzGwW8BnJ3U4QayiLDdViWAIAJtsky0WxIHPn26ocOqWy
         goPjV8dCAOoFOA+8R4dlu0BP0LN9LKT5QfYZbL1Csgi59vmx1OEuQghm6E6wBeBB15Vz
         UlJEiHxgOpMI29wi8Rh60WgwyBr33qFbpArVhR2gW4+hsSu0SntQMTQn8yTNYF78DY8o
         AlyXxwIlq39XaWwhHYmo8npE5Bw4Lb0yEBUd0I9rhSUOKy+6rR2KbHStwZl1SRblTPt6
         qjww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=58zKMZOPt1u3jpGyc+egvpdxr0peyatL+Nyz70ratxs=;
        b=oe+qQlpHJXlV0fN15Ya5L1u2FDCCE77xOcfasd/7bAA1jNLZUQKnrKzXb+qGQqLcLu
         G2iI0T6p4bQm8+MBVqVC/L/AqUFd2RTi7GIKQqWLf0wxKO7p7pqL7gggbT3Bl2k1q3eD
         KOh0teHqkTrGHIbp2Li8mhkf5PATGnTWA3Sf9nrie+G43CSBSJxe629OF8QnQfkgQRGe
         vRXh05z/UVpdEOqLQ7OH7+EQX9IuPlsVo+jiswcxhUvL4RsCdkubtIVHYdNi1tJK/fyA
         dSYSKQOmKpemes08984zl/DQDPZO2qpCh0bylr8rWfIVvZ7gIc/hSI1G2TbgWPk+0OoF
         YYRw==
X-Gm-Message-State: AOAM531n3rwC8ls2yQI+B38R+K52nbaJn+0pvXjy6RPpNQk7ac25iFCs
        XxiQuL0GZkd8+cbf43OiGvIRag==
X-Google-Smtp-Source: ABdhPJy06BZ1ClnCiS4rdd+DGQj+8rN/XzWayLoX5YI/eqUtY8HLfx6BNn8AsV/rf4BLpaE0sM22Nw==
X-Received: by 2002:a63:f806:: with SMTP id n6mr24931192pgh.346.1595393289326;
        Tue, 21 Jul 2020 21:48:09 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w1sm22555353pfq.53.2020.07.21.21.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 21:48:08 -0700 (PDT)
Date:   Tue, 21 Jul 2020 21:46:15 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: hwlock: qcom: Migrate binding to YAML
Message-ID: <20200722044615.GR388985@builder.lan>
References: <20200622075956.171058-1-bjorn.andersson@linaro.org>
 <20200622075956.171058-2-bjorn.andersson@linaro.org>
 <CAL_JsqKW+R=rygii7N69o28h5780qx645RhPXGQZ4jw3kHadhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqKW+R=rygii7N69o28h5780qx645RhPXGQZ4jw3kHadhw@mail.gmail.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 21 Jul 08:13 PDT 2020, Rob Herring wrote:

> On Mon, Jun 22, 2020 at 1:59 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > Migrate the Qualcomm TCSR mutex binding to YAML to allow validation.
> >
> > Reviewed-by: Vinod Koul <vkoul@kernel.org>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >
> > Changes since v1:
> > - Actually remove the old binding doc
> >
> >  .../bindings/hwlock/qcom-hwspinlock.txt       | 39 --------------
> >  .../bindings/hwlock/qcom-hwspinlock.yaml      | 51 +++++++++++++++++++
> >  2 files changed, 51 insertions(+), 39 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt
> >  create mode 100644 Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
> 
> [...]
> 
> > diff --git a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
> > new file mode 100644
> > index 000000000000..71e63b52edd5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
> > @@ -0,0 +1,51 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwlock/qcom-hwspinlock.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Hardware Mutex Block
> > +
> > +maintainers:
> > +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> > +
> > +description:
> > +  The hardware block provides mutexes utilized between different processors on
> > +  the SoC as part of the communication protocol used by these processors.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,sfpb-mutex
> > +      - qcom,tcsr-mutex
> > +
> > +  '#hwlock-cells':
> > +    const: 1
> > +
> > +  syscon:
> > +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> > +    description:
> > +      Should be a triple of phandle referencing the TCSR mutex syscon, offset
> > +      of first mutex within the syscon and stride between each mutex.
> > +
> > +required:
> > +  - compatible
> > +  - '#hwlock-cells'
> > +  - syscon
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +        tcsr_mutex_block: syscon@fd484000 {
> > +                compatible = "syscon";
> 
> 'syscon' alone now generates warnings. Can you drop this node or add a
> specific compatible.
> 

In the binding examples or in the dts files as well?

The hardware block here is named "TCSR_MUTEX", so the natural compatible
to add here would be "qcom,tcsr-mutex", but that already has a meaning -
and the syscon node here doesn't carry all required properties...


Should we perhaps just remove the split model (syscon and
qcom,tcsr-mutex as different nodes) from the example and dts files?
(While maintaining backwards compatibility in the binding and driver)

For the platforms where we have other drivers that needs to poke in this
syscon it seems to work fine to say:
	compatible = "qcom,tcsr-mutex", "syscon";

Regards,
Bjorn

> > +                reg = <0xfd484000 0x2000>;
> > +        };
> > +
> > +        hwlock {
> > +                compatible = "qcom,tcsr-mutex";
> > +                syscon = <&tcsr_mutex_block 0 0x80>;
> > +
> > +                #hwlock-cells = <1>;
> > +        };
> > +...
> > --
> > 2.26.2
> >
