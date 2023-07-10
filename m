Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C6CAEB64D9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 10 Jul 2023 22:02:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbjGJWB7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 10 Jul 2023 18:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbjGJWB7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 10 Jul 2023 18:01:59 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2261DB
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Jul 2023 15:01:57 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-307d20548adso5077147f8f.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Jul 2023 15:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689026516; x=1691618516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o4h71rVJLSAQ5ToHrg8zyVUDhPdW0Vc1RgJLhxKHOI4=;
        b=dPbr+tKX2W4oduCplWq+0ePKJwhC9RyFUxpYVYVIo0zl6mxI1IyIQX4XbHHEqgP9l/
         Vxh3NIdI0KKYLT6cAfw1SPR2uFhDye6j68d807jy9FEejKnNNrZqC+GxKhcKH8D7haQH
         y3Y0ebo4HPrD0OoFelG3f5AFojR1yn7ENLACUGSXUK+dPNjr0ubmoeEJOe+Ae+94y7D/
         kj5b8cbVHY6CIWVyZryHKHF+1gFxoKZn27o5LGvFmeOMBzfk+wcAPc5Tmk4QDdQddLaj
         H3XWhxZpONJ9CTIVtSN6CalL2hF31we6k5EKG42BsGU6iNOt4cuucEEVQOP1PYkXfvxn
         t3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689026516; x=1691618516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4h71rVJLSAQ5ToHrg8zyVUDhPdW0Vc1RgJLhxKHOI4=;
        b=Frm5jDUZoKlddd89ENXfzWG6COaQCxcUsgp2g6A8lNCvuZADwtccBqjwB8CNXsfVMC
         OWJZ286+3eWpd72CHgBmH7qeLIqqVmuYPMyFUBqG0/faW2lCxYvExeSB831Jk4xoHOJ8
         DdybnaQoD6KskWzoeoXCOSOqVO6QVN166F/OzZfukbKg82EAe9d+d0x57D5OptRuEj33
         UVVjMDAK0HfueJoNQOvBlJRQm+wnYzEgwpMkd7ZlAHsp9STLVR5/Fu9fXPczTI48E4e1
         1kMiaog1BjHquKNgB+Hs8QTfl5PplFrz6E38/RMz5owHAKNHNZhEdcQ1EKOrD4A2LNkg
         vQRw==
X-Gm-Message-State: ABy/qLaSBXKUEj5TwBRrQSXJ/2l1LeseViDaKripI+QeyAAGmD/jU/au
        7c7WfQvB9IP2ppVo3FapX7sfPxuYwfiiaDowjzDWcg==
X-Google-Smtp-Source: APBJJlERlHDWLJGqfycrhAwXupJXfTAsJSDt4invQ2phctvJtiiGLTyAao1X4Ku/puSq4TW7dQva4mQSG9bjbmXGxKw=
X-Received: by 2002:adf:f84d:0:b0:313:ee33:c28d with SMTP id
 d13-20020adff84d000000b00313ee33c28dmr11192613wrq.17.1689026515896; Mon, 10
 Jul 2023 15:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230707232444.374431-1-marex@denx.de> <8f40484e-1721-a2bc-2344-f9e59e51a935@linaro.org>
 <d3180b8f-96d6-380b-4518-17334a90799d@denx.de> <c02d0271-9896-3990-33b0-c83fa54f5623@linaro.org>
 <7a1d7a67-0a0c-8527-d430-30a1cb40de48@denx.de> <51a1c2e9-1165-c7ff-809d-b09e09d776e2@linaro.org>
 <6e2e16be-1f83-70d2-4c5d-c2e89a7d017f@denx.de>
