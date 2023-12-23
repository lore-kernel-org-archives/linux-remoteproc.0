Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F71F515
	for <linux-remoteproc@vger.kernel.org>; Sat, 23 Dec 2023 14:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IS1BFi1i"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3367f8f8cb0so2606278f8f.2
        for <linux-remoteproc@vger.kernel.org>; Sat, 23 Dec 2023 06:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703342055; x=1703946855; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BV1PEntNocE2IBL12A6TgxaD4fskw5gPnZjQ1f85ecE=;
        b=IS1BFi1iiqE7r4gJUnpKdFbmjm5hbXaER8eZhUSYPvlc1rBluum0a0F6gMNSduPudE
         4I8ayQikoLjuXPjk4ewStXdkU0oVgco9EARyukz/tWuOzu6QEkK4B6Z9Dcj8FVbgc0N+
         /WoGZV6bRWbXXWNDqh5c/5uVB/OMJ8gPqFKn1sBLIeGnewGdhI5e/uCXLa/PIR/DRAxo
         42KvbBxsJye9K/2WVVfGx5/8dDwGn1Pi0PPP8PC/oP+rMrlnSg/jwwAKcRghH2ZaP0/n
         EujInoZ60UIqfE4Mwwt7Ctlcuy9IUU+kAw0hvfp0m2N10koJjN0YZtupq8dhSwr27dVy
         5Iug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703342055; x=1703946855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BV1PEntNocE2IBL12A6TgxaD4fskw5gPnZjQ1f85ecE=;
        b=T6VqO/UsTjJS0gvTRVW4vVMp5H01J7i9kLB/fgU3uiUHapgnxoILPBoEjWO/UJjlRV
         embjtmBZY56EL7lvtvyjeIYaWShgkVgeAbo19wX9xUcUrXkFvUmdF05ApHfZvecQwlyR
         eSOmLb7ER6alx4Or1rKyh1yzzFcaobUn6TF+/UyJyiB//WHpq8KpYM6YxN65FqCl7lpx
         6zYhXKObruqRZTq7bagUjIUwJpGRE6X8rV4zd4MdgJrLrzilVl9mbpNbtsbIZ8/Ujmrd
         MZNR/lCu1lCuNdpYBRRkoVxMM0jGG4DBL6Usv4HP4T9u8DS77duxUHjygjm/70P0NBEY
         rSpQ==
X-Gm-Message-State: AOJu0YwOf3EN25PqtNkMAne6jzgHv8uvze7lMW2LMjQk34BYbb2iiigs
	yCc62tWsKGVuQ1iBZeOIWFYZ+elpYmX25gN+fXhGUMJW3RqB6g==
X-Google-Smtp-Source: AGHT+IESkPfLkYu8vLlwXSJLB7jisOcm59ju+sR9oNFmAVyPfuKc/7s7JLff8bMg5ecCjqFhSGQviWOCuhXT2JCdi84=
X-Received: by 2002:a5d:4609:0:b0:336:6d62:7647 with SMTP id
 t9-20020a5d4609000000b003366d627647mr1642900wrq.5.1703342055201; Sat, 23 Dec
 2023 06:34:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231215235725.1247350-1-tanmay.shah@amd.com> <20231215235725.1247350-3-tanmay.shah@amd.com>
 <6ab19ceb-38ed-4e4c-aabc-a959bc123cf2@amd.com> <e9e9777d-f8c1-48cd-b433-0292c77f6d57@amd.com>
