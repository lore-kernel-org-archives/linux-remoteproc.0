Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3FF167DB7;
	Wed, 30 Jul 2025 22:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753915711; cv=none; b=ZxVUZyxejvnsgET7CTh1zsp0owzk7+oyrE6yvTXewzhFxTtC5wtEs8U/qYHBgDOWgt3wC0lBknEOma1D0c9aIr3FOQIwrBTDxjbJL/oB77UZVaANB8eVm4uC3iAdScE5dgYEVyVTHC35BXbRxs30tcG1UD3iSpUZlUg5FpRdbZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753915711; c=relaxed/simple;
	bh=gKDRUSLxO4KYQEFLKEGt3wEeOK2rxZPX+4a6QetgkKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1IY287Mh+iCTqEDKMkyynvHI/Qt/B61EF/U2vFldGUC4wlaQnpfz0NaqBIZxjjRvAmB0+UNtXQd+3ODT7ReqjyqLrFN6T88yrF2jrFVEzTTOaJEDilwKGv1MlFoxY2wBXj7rJA/Lbrw0fm787c1gjGG2QFWWYjUC1+sOQr2bNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZimAU6Lo; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZimAU6Lo"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76bc5e68e26so425844b3a.0;
        Wed, 30 Jul 2025 15:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753915709; x=1754520509; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NP6vcGcK02YLX4Uh++vawCQkxiZgTHh/2PlbBRfDZHI=;
        b=ZimAU6Lo60LAsw1Dti4cNtS8iHUAWhzsQuVXgbZ5Acp+JuAKXa3REc1L4aiNpcLKe1
         fZhzmKWWQaicvXnW30+zA8jn3jKFt9dPSlWZJE6CFzEs+Vmm5pUTk8uyjn2tnEsFCAG2
         JBKTWF8BiefuKfJqovaOzDv3XXf1JjyS1Eiqs2vNx9BAt3mco76FOZc7uG6hi2sxelsb
         AmRsIO5Qox2zi5TbJNbxAK1Cx90Imal0WaXwuLS7AT+IiYBWZctPdrdrTc7+SS4RY5Du
         hck9KZSE/sk2FDynU4CiVsH9WGbuaNhrhKxD6LbcpCCLLisKBG/1hPNi3XgD1y6IbEYd
         akGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753915709; x=1754520509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NP6vcGcK02YLX4Uh++vawCQkxiZgTHh/2PlbBRfDZHI=;
        b=TCWQXSvmm0HE9FRDJgYvdg0M+28tcXEnkRvz0bmjKpKZ8lcxuSV26ihwBGrU7t8Aag
         kUrEQ2aahX0eOJW7dQ3kt+RWDwbcZr2IG6PuZiwzLBIYdfE6dhBWq2ASZmVx2Nhi7mUX
         zXUwUMsTM3inkUAXxGDloqAycXAQm5LE0ODQiXSI1Dvqg49YuIUEFHbXIL067DWpQIT/
         fbiH5Nvd+O5F+LaHThMTRrhR5EuovaDujCsdB3vC9qrSVXahPTITdGxqqvVLWSqIaIHR
         qSHEEGyks2JfCcTomgpTFSDjBpj6178S2aFhgy+l5DtzjCcmMAVBInWsFX126xZPuRgS
         HLZg==
X-Forwarded-Encrypted: i=1; AJvYcCVqfr7JK+LAWtAZ4QOIeJbMPBiPDKPfhde9r4vXrstjP2e4yEatV3sf5Lh/bbXM8Ve4StfuD3gou5isTpde@vger.kernel.org, AJvYcCXK3/X5q8DtmN3grPtnZLNlOZ0iL0wpLwV//SgweWBZWG+Su3OFoHFhQ1S3mKcnYh4DMoBY5fAaHG+2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+uIughuqM8IkIG9lJ2QU5DAYM2zzNQkRtnR2xJSYh8ATBircA
	LoBx4lSqp7KdW46S8qwUQZH7Tidqk7kS06I56+wxcld3TfgpmDp6Dj9O