In-Reply-To: <6e2e16be-1f83-70d2-4c5d-c2e89a7d017f@denx.de>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 10 Jul 2023 16:01:44 -0600
Message-ID: <CANLsYkyWCaSwiL=nOSG1efw069GKEeK2nYkYeMVT7bx0329Bgw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: imx_rproc: Document fsl,startup-delay-ms
To:     Marek Vasut <marex@denx.de>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 10 Jul 2023 at 15:53, Marek Vasut <marex@denx.de> wrote:
>
> On 7/10/23 22:00, Krzysztof Kozlowski wrote:
> > On 10/07/2023 15:46, Marek Vasut wrote:
> >> On 7/10/23 14:52, Krzysztof Kozlowski wrote:
> >>> On 10/07/2023 11:18, Marek Vasut wrote:
> >>>> On 7/10/23 10:12, Krzysztof Kozlowski wrote:
> >>>>> On 08/07/2023 01:24, Marek Vasut wrote:
> >>>>>> Document fsl,startup-delay-ms property which indicates how long
> >>>>>> the system software should wait until attempting to communicate
> >>>>>> with the CM firmware. This gives the CM firmware a bit of time
> >>>>>> to boot and get ready for communication.
> >>>>>>
> >>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
> >>>>>> ---
> >>>>>> Cc: Bjorn Andersson <andersson@kernel.org>
> >>>>>> Cc: Conor Dooley <conor+dt@kernel.org>
> >>>>>> Cc: Fabio Estevam <festevam@gmail.com>
> >>>>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> >>>>>> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>>>>> Cc: NXP Linux Team <linux-imx@nxp.com>
> >>>>>> Cc: Peng Fan <peng.fan@nxp.com>
> >>>>>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> >>>>>> Cc: Rob Herring <robh+dt@kernel.org>
> >>>>>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> >>>>>> Cc: Shawn Guo <shawnguo@kernel.org>
> >>>>>> Cc: devicetree@vger.kernel.org
> >>>>>> Cc: linux-arm-kernel@lists.infradead.org
> >>>>>> Cc: linux-remoteproc@vger.kernel.org
> >>>>>> ---
> >>>>>>     .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml        | 5 +++++
> >>>>>>     1 file changed, 5 insertions(+)
> >>>>>>
> >>>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> >>>>>> index 0c3910f152d1d..c940199ce89df 100644
> >>>>>> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> >>>>>> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> >>>>>> @@ -76,6 +76,11 @@ properties:
> >>>>>>           This property is to specify the resource id of the remote processor in SoC
> >>>>>>           which supports SCFW
> >>>>>>
> >>>>>> +  fsl,startup-delay-ms:
> >>>>>> +    default: 0
> >>>>>> +    description:
> >>>>>> +      CM firmware start up delay.
> >>>>>
> >>>>> I don't see particular improvements from v2 and no responses addressing
> >>>>> my comment:
> >>>>> https://lore.kernel.org/all/20221102112451.128110-2-peng.fan@oss.nxp.com/
> >>>>
> >>>> I wasn't aware of this being submitted before, esp. since I wrote the
> >>>> binding document from scratch. Which comment is not addressed, the type
> >>>> ref is not present and the sentence starts with caps, so what is missing ?
> >>>
> >>>
> >>> That the property looks like a hacky solution to some SW problem. Why
> >>> this delay should be different on different boards?
> >>
> >> It probably depends more on the CM4 firmware that is being launched. The
> >> ones I tested were fine with 50..500ms delay, but the delay was always
> >> needed.
> >
> > If this is for some official remoteproc FW running on M4
>
> It is not, it is some SDK which can be downloaded from NXP website,
> which can then be used to compile the firmware blob. The license is
> BSD-3 however, so it is conductive to producing binaries without
> matching sources ...
>

Why can't the SDK be upgraded to provide some kind of hand-shake
mechanism, as suggested when I first reviewed this patchset?

> >, then probably
> > this could be implied by compatible. Otherwise, if this depends on
> > actual M4 firmware which can totally vary between each board of the same
> > type (I can run my own FW on M4, right?
>
> Yeah
>
> > ), then it is not suitable DT
> > property. How it would even look like? You add here 500 ms for all known
> > firmwares and then someone comes with FW requiring delay of 600 ms.
>
> I would say, some sane default and if some firmware is specifically
> weird, just up the delay. It is better than no firmware working at all.
>
> Do you have a better hint how to deal with this ?
