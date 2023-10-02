Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A074AE7490C
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Oct 2023 20:17:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbjJBUR1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Oct 2023 16:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbjJBUR1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Oct 2023 16:17:27 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F63FB8
        for <linux-remoteproc@vger.kernel.org>; Mon,  2 Oct 2023 13:17:23 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31f71b25a99so187587f8f.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 02 Oct 2023 13:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696277842; x=1696882642; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2Jiwef6PF99bw+KHSh/onf/J/Fu4vkEvTueVIVaMs5g=;
        b=F3TSSb0vmhGZa66aW2+hThwiwNUisVkj5mUwIPBg0PNgouqkYLH5BpiPNnLsBEGpPl
         QiQfLYLJXD2pP5+3RSO4Fdl2kE8KK6fDIIBTXvHVq6pblreeRk2c0hUT8GEYKQptnMNE
         TAwNXZY4GR1ahEcqW4roPOU9itksSsyMNTXA76i5bN6NMsBtH/GMy0BRVHV1FY5u6cYL
         7o6Za7k18HS0pjfZpeF0kcV4H25LwzBkhoNNLJ3Njwoa6Gy2SHfKyXhEr//Qww7+YPvC
         AEsZkVe5amAZomLeHCivnWNMJgT2OFV7hQ/NvZ8cLkgUhqfYe6QEhxo0xj7V6Z9tLQPj
         tx6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696277842; x=1696882642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Jiwef6PF99bw+KHSh/onf/J/Fu4vkEvTueVIVaMs5g=;
        b=HtghfhgVNXxRtmvc87SbGMJ/Dnalih5ogLVqRuLz3XYyVHBP1LhocIuF90Bu3Wfntz
         KRZ4IpeWl8TDtSOsddfm2pVleNNC65xRePaX1IBo9BfOxOZKW2YZPdcrqe+ywJ2Nj/bD
         MfdMS1Ekw0tUtn6UkCqcu3728yjLAwDseSVum3rdbxRZKIBZ+otWuHh9rBS0gtRbcv2X
         T9fA1q43/s4ITR1y8GlQKln++E7hBLQ9QRUU/7ktm1wbZcThP5gW5fTQM9KtHbYfGyZt
         x3YcDfZttbBY+Q2Br6RINjRhS6cviJdGs8E973iHcpAE3QdtPSVHv1k/mtMoThciP1yF
         PKeg==
X-Gm-Message-State: AOJu0YznT5+KGyls0NW0LDww3TsHPWAc8c683ynpGSNpjV0lH2S/WV1U
        9oGpNBhJoYlL9ScNNqJ8OCh1a34us5hsolLuB1mp9A==
X-Google-Smtp-Source: AGHT+IFF9GAf+xLviSSFA2s+sJKtTHrHbjabjKHNE4/ue+dIwDJl0YtlsgE2IigdJA/bujdNoQGKCRxOL3114HDXFCg=
X-Received: by 2002:adf:ee48:0:b0:321:4790:bb5e with SMTP id
 w8-20020adfee48000000b003214790bb5emr12170248wro.38.1696277841718; Mon, 02
 Oct 2023 13:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230928155900.3987103-1-tanmay.shah@amd.com> <20230928155900.3987103-3-tanmay.shah@amd.com>
 <ZRrn5Gj1qvKMBNmx@p14s> <dd0e02bc-38ba-441d-8b22-5be7094fcf91@amd.com> <eb42f224-5406-47ea-9de3-84593de0e470@amd.com>
In-Reply-To: <eb42f224-5406-47ea-9de3-84593de0e470@amd.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 2 Oct 2023 14:17:10 -0600
Message-ID: <CANLsYkwc71m4qm0yoqAWsAZwJbX80pOYMnB2s_fD=t_TsSZnvQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] dts: zynqmp: add properties for TCM in remoteproc
To:     Tanmay Shah <tanmay.shah@amd.com>
Cc:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, michal.simek@amd.com,
        radhey.shyam.pandey@amd.com, ben.levinsky@amd.com,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 2 Oct 2023 at 11:12, Tanmay Shah <tanmay.shah@amd.com> wrote:
