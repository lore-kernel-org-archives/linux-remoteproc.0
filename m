Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C033BC433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Feb 2022 15:28:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233262AbiBVP2Y (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Feb 2022 10:28:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233166AbiBVP2X (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Feb 2022 10:28:23 -0500
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BEE6BF94E
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Feb 2022 07:27:57 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id o5so43033954qvm.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Feb 2022 07:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=sRXHeZa3R3XlgQ3HiJffd+JnUn0eLfdgPeYFYoXUPrA=;
        b=OM8uvKjAqiC1AFy883I9phKcgjUhezz0SI1Zd0n1/e8N0pexuTzZYEesBLhTn2J0q5
         wuNz/qzfZoQx4gqHM/2EUgCZxcH7nIl1zwNAKSvKD24YcWjwl0AwQWwugipEssZ0ddsz
         eYkIurkODq75S+udILDkgjj4Bf8oN29wqttH1Rvrgg+K7uxImMrUBrbcrOHwuOL98oIT
         GKtf0eZHgpx7aZs3kFNxWdTYHTp1n8SL3+gOjX8PRQENJ34taYBHy0wFPXx4DStnb86x
         hqFlDVWhl2c0ecYNcteLMpF/nN3QGe2N9QH0szYwtdm/fq1JJ9F8qUNRdSuT6B/PHblj
         BcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=sRXHeZa3R3XlgQ3HiJffd+JnUn0eLfdgPeYFYoXUPrA=;
        b=wfuT16ZYtXGPCPPnbE8EFp35Uy0oGolCvqdMSpkYbMJ6ojq0tJqFJv2i6JKqhYaj9e
         2GmR/cWltmStN31YGpGvD+CUrwOSq3hVAUGtd2kgwCTC+9IudHS1jx/zuErH0qDvNsNy
         QUseLzQSvSeSzq3jkA/bgn7F80CZ7PNg8yw2gXWv9vJFvvLxTMTo9++bccBdVKXI1KIh
         GvdLU5X3DyCQ7Dnla5yYKRZlthTMr+TLnIi71EXC1iQgiGdt+BigY49S8CrAx9th85bV
         PZ0ts5ibybJuXZsEyER75W1l+UUE7Ta9iWYPH5ZQSGfqtGtYaZr5VXLL6nmCW8KHcYSp
         9Z6Q==
X-Gm-Message-State: AOAM531206NSQOtqm2ptXDwhZxFfL/ecYzdI3SO1SdaXPHNkvCHJkF+A
        WAZ75zHdy1rbYb8kZ+a9sWQk3kt5SvQCH+HVhEM=
X-Received: by 2002:a05:622a:588:b0:2de:6f57:1576 with SMTP id
 c8-20020a05622a058800b002de6f571576mt1162221qtb.83.1645543676369; Tue, 22 Feb
 2022 07:27:56 -0800 (PST)
MIME-Version: 1.0
References: <20220221135351.GA7342@ubuntu> <3e1ee336-1c78-7719-826c-2a093a20ee8e@kernel.org>
In-Reply-To: <3e1ee336-1c78-7719-826c-2a093a20ee8e@kernel.org>
From:   Kestrel seventyfour <kestrelseventyfour@gmail.com>
Date:   Tue, 22 Feb 2022 16:27:45 +0100
Message-ID: <CAE9cyGRcDSJwrKOWER9wxHSAQzLs2ZdL+uWsme0etMV+8wKcMg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: remoteproc: Add AVM WASP
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Am Mo., 21. Feb. 2022 um 17:47 Uhr schrieb Krzysztof Kozlowski
<krzk@kernel.org>:
>
> On 21/02/2022 14:53, Daniel Kestrel wrote:
> > AVM Fritzbox router boards may contain an additional ATH79
> > based SoC that has the wifi cards connected.
> > This patch adds bindings for this remote processor.
> >
> > Signed-off-by: Daniel Kestrel <kestrelseventyfour@gmail.com>
> > ---
> >  .../bindings/remoteproc/avm,wasp-rproc.yaml   | 93 +++++++++++++++++++
> >  1 file changed, 93 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/remoteproc/avm,wasp-rproc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/remoteproc/avm,wasp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/avm,wasp-rproc.yaml
> > new file mode 100644
> > index 000000000000..21f3bbcc4202
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/remoteproc/avm,wasp-rproc.yaml
> > @@ -0,0 +1,93 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/remoteproc/avm,wasp-rproc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: AVM WASP processor controller bindings
> > +
> > +maintainers:
> > +  - Daniel Kestrel <kestrelseventyfour@gmail.com>
> > +
> > +description: |
> > +  This document defines the bindings for the remoteproc component that loads and
> > +  boots firmwares on the AVM Wireless Assistent Support Processor (WASP) SoC
> > +  that is attached to some AVM Fritzbox devices (3390, 3490, 5490, 5491, 7490).
> > +
> > +properties:
> > +  compatible:
> > +    const: avm,wasp
> > +
> > +  ath9k-firmware:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: |
> > +      Should contain the name of the ath9k eeprom that is to be loaded from
> > +      the lantiq host flash. Wifi on the WASP SoC does not work without it.
> > +      The file should be located on the firmware search path.
>
> Are you sure this is a property of hardware? It looks like runtime
> configuration parameter.
>
> > +
> > +  ath10k-caldata:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: |
> > +      Should contain the name of the ath10k caldata that is to be loaded from
> > +      the lantiq host flash. Wifi on the WASP SoC does not work without it.
> > +      The file should be located on the firmware search path.
>
> Same.
>
> > +
> > +  wasp-netboot-firmware:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: |
> > +      Should contain the name of the netboot firmware that is to be loaded
> > +      and started on the WASP SoC using mdio in order to be able to load
> > +      the initramfs image as a second stage.
> > +      The file should be located on the firmware search path.
>
> Same.
>
> > +
> > +  wasp-netboot-mdio:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: Reference to the Lantiq GSWIP switch mdio.
>
> Vendor prefix.
>
> > +
> > +  wasp-initramfs-port:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: Reference to the network port, where the WASP SoC is connected to.
>
> Vendor prefix.
>
> > +
> > +  wasp-initramfs-image:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: |
> > +      Should contain the name of the initramfs linux image that is to be loaded
> > +      and started on the WASP SoC.
> > +      The file should be located on the firmware search path.
>
> initramfs path looks even less like a property of hardware... If you
> change initramfs from CPIO to initrd or GZ, hardware changes as well?
>
> > +  reset-gpio:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description: Reference and parameters for the reset gpio of the WASP SoC.
>
> Wrong suffix, unneeded type. Did you run dt_binding_check?

Hi Krzystof,

Sorry for missing the dt_binding_check.
I have switched to use devm_gpiod_get and it does not work if the
suffix is not -gpio
or -gpios (see of_find_gpio method).
Would avm,reset-gpio be ok to use here?

Thanks.
>
> "Reference and parameters" are obvious, so they should be skipped.
>
> > +
> > +  startup-gpio:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description: Reference and parameters for the power switch gpio of the WASP SoC.
>
> Same.
Is avm,startup-gpio ok, like above?
>
> > +
> > +required:
> > +  - compatible
> > +  - ath9k-firmware
> > +  - ath10k-caldata
> > +  - wasp-netboot-firmware
> > +  - wasp-netboot-mdio
> > +  - wasp-initramfs-port
> > +  - wasp-initramfs-image
> > +  - reset-gpio
> > +  - startup-gpio
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    avm-wasp {
>
> Generic node name describing class of a device. AVM is company, WASP is
> product, so neither of them are generic.
>
>
> Best regards,
> Krzysztof