X-Gm-Gg: ASbGncvC/4yFQBvclatGG97RdtOfH/JAMwGTy88sF2JgviSZiaOca72vLZBhnCZiONS
	sMO3JTDxNyyrbvJ7yDC830AiK6htmDxZQBPRZjsnxtqcBzPq7PpFCtKbMlaKEY6ox1ImNVDwwvx
	I3bfBtYcqKNgC2bfocFkHCDKiK1li8+xPJKS/8fzLetjw24YUz/Ylh4JchRn60ERg2Y5bvdFtwL
	T/NrJPYN/3tpACFHy4kSvmjS6E0bLwSY8v/sJ3KTamUpyycUP4EnVc8SN88Ci3TzsE9jT4GShC8
	5+/c3DOiAk5yKf7+X+AcO5MFHQOiBjY43a1gqESkyOPRm9vxEB4GkgEEpUKYXr4rqUk14lkm/Uk
	GFnTIhVaIpzA6CtLwdLWQ6w==
X-Google-Smtp-Source: AGHT+IHdHRz5ygZhpTYyipXzL2+kQpjXt95ma7h5f7Ng2oXDH8vIiDfPKBBpkWpLagLHgSt57lXBqQ==
X-Received: by 2002:a17:902:e80e:b0:234:8ec1:4af6 with SMTP id d9443c01a7336-24096b4158dmr76980525ad.45.1753915709361;
        Wed, 30 Jul 2025 15:48:29 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-241e8976a06sm1475055ad.81.2025.07.30.15.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 15:48:28 -0700 (PDT)
Date: Thu, 31 Jul 2025 06:47:51 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Inochi Amaoto <inochiama@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: Add C906L rproc for
 Sophgo CV1800B SoC
Message-ID: <fm3ayx67ip4km5qhn77v7s76bo5iyppmbrxhbcqdbc4pz2zstb@fbrishsvcazn>
References: <bfvsmafcsxy4gr4dsprn4z4yl2lltgje2oilsny7vanb7rsolq@t2prbsfisioc>
 <1856fbcb55769ae0.5ecf256b8267239e.f51806827c8576a5@Jude-Air.local>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1856fbcb55769ae0.5ecf256b8267239e.f51806827c8576a5@Jude-Air.local>

