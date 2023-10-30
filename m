Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E960C4332F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 30 Oct 2023 15:04:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233605AbjJ3PEa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 30 Oct 2023 11:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233597AbjJ3PE3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Oct 2023 11:04:29 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9EF1E8
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Oct 2023 08:04:25 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9be3b66f254so683698966b.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Oct 2023 08:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698678262; x=1699283062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JvOfGIGza1mBeWZawbJIooxVS12He6qAo7rs6m+IoM=;
        b=P1VwQQ9teZJ4If4eD4+ngSHL6cfghvmFy85TV1tGlIFsrpdnwQdLwW5Lsub5pdCqnu
         gTBC09Oq0UFJgXDIFjovAulPnaKdFWe3s2wab82OpW7UtZ23JRX1bnNvvD4JYHP13yzD
         ZLsHlYHYMXv2iZC/jML+JYQAm+AiYDIx1gHsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698678262; x=1699283062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4JvOfGIGza1mBeWZawbJIooxVS12He6qAo7rs6m+IoM=;
        b=HXLD2JebmkPSSgLHTfEQHZsQHRfl4FIn4LavDZlTPOZ7+4nAjQE0Q6bouWZz/F/K8c
         O17pbbDRbwtGQmxj1Q4FE2Bhm320EOQP2pdW3w5XgNEEzfvbFLgsWYvvX7Iy+GR0XlQ1
         y2LV966svmV6m4e14liDitkrUSleviSpVgLKEy4IgNajH0U/lGofbD9mnndYKUHevSnO
         ltTqk4LM2yo/ZNNY7QPLjlkUokZ55e3UW6pf2ah6lY//G8grxGKxVSG9P11wVYAwJ9OX
         iczdmDUzu+ta1cEvUx5D0j+R2NIxfHQGb5lKl4jF2PhS05VtlXcT+F2VORWUDePeV3UR
         hANA==
X-Gm-Message-State: AOJu0Yy+nIOZDYcMJssDPyHHHSfsuMMTrceKtQau7BGen+TBLo3HluRf
        6HxWO0s5vjM+NSpvKT/RoKnPDCpkrWKPbQJL8MulzrLm
X-Google-Smtp-Source: AGHT+IG4riEbC9uVBQTyBkM5DM19DycaGRaf3jneDRLG+s7OyortR1W+OYP0VGvT9HZJ1EUreOPdxg==
X-Received: by 2002:a17:907:9494:b0:9bf:4915:22c4 with SMTP id dm20-20020a170907949400b009bf491522c4mr8466373ejc.67.1698678262369;
        Mon, 30 Oct 2023 08:04:22 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id n11-20020a170906b30b00b0099bcdfff7cbsm6029429ejz.160.2023.10.30.08.04.21
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 08:04:21 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40837124e1cso103855e9.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Oct 2023 08:04:21 -0700 (PDT)
X-Received: by 2002:a05:600c:4fc5:b0:408:3e63:f457 with SMTP id
 o5-20020a05600c4fc500b004083e63f457mr144533wmq.2.1698678254490; Mon, 30 Oct
 2023 08:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20231027-sc7280-remoteprocs-v1-0-05ce95d9315a@fairphone.com>
 <20231027-sc7280-remoteprocs-v1-7-05ce95d9315a@fairphone.com>
 <7934a36a-9438-719a-2ed0-4a78757b044b@quicinc.com> <CWLNP6QNUXN1.SNVACF2IEGI8@fairphone.com>
 <CAD=FV=U6mi0h0MBFMC+ba4oq-te6_+WR6fj1XjAq7tmUu64bUA@mail.gmail.com> <CWLUQWPZNAS5.3F4Y5W13OD08M@fairphone.com>
In-Reply-To: <CWLUQWPZNAS5.3F4Y5W13OD08M@fairphone.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 30 Oct 2023 08:03:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XbwbjFgMjq-y_L-9EO+xfxwGo6RYV8Wh6P5oBR=oDf_g@mail.gmail.com>
Message-ID: <CAD=FV=XbwbjFgMjq-y_L-9EO+xfxwGo6RYV8Wh6P5oBR=oDf_g@mail.gmail.com>
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