In-Reply-To: <e9e9777d-f8c1-48cd-b433-0292c77f6d57@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Sat, 23 Dec 2023 07:34:02 -0700
Message-ID: <CANLsYkxJyKFm4LR_JJx-kQMs=xa1C=SnD1Ha=jGqXM5nfy5dxw@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] dts: zynqmp: add properties for TCM in remoteproc
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: Michal Simek <michal.simek@amd.com>, andersson@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, ben.levinsky@amd.com, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Dec 2023 at 07:45, Tanmay Shah <tanmay.shah@amd.com> wrote:
>
>
> On 12/20/23 7:14 AM, Michal Simek wrote:
> >
> > On 12/16/23 00:57, Tanmay Shah wrote:
> > > Add properties as per new bindings in zynqmp remoteproc node
> > > to represent TCM address and size.
> > >
> > > This patch also adds alternative remoteproc node to represent
> > > remoteproc cluster in split mode. By default lockstep mode is
> > > enabled and users should disable it before using split mode
> > > dts. Both device-tree nodes can't be used simultaneously one
> > > of them must be disabled. For zcu102-1.0 and zcu102-1.1 board
> > > remoteproc split mode dts node is enabled and lockstep mode
> > > dts is disabled.
> > >
> > > Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> > > ---
> > >   .../boot/dts/xilinx/zynqmp-zcu102-rev1.0.dts  |  8 +++
> > >   arch/arm64/boot/dts/xilinx/zynqmp.dtsi        | 60 +++++++++++++++++--
> > >   2 files changed, 63 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dts
> > > index c8f71a1aec89..495ca94b45db 100644
> > > --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dts
> > > +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dts
> > > @@ -14,6 +14,14 @@ / {
> > >     compatible = "xlnx,zynqmp-zcu102-rev1.0", "xlnx,zynqmp-zcu102", "xlnx,zynqmp";
> > >   };
> > >
> > > +&rproc_split {
> > > +   status = "okay";
> > > +};
> > > +
> > > +&rproc_lockstep {
> > > +   status = "disabled";
> > > +};
> > > +
> > >   &eeprom {
> > >     #address-cells = <1>;
> > >     #size-cells = <1>;
> > > diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> > > index b61fc99cd911..602e6aba7ac5 100644
> > > --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> > > +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> > > @@ -247,19 +247,69 @@ fpga_full: fpga-full {
> > >             ranges;
> > >     };
> > >
> > > -   remoteproc {
> > > +   rproc_lockstep: remoteproc@ffe00000 {
> > >             compatible = "xlnx,zynqmp-r5fss";
> > >             xlnx,cluster-mode = <1>;
> > >
> > > -           r5f-0 {
> > > +           #address-cells = <2>;
> > > +           #size-cells = <2>;
> > > +
> > > +           ranges = <0x0 0x0 0x0 0xffe00000 0x0 0x20000>,
> > > +                    <0x0 0x20000 0x0 0xffe20000 0x0 0x20000>,
> > > +                    <0x1 0x0 0x0 0xffe90000 0x0 0x10000>,
> > > +                    <0x1 0x20000 0x0 0xffeb0000 0x0 0x10000>;
> > > +
> > > +           r5f@0 {
> > > +                   compatible = "xlnx,zynqmp-r5f";
> > > +                   reg = <0x0 0x0 0x0 0x20000>, <0x0 0x20000 0x0 0x20000>;
> > > +                   reg-names = "atcm", "btcm";
> > > +                   power-domains = <&zynqmp_firmware PD_RPU_0>,
> > > +                                   <&zynqmp_firmware PD_R5_0_ATCM>,
> > > +                                   <&zynqmp_firmware PD_R5_0_BTCM>;
> > > +                   memory-region = <&rproc_0_fw_image>;
> > > +           };
> > > +
> > > +           r5f@1 {
> > > +                   compatible = "xlnx,zynqmp-r5f";
> > > +                   reg = <0x1 0x0 0x0 0x10000>, <0x1 0x20000 0x0 0x10000>;
> > > +                   reg-names = "atcm", "btcm";
> > > +                   power-domains = <&zynqmp_firmware PD_RPU_1>,
> > > +                                   <&zynqmp_firmware PD_R5_1_ATCM>,
> > > +                                   <&zynqmp_firmware PD_R5_1_BTCM>;
> > > +                   memory-region = <&rproc_1_fw_image>;
> > > +           };
> > > +   };
> > > +
> > > +   rproc_split: remoteproc-split@ffe00000 {
> > > +           status = "disabled";
> > > +           compatible = "xlnx,zynqmp-r5fss";
> > > +           xlnx,cluster-mode = <0>;
> > > +
> > > +           #address-cells = <2>;
> > > +           #size-cells = <2>;
> > > +
> > > +           ranges = <0x0 0x0 0x0 0xffe00000 0x0 0x10000>,
> > > +                    <0x0 0x20000 0x0 0xffe20000 0x0 0x10000>,
> > > +                    <0x1 0x0 0x0 0xffe90000 0x0 0x10000>,
> > > +                    <0x1 0x20000 0x0 0xffeb0000 0x0 0x10000>;
> > > +
> > > +           r5f@0 {
> > >                     compatible = "xlnx,zynqmp-r5f";
> > > -                   power-domains = <&zynqmp_firmware PD_RPU_0>;
> > > +                   reg = <0x0 0x0 0x0 0x10000>, <0x0 0x20000 0x0 0x10000>;
> > > +                   reg-names = "atcm", "btcm";
> > > +                   power-domains = <&zynqmp_firmware PD_RPU_0>,
> > > +                                   <&zynqmp_firmware PD_R5_0_ATCM>,
> > > +                                   <&zynqmp_firmware PD_R5_0_BTCM>;
> > >                     memory-region = <&rproc_0_fw_image>;
> > >             };
> > >
> > > -           r5f-1 {
> > > +           r5f@1 {
> > >                     compatible = "xlnx,zynqmp-r5f";
> > > -                   power-domains = <&zynqmp_firmware PD_RPU_1>;
> > > +                   reg = <0x1 0x0 0x0 0x10000>, <0x1 0x20000 0x0 0x10000>;
> > > +                   reg-names = "atcm", "btcm";
> > > +                   power-domains = <&zynqmp_firmware PD_RPU_1>,
> > > +                                   <&zynqmp_firmware PD_R5_1_ATCM>,
> > > +                                   <&zynqmp_firmware PD_R5_1_BTCM>;
> > >                     memory-region = <&rproc_1_fw_image>;
> > >             };
> > >     };
> >
> > Acked-by: Michal Simek <michal.simek@amd.com>
> >
> > Let me know if you want me to take this via my tree.
>
> Hi Michal,
>
> Thanks for reviews. I will ping you once driver changes are approved.

I'll pick this up with the rest of the driver.  It will be easier that way.

>
> Or Mathieu can take this in remoteproc tree, either way is fine.
>
> But I would like to wait till driver changes are approved.
>
> Tanmay
>
> >
> > Thanks,
> > Michal