On Wed, Jul 30, 2025 at 08:59:15AM +0000, Junhui Liu wrote:
> On 30/07/2025 14:05, Inochi Amaoto wrote:
> > On Wed, Jul 30, 2025 at 03:57:09AM +0000, Junhui Liu wrote:
> >> On 29/07/2025 16:31, Inochi Amaoto wrote:
> >> > On Mon, Jul 28, 2025 at 07:03:23PM +0800, Junhui Liu wrote:
> >> >> Add C906L remote processor for CV1800B SoC, which is an asymmetric
> >> >> processor typically running RTOS.
> >> >> 
> >> >> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> >> >> ---
> >> >>  .../bindings/remoteproc/sophgo,cv1800b-c906l.yaml  | 79 ++++++++++++++++++++++
> >> >>  1 file changed, 79 insertions(+)
> >> >> 
> >> >> diff --git a/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
> >> >> new file mode 100644
> >> >> index 0000000000000000000000000000000000000000..2061c2fd6ba343c09b1a91700ea4a695d2b57f81
> >> >> --- /dev/null
> >> >> +++ b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
> >> >> @@ -0,0 +1,79 @@
> >> >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >> >> +%YAML 1.2
> >> >> +---
> >> >> +$id: http://devicetree.org/schemas/remoteproc/sophgo,cv1800b-c906l.yaml#
> >> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> >> +
> >> >> +title: Sophgo C906L remote processor controller for CV1800B SoC
> >> >> +
> >> >> +maintainers:
> >> >> +  - Junhui Liu <junhui.liu@pigmoral.tech>
> >> >> +
> >> >> +description:
> >> >> +  Document the bindings for the C906L remoteproc component that loads and boots
> >> >> +  firmwares on the CV1800B SoC.
> >> >> +
> >> >> +properties:
> >> >> +  compatible:
> >> >> +    const: sophgo,cv1800b-c906l
> >> >> +
> >> >> +  firmware-name:
> >> >> +    maxItems: 1
> >> >> +
> >> >> +  mbox-names:
> >> >> +    items:
> >> >> +      - const: tx
> >> >> +      - const: rx
> >> >> +
> >> >> +  mboxes:
> >> >> +    description:
> >> >> +      This property is required only if the rpmsg/virtio functionality is used.
> >> >> +      (see mailbox/sophgo,cv1800b-mailbox.yaml)
> >> >> +    items:
> >> >> +      - description: mailbox channel to send data to C906L
> >> >> +      - description: mailbox channel to receive data from C906L
> >> >> +
> >> >> +  memory-region:
> >> >> +    description:
> >> >> +      List of phandles to reserved memory regions used by the remote processor.
> >> >> +      The first region is required and provides the firmware region for the
> >> >> +      remote processor. The following regions (vdev buffer, vrings) are optional
> >> >> +      and are only required if rpmsg/virtio functionality is used.
> >> >> +    minItems: 1
> >> >> +    items:
> >> >> +      - description: firmware region
> >> >> +      - description: vdev buffer
> >> >> +      - description: vring0
> >> >> +      - description: vring1
> >> >> +    additionalItems: true
> >> >> +
> >> > 
> >> > Why not allocating these region dynamicly? I do not think firware is
> >> > always avaible before staring. Allowing dynamic firmware give us max
> >> > flexiblity.
> >> 
> >> I'm afraid it's not easy to do this.
> >> 
> >> For firmware region, the RTOS firmware usually needs a physical address
> >> to link to, and I have researched and tested two RTOS (RT-Thread and
> >> Zephyr) on the C906L, both of them do not support position-independent
> >> execution or runtime relocation. Therefore, a reserved memory region is
> >> needed to provide a fixed physical address for the RTOS firmware.
> > 
> > I think it is simple and possible to add PIE support for these RTOS. As
> > the memory of CV18XX is limited, I do not want to see some reserved
> > regions. This may hurt users who do not need this.
> 
> Thank you for sharing your concern about the limited memory.
> 
> However, I think I have to wait until some RTOS supports PIE before I
> can continue to advance this patch series. At least I haven't found any
> guide on compiling RTOS firmware with PIE support for the two RTOSs
> (RT-Thread and Zephyr) I'm currently testing on the C906L.
> 
> Besides, I have searched the existing remoteproc drivers in the kernel,
> and haven't found any driver using dynamic memory allocation for the
> firmware region. It may take some time to implement this feature if we
> really need it on CV18XX SoCs.
> 
> > 
> >> (In fact, there is already a reserved memory region for the C906L in
> >> cv1800b-milkv-duo.dts)
> > 
> > This is just preserved for vendor zsbl and I have a plan to remove it.
> > Always let linux take care of all memory. It is good to support all
> > firmware implementation for CV18XX.
> 
> Got it.
> 
> > 
> > I think it is always good to use remoteproc like this:
> > https://www.kernel.org/doc/html/latest/staging/remoteproc.html
> > 
> >> 
> >> For virtio-related regions, the RTOS firmware also needs to know the
> >> shared memory regions for communications at compile time.
> >> 
> > 
> > I think you should investigate this and check if there is something you
> > missed. I haven't see any reserved region in remoteproc binding mentions
> > virtio.
> 

> Currently, in Zephyr, the only boards with OpenAMP sample support are
> the i.MX and STM32MP series [1]. Both of them define reserved memory
> regions for virtio and vrings in their respective Linux kernel device
> trees [2][3]. These are the only available reference targets I have at
> the moment.
> 
> Furthermore, searching for the keyword "vring" in the remoteproc
> bindings yields many results, which I believe mostly pertain to reserved
> memory regions for rpmsg/virtio.
> 
> $grep "vring" -r Documentation/devicetree/bindings/remoteproc | wc -l
> 24
> 

#grep -rl vring | wc -l
9

In fact, it seems not many boards add vring as memory region,
But for simplifity, it is OK for me to leave the vring as an
fixed region. Or just not support virtio at all... I see the
document of OpenAMP says it support no-virtio mode.

> So, at present, all my references use reserved memory for firmware
> regions (unless there is specific memory for the processor in hardware)
> and for virtio-related regions. Do you think there is anything I might
> have missed, or should some new feature be implemented?
> 
> [1] https://github.com/zephyrproject-rtos/zephyr/tree/main/samples/subsys/ipc/openamp_rsc_table/boards
> [2] https://github.com/torvalds/linux/blob/v6.16/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi#L33-L49
> [3] https://github.com/torvalds/linux/blob/v6.16/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts#L68-L97
> 

Great, I think it is convincing. Thanks.

Regards,
Inochi