>
>
> On 10/2/23 11:25 AM, Tanmay Shah wrote:
> > Hi Mathieu,
> >
> > Thanks for the reviews. Please find my comments below.
> >
> > On 10/2/23 10:55 AM, Mathieu Poirier wrote:
> > > On Thu, Sep 28, 2023 at 08:58:58AM -0700, Tanmay Shah wrote:
> > > > Add properties as per new bindings in zynqmp remoteproc node
> > > > to represent TCM address and size. This patch configures
> > > > RPU in split mode and adds TCM information accordingly.
> > > >
> > >
> > > Why is this changed from lockstep to split mode?  What about all the people out
> > > there that are expecting a lockstep mode?
> >
> > I agree, this should have been in split mode in the first place as we would like to demonstrate use of both
> >
> > RPUs with two separate demo firmwares which is the best use of the
> >
> > hardware and the most preferred use of zynqmp platform by people. That motivates to change
> >
> > this to split mode.
> >
> >
> > Now changing this may not be problem for lot of people with following reasons.
> >
> > The firmwares that are only using first 64KB of TCM memory, they can easily run in split mode as well.
> >
> > Also rpmsg vring information isn't available in device-tree yet, so I am hoping that firmware that
> >
> > are using upstream device-tree are not that big yet.
> >
> > If we change this to split mode before introducing rpmsg related nodes, I bet it will affect very less number of people.
> >
> >
> > For lockstep mode the example is available in dt-bindings document.
> >

I could use the same argument for the split mode, i.e default is
lockstep and there is an example in the dt-bindings document for split
mode.

> > So, if people need lockstep mode for any reason, all they need to change is xlnx,cluster-mode property from 0 to 1 and TCM nodes
> >
> > from bindings document.
> >
> >
> > If you think it's crucial to mention all above, I can send new patch with all above info in commit message.
>
> Something to add to this. So, let's say if we don't change it now, what would be good time to change it?
>

The best way to go about this is to introduce another DT that is
tailored for split mode.  That way people can choose to boot their
device in a specific mode using the DT.  If you decide to go this way,
look at how ST has split their DT for different boards - search for
"m4_rproc" under " arch/arm/boot/dts/st".

> As I am hopping to use RPU1 as well with upstream device-tree. Please let me know some suggestion to work this.
>
> Thanks and again as always appreciate complete reviews,
>
> Tanmay
>
>
> >
> >
> > >
> > > > Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> > > > ---
> > > >  arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 28 ++++++++++++++++++++------
> > > >  1 file changed, 22 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> > > > index b61fc99cd911..01e12894c88e 100644
> > > > --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> > > > +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> > > > @@ -247,19 +247,35 @@ fpga_full: fpga-full {
> > > >           ranges;
> > > >   };
> > > >
> > > > - remoteproc {
> > > > + remoteproc@ffe00000 {
> > > >           compatible = "xlnx,zynqmp-r5fss";
> > > > -         xlnx,cluster-mode = <1>;
> > > > +         xlnx,cluster-mode = <0>;
> > > >
> > > > -         r5f-0 {
> > > > +         #address-cells = <2>;
> > > > +         #size-cells = <2>;
> > > > +
> > > > +         ranges = <0x0 0x0 0x0 0xffe00000 0x0 0x10000>,
> > > > +                  <0x0 0x20000 0x0 0xffe20000 0x0 0x10000>,
> > > > +                  <0x1 0x0 0x0 0xffe90000 0x0 0x10000>,
> > > > +                  <0x1 0x20000 0x0 0xffeb0000 0x0 0x10000>;
> > > > +
> > > > +         r5f@0 {
> > > >                   compatible = "xlnx,zynqmp-r5f";
> > > > -                 power-domains = <&zynqmp_firmware PD_RPU_0>;
> > > > +                 reg = <0x0 0x0 0x0 0x10000>, <0x0 0x20000 0x0 0x10000>;
> > > > +                 reg-names = "atcm", "btcm";
> > > > +                 power-domains = <&zynqmp_firmware PD_RPU_0>,
> > > > +                                 <&zynqmp_firmware PD_R5_0_ATCM>,
> > > > +                                 <&zynqmp_firmware PD_R5_0_BTCM>;
> > > >                   memory-region = <&rproc_0_fw_image>;
> > > >           };
> > > >
> > > > -         r5f-1 {
> > > > +         r5f@1 {
> > > >                   compatible = "xlnx,zynqmp-r5f";
> > > > -                 power-domains = <&zynqmp_firmware PD_RPU_1>;
> > > > +                 reg = <0x1 0x0 0x0 0x10000>, <0x1 0x20000 0x0 0x10000>;
> > > > +                 reg-names = "atcm", "btcm";
> > > > +                 power-domains = <&zynqmp_firmware PD_RPU_1>,
> > > > +                                 <&zynqmp_firmware PD_R5_1_ATCM>,
> > > > +                                 <&zynqmp_firmware PD_R5_1_BTCM>;
> > > >                   memory-region = <&rproc_1_fw_image>;
> > > >           };
> > > >   };
> > > > --
> > > > 2.25.1
> > > >
