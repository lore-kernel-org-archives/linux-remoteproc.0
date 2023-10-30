Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D32AC4167D
	for <linux-remoteproc@archiver.kernel.org>; Mon, 30 Oct 2023 14:11:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbjJ3OLi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 30 Oct 2023 10:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjJ3OLe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Oct 2023 10:11:34 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 762C3DB
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Oct 2023 07:11:31 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9c773ac9b15so674335566b.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Oct 2023 07:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698675088; x=1699279888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4pKFRQbiSaL9ZKbrNbTowWU8USbI5fmQxi6InoyZho=;
        b=IOSC0IIb0Tx/CSpf3tkeq9dQF+Mf+x2f5rrIxPWMbvSe5eBLGwDUYOHv31G0Fu+Mai
         eNuQlhEKDVKYbSnYZtSjLOP+uah0Dy+VQfaaTFEUIQ/30YYxU3FrLBiorVTgYVkq09rp
         HM0Nz3C98QU8jN+qTub8OZ2GCE9dLMYVPjla0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698675088; x=1699279888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E4pKFRQbiSaL9ZKbrNbTowWU8USbI5fmQxi6InoyZho=;
        b=mJ1rpuVILiQ8mcKzALukOeJUjMQWRe58yvzz3S/RfzNeipYkKsrcdLqTgQIG1DILvd
         RbPSXADWLkf9sHbyxE6K9s5gqm8aotstEk/8ICxaTcyhYuhRYaxTxcb1M1cui96qQpa8
         TKs0q7SskIx97TAewIy1pXT+e8L8MrgN7NmwUS8Amp+oY8szzaxdn5JwvbDdEAGqSI8/
         4rE152zLRMcL7IRStJc4qycUGAzLzEIJXbSm8THa4TOoklvaSegcbIKvpHJCEWmtqplJ
         qDqC/W9rVCzMByrTBGbo9w/lXPREuT8JSoMwrS8r0UI+k6tAi9woLR2hr6xaFpJ0TQA8
         rjrg==
X-Gm-Message-State: AOJu0YxJn4AnMhsaUUqX4fIRorwBWXFBZDfIJ40g2LDXeNzFA6KPYL12
        3zaX+NEkt7SDAn3qrj1294dLjXAphRRjWKnqyITbgg==
X-Google-Smtp-Source: AGHT+IH2MnCt1exiyHME6q2+VJdv6xs2xxBuiC4Su0CzjK8bTYEf/O36ZhASE3kDsJsaBKvS3SfC5w==
X-Received: by 2002:a17:906:4fd4:b0:9bd:e017:370e with SMTP id i20-20020a1709064fd400b009bde017370emr9290136ejw.54.1698675088510;
        Mon, 30 Oct 2023 07:11:28 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id la23-20020a170906ad9700b009b94fe3fc47sm6068827ejb.159.2023.10.30.07.11.27
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 07:11:28 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40853f2e93eso94705e9.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Oct 2023 07:11:27 -0700 (PDT)
X-Received: by 2002:a05:600c:5128:b0:3f7:3e85:36a with SMTP id
 o40-20020a05600c512800b003f73e85036amr116810wms.7.1698675087168; Mon, 30 Oct
 2023 07:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20231027-sc7280-remoteprocs-v1-0-05ce95d9315a@fairphone.com>
 <20231027-sc7280-remoteprocs-v1-7-05ce95d9315a@fairphone.com>
 <7934a36a-9438-719a-2ed0-4a78757b044b@quicinc.com> <CWLNP6QNUXN1.SNVACF2IEGI8@fairphone.com>
In-Reply-To: <CWLNP6QNUXN1.SNVACF2IEGI8@fairphone.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 30 Oct 2023 07:11:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U6mi0h0MBFMC+ba4oq-te6_+WR6fj1XjAq7tmUu64bUA@mail.gmail.com>
Message-ID: <CAD=FV=U6mi0h0MBFMC+ba4oq-te6_+WR6fj1XjAq7tmUu64bUA@mail.gmail.com>
Subject: Re: [PATCH 7/9] arm64: dts: qcom: sc7280: Add CDSP node
To:     Luca Weiss <luca.weiss@fairphone.com>
Cc:     Mukesh Ojha <quic_mojha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

On Mon, Oct 30, 2023 at 2:12=E2=80=AFAM Luca Weiss <luca.weiss@fairphone.co=
m> wrote:
>
> On Mon Oct 30, 2023 at 10:04 AM CET, Mukesh Ojha wrote:
> >
> >
> > On 10/27/2023 7:50 PM, Luca Weiss wrote:
> > > Add the node for the ADSP found on the SC7280 SoC, using standard
> > > Qualcomm firmware.
> > >
> > > The memory region for sc7280-chrome-common.dtsi is taken from msm-5.4
> > > yupik.dtsi since the other areas also seem to match that file there,
> > > though I cannot be sure there.
> > >
> > > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |   5 +
> > >   arch/arm64/boot/dts/qcom/sc7280.dtsi               | 138 ++++++++++=
+++++++++++
> > >   2 files changed, 143 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arc=
h/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> > > index eb55616e0892..6e5a9d4c1fda 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> > > @@ -29,6 +29,11 @@ adsp_mem: memory@86700000 {
> > >                     no-map;
> > >             };
> > >
> > > +           cdsp_mem: memory@88f00000 {
> > > +                   reg =3D <0x0 0x88f00000 0x0 0x1e00000>;
> > > +                   no-map;
> > > +           };
> > > +
> >
> > Just a question, why to do it here, if chrome does not use this ?
>
> Other memory regions in sc7280.dtsi also get referenced but not actually
> defined in that file, like mpss_mem and wpss_mem. Alternatively we can
> also try and solve this differently, but then we should probably also
> adjust mpss and wpss to be consistent.
>
> Apart from either declaring cdsp_mem in sc7280.dtsi or
> "/delete-property/ memory-region;" for CDSP I don't really have better
> ideas though.
>
> I also imagine these ChromeOS devices will want to enable cdsp at some
> point but I don't know any plans there.

Given that "remoteproc_cdsp" has status "disabled" in the dtsi, it
feels like the dtsi shouldn't be reserving memory. I guess maybe
memory regions can't be status "disabled"?

-Doug