On Mon, Oct 30, 2023 at 7:43=E2=80=AFAM Luca Weiss <luca.weiss@fairphone.co=
m> wrote:
>
> On Mon Oct 30, 2023 at 3:11 PM CET, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Oct 30, 2023 at 2:12=E2=80=AFAM Luca Weiss <luca.weiss@fairphon=
e.com> wrote:
> > >
> > > On Mon Oct 30, 2023 at 10:04 AM CET, Mukesh Ojha wrote:
> > > >
> > > >
> > > > On 10/27/2023 7:50 PM, Luca Weiss wrote:
> > > > > Add the node for the ADSP found on the SC7280 SoC, using standard
> > > > > Qualcomm firmware.
> > > > >
> > > > > The memory region for sc7280-chrome-common.dtsi is taken from msm=
-5.4
> > > > > yupik.dtsi since the other areas also seem to match that file the=
re,
> > > > > though I cannot be sure there.
> > > > >
> > > > > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > > > > ---
> > > > >   arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |   5 +
> > > > >   arch/arm64/boot/dts/qcom/sc7280.dtsi               | 138 ++++++=
+++++++++++++++
> > > > >   2 files changed, 143 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b=
/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> > > > > index eb55616e0892..6e5a9d4c1fda 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> > > > > +++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> > > > > @@ -29,6 +29,11 @@ adsp_mem: memory@86700000 {
> > > > >                     no-map;
> > > > >             };
> > > > >
> > > > > +           cdsp_mem: memory@88f00000 {
> > > > > +                   reg =3D <0x0 0x88f00000 0x0 0x1e00000>;
> > > > > +                   no-map;
> > > > > +           };
> > > > > +
> > > >
> > > > Just a question, why to do it here, if chrome does not use this ?
> > >
> > > Other memory regions in sc7280.dtsi also get referenced but not actua=
lly
> > > defined in that file, like mpss_mem and wpss_mem. Alternatively we ca=
n
> > > also try and solve this differently, but then we should probably also
> > > adjust mpss and wpss to be consistent.
> > >
> > > Apart from either declaring cdsp_mem in sc7280.dtsi or
> > > "/delete-property/ memory-region;" for CDSP I don't really have bette=
r
> > > ideas though.
> > >
> > > I also imagine these ChromeOS devices will want to enable cdsp at som=
e
> > > point but I don't know any plans there.
> >
> > Given that "remoteproc_cdsp" has status "disabled" in the dtsi, it
> > feels like the dtsi shouldn't be reserving memory. I guess maybe
> > memory regions can't be status "disabled"?
>
> Hi Doug,
>
> That's how it works in really any qcom dtsi though. I think in most/all
> cases normally the reserved-memory is already declared in the SoC dtsi
> file and also used with the memory-region property.
>
> I wouldn't be against adjusting sc7280.dtsi to match the way it's done
> in the other dtsi files though, so to have all the required labels
> already defined in the dtsi so it doesn't rely on these labels being
> defined in the device dts.
>
> In other words, currently if you include sc7280.dtsi and try to build,
> you first have to define the labels mpss_mem and wpss_mem (after this
> patch series also cdsp_mem and adsp_mem) for it to build.
>
> I'm quite neutral either way, let me know :)

I haven't done a ton of thinking about this, so if I'm spouting
gibberish then feel free to ignore me. :-P It just feels weird that
when all the "dtsi" files are combined and you look at what you end up
on a sc7280 Chrome board that you'll be reserving 32MB of memory for a
device that's set (in the same device tree) to be "disabled", right?
...the 32MB is completely wasted, I think. If we wanted to enable the
CDSP we'd have to modify the device tree anyway, so it seems like that
same modification would set the CDSP to "okay" and also reserve the
memory...

In that vein, it seems like maybe you could move the "cdsp_mem" to the
SoC .dsti file with a status of "disabled". . I guess we don't do that
elsewhere, but maybe we should be? As far as I can tell without
testing it (just looking at fdt_scan_reserved_mem()) this should
work...

-Doug
