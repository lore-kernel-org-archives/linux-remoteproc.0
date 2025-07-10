Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701B62741D1;
	Thu, 10 Jul 2025 15:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752162409; cv=none; b=iPKBU8cEl/EjrbFnNkKE34ouP5g+HhJlC65At0npG9/tTC3GjR6xMa1GwbHaIW+4BhTWPY4kTRpZXNIMZLUqQWjB+iQnCNDP5Yak/LumPcppLQuUY19rDmrS3gnwj8nj2BnD6CwEB4ljCDZNbwteNRIewLuJAQb3GqDqXCfBirg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752162409; c=relaxed/simple;
	bh=Meep8S48rXAr1IiHgTpdK/u6t6UuePEWQ1OMpVBq18U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J3cqetN19CkKdrePNOywdnTRL8WNGmyiLNz7Lxna1uuvbQVny7k2r5id/O7BmsalG9LmTm8zN9va8DdgyfZgS5c7FlyGgu4vAeiIU+kgjhEUhyqf4qmp2LRc1qwyhUw3bW6VDH2NcueO3p38W/MTogLLGt4Je/TDliaMBiGM+Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7VFboe7; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7VFboe7"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2353a2bc210so12553225ad.2;
        Thu, 10 Jul 2025 08:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752162407; x=1752767207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d8s8aI5nykbObjyK4zFELHxY4NnJWT0iSTl57boBPsE=;
        b=b7VFboe7VT27VWIGUm4b1LccMehClv0EZckIL/ehFCc8jcAeBuHXU71iZ69DApmg0Y
         1QX5WXAAGwPlX0w7jCcjT/xWtIyDoROjFb4/FXB+BEZD9yNBhjqLmJMG4BsoMQuOYtNX
         MpWK2HUoNz0zHxpI4C0GKvdBR3nJKM3ZVHgsjZmBEZtbgM38tmbcu5sUXWOQWngn0LtE
         OZImBSQ1bObroydJRzrYa3ZYBeQJWvJUNZ3OdFwmVf+4W3ymcCDShI0IKMxw7eBfxgrL
         RFZe8GKC3hQ+Cy8wx+fWcuAWkLFVBUPtBmxqS4LnfxtFp2s5P4YNtZ86ZkWJF0mpQ+ap
         HUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162407; x=1752767207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8s8aI5nykbObjyK4zFELHxY4NnJWT0iSTl57boBPsE=;
        b=brphaq3hMRWLlt9gL+MCokkqjrW0UvdHbXpkTxG/rbboE+qMVlEgg8lSUR3SBeBFs8
         tuQgG6B56qYqMJmBRUXxGu7fWD7D6JNcsQugwSAjcoCPyhf9Xt7EOLVXzMQ0DGG+p02R
         J/MjE9hhJ8L/eEaQJfzAKkjI3zuv2BhnFESuJSgOvCC++dYlXQ6Cg5n9mkHPwLH06iGQ
         RZni0zuQTt8PgZX9Iwm+HW9uMc3D8SAyUT+ZCFyGQYzJYhccW1vJKRxPtDv7y8Eyx18V
         RlTP7kB0aKMOZHetb8yKnj+Wm3vpQOEN//KDfoxY3Shs+ENIis6S5vKwaQdExacTtnuH
         zJbw==
X-Forwarded-Encrypted: i=1; AJvYcCUgwb+Ij1eWthKvSuHeJspQ/OCY30Xtb/NtIb/nJIi5ZC8DsT61vYIXLcBOHyc3dCUDH0pTq6N63S1vjfs=@vger.kernel.org, AJvYcCXC/YEn5pmrx+MgRbmlyPkYQJNUuEJ3Da+ivsas9NEh8pC2jsyi7uYHMOZd2HJaQbs+VKTzBnhvZ0r4EZM7vKarnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6GdgIzNU8NgyHPIMhBk7wkoMOYQXYeiwWflzNNMOlzIk1CpW7
	g9hX3sbCibOUO5+cVgw1n5df0L5f2tlsbnUXBiT9GGTyQf3hJ+WXqa00dw608oXI
X-Gm-Gg: ASbGncsOePrqoKkkxi0skc/+e1aSvrOJ56O+fjt9zQf8C5vuufqsVm+KlBpulwGogAe
	n5CtGN5A40DnhUEKq36p0x3bTylhgy5WNTNo7090HZi63bhOLR1hAVolnvJYvod2dtD1PLH52sg
	brLrKEUwC9F7+5YsF44CA1Y7oUKwoVMb4byrmcqVHw7B8s+4X0zkzge2Io5yvFJDUaMBWpyYEk6
	qcuGLQ5IFTc8s0VimfPDAPFP/AHQpCHQold6jzoNMZAN1NFfMAsRWDB0MeKHcOrwPp1/9KAWXCz
	kvPghcrdwwQk4pmr9vUHL+vTAy4lRlfN7ZNViZ0yGuFPN8ThzXEA5t4zn4Y=
X-Google-Smtp-Source: AGHT+IEqqSp2Bx4H9HZGWjwyRbPvR+vWlgwLlpuGUtnloA4G9XjlM92Y9Stck87gfHrX+jJIWpVO8w==
X-Received: by 2002:a17:902:ec88:b0:235:225d:30a2 with SMTP id d9443c01a7336-23de2512cecmr66021745ad.48.1752162406466;
        Thu, 10 Jul 2025 08:46:46 -0700 (PDT)
Received: from hiagonb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4365b10sm23794255ad.240.2025.07.10.08.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:46:45 -0700 (PDT)
Date: Thu, 10 Jul 2025 12:46:39 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>,
	Ritesh Kumar <ritesh.kumar@toradex.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: merge ITCM and DTCM regions
Message-ID: <20250710154639.hmbmzpaizhxqodqk@hiagonb>
References: <20250703130831.18830-1-hiagofranco@gmail.com>
 <aGgAbwToGhsc5VV9@p14s>
 <20250704190816.kth7bdf34ufc2ht6@hiagonb>
 <aGvyDp36iWv5UQ19@p14s>
 <20250708172953.rbsvk6gy4xuxo42l@hiagonb>
 <20250709082652.GA15057@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709082652.GA15057@nxa18884-linux>

On Wed, Jul 09, 2025 at 04:26:52PM +0800, Peng Fan wrote:
> On Tue, Jul 08, 2025 at 02:29:53PM -0300, Hiago De Franco wrote:
> >Hi Peng, Mathieu,
> >
> >On Mon, Jul 07, 2025 at 10:13:02AM -0600, Mathieu Poirier wrote:
> >> On Fri, Jul 04, 2025 at 04:08:16PM -0300, Hiago De Franco wrote:
> >> > Hi Mathieu,
> >> > 
> >> > On Fri, Jul 04, 2025 at 10:25:19AM -0600, Mathieu Poirier wrote:
> >> > > Good morning,
> >> > > 
> >> > > On Thu, Jul 03, 2025 at 10:08:31AM -0300, Hiago De Franco wrote:
> >> > > > From: Hiago De Franco <hiago.franco@toradex.com>
> >> > > > 
> >> > > > Merge the contiguous ITCM and DTCM regions into a single region to
> >> > > > prevent failures when loading ELF files with large sections:
> >> > > > 
> >> > > > remoteproc remoteproc0: powering up imx-rproc
> >> > > > remoteproc remoteproc0: Booting fw image rproc-imx-rproc-fw, size 151824
> >> > > > imx-rproc imx8mp-cm7: Translation failed: da = 0x1f48 len = 0x1fcb0
> >> > > > remoteproc remoteproc0: bad phdr da 0x1f48 mem 0x1fcb0
> >> > > > remoteproc remoteproc0: Failed to load program segments: -22
> >> > > > remoteproc remoteproc0: Boot failed: -22
> >> > > > 
> >> > > > This approach is the same as commit 8749919defb8 ("remoteproc:
> >> > > > imx_rproc: Merge TCML/U").
> >> > > > 
> >> > > > Suggested-by: Ritesh Kumar <ritesh.kumar@toradex.com>
> >> > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> >> > > > ---
> >> > > > Hi,
> >> > > > 
> >> > > > The ELF I tested had the following data section:
> >> > > > 
> >> > > > Memory region         Used Size  Region Size  %age Used
> >> > > >     m_interrupts:         680 B         1 KB     66.41%
> >> > > >           m_text:        6984 B       127 KB      5.37%
> >> > > >           m_data:      130224 B       128 KB     99.35%
> >> > > >          m_data2:          0 GB        16 MB      0.00%
> >> > > > [100%] Built target hello_world_cm7.elf
> >> > > > 
> >> > > > Which triggered the error. After this patch, remoteproc was able to boot
> >> > > > and work fine. Thanks!
> >> > > > ---
> >> > > >  drivers/remoteproc/imx_rproc.c | 6 ++----
> >> > > >  1 file changed, 2 insertions(+), 4 deletions(-)
> >> > > > 
> >> > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> >> > > > index 74299af1d7f1..bbf089ef48ee 100644
> >> > > > --- a/drivers/remoteproc/imx_rproc.c
> >> > > > +++ b/drivers/remoteproc/imx_rproc.c
> >> > > > @@ -166,8 +166,8 @@ static const struct imx_rproc_att imx_rproc_att_imx8qxp[] = {
> >> > > >  
> >> > > >  static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
> >> > > >  	/* dev addr , sys addr  , size	    , flags */
> >> > > > -	/* ITCM   */
> >> > > > -	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
> >> > > > +	/* D/ITCM */
> >> > > > +	{ 0x00000000, 0x007E0000, 0x00040000, ATT_OWN | ATT_IOMEM },
> >> > > >  	/* OCRAM_S */
> >> > > >  	{ 0x00180000, 0x00180000, 0x00009000, 0 },
> >> > > >  	/* OCRAM */
> >> > > > @@ -180,8 +180,6 @@ static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
> >> > > >  	{ 0x08000000, 0x08000000, 0x08000000, 0 },
> >> > > >  	/* DDR (Code) - alias */
> >> > > >  	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
> >> > > > -	/* DTCM */
> >> > > > -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },
> >> > > 
> >> > > In commit 8749919defb8 "dev addr" and "sys addr" were both contiguous, but in
> >> > > this patch "dev addr" is not.  How will this work with new kernel that use old
> >> > > FW images?  Am I missing something?
> >> > 
> >> > No, you are correct, I think the use case I tested was not good enough.
> >> > 
> >> > If I understand correctly, this will break older firmware expecting
> >> > .data at 0x20000000 because dev_addr is no longer mapped for DTCM entry.
> >> > 
> >> 
> >> Correct.  Older firmware would still expect DTCM at 0x20000000.
> >> 
> >> 
> >> > Do you think it is possible (or reccomend) another approach to fix this
> >> > issue? In this case to keep using the TCM, instead of going to OCRAM or
> >> > DDR.
> >> >
> >> 
> >> To me the best way to proceed is understand why using the current mapping is a
> >> problem.  The changelog describes a failure condition when dealing with large
> >> sections but does not indicate _why_ that is happening.  I think that's what
> >> needs to be fixed rather than trying to move mappings around.
> >
> >Thanks for the information you both provided, sorry for the noise, so
> >please Mathieu ignore this patch. I will work around this in a different
> >way.
> >
> >By the way, Peng, I noticed the DDR linker from MCUXpresso does not work
> >if the firmware is larger than 128KB, since the .data is placed right
> >after .text and loaded later to DDR. The imx_rproc driver should instead
> >have a way to do the other way around: starting from the firwmare inside
> >DDR, we could set PC and stack from M7 to point to DDR and start the
> >execution. Probably will be slower, but it would make the DDR case
> >possible.
> 
> I am not aware of the size limitation if image is built to run in DDR.
> It maybe MCUXpresso team just reuse the linker script for TCM and only
> update the link address.
> 
> You could update the linker script to build larger image.
> 
> In final elf, .data is put just after .text, but the related section
> loading address should be specified as my understanding. See below,
> .data is at 0x20000000 for M7.
> 
> xx-gcc -S imx8mn_m7_TCM_rpmsg_lite_str_echo_rtos.elf
> There are 20 section headers, starting at offset 0xc998:
> 
> Section Headers:
>   [Nr] Name              Type            Addr     Off    Size   ES Flg Lk Inf Al
>   [ 0]                   NULL            00000000 000000 000000 00      0   0  0
>   [ 1] .interrupts       PROGBITS        00000000 001000 000240 00   A  0   0  4
>   [ 2] .resource_table   PROGBITS        00000240 001240 000058 00   A  0   0  1
>   [ 3] .text             PROGBITS        000002a0 0012a0 0046b0 00  AX  0   0 16
>   [ 4] .ARM              ARM_EXIDX       00004950 005950 000008 00  AL  3   0  4
>   [ 5] .init_array       INIT_ARRAY      00004958 005958 000004 04  WA  0   0  4
>   [ 6] .fini_array       FINI_ARRAY      0000495c 00595c 000004 04  WA  0   0  4
>   [ 7] .data             PROGBITS        20000000 006000 00000c 00  WA  0   0  4
>   [ 8] .ncache.init      PROGBITS        80000000 00600c 000000 00   W  0   0  1
>   [ 9] .ncache           PROGBITS        80000000 00600c 000000 00   W  0   0  1
>   [10] .bss              NOBITS          2000000c 00600c 00a4ac 00  WA  0   0  4
>   [11] .heap             NOBITS          2000a4b8 00600c 000400 00  WA  0   0  1
>   [12] .stack            NOBITS          2000a8b8 00600c 000400 00  WA  0   0  1
>   [13] .ARM.attributes   ARM_ATTRIBUTES  00000000 00600c 000030 00      0   0  1
>   [14] .debug_line_str   PROGBITS        00000000 00603c 0002b1 01  MS  0   0  1
>   [15] .comment          PROGBITS        00000000 0062ed 000055 01  MS  0   0  1
>   [16] .debug_frame      PROGBITS        00000000 006344 000260 00      0   0  4
>   [17] .symtab           SYMTAB          00000000 0065a4 003cd0 10     18 586  4
>   [18] .strtab           STRTAB          00000000 00a274 002664 00      0   0  1
>   [19] .shstrtab         STRTAB          00000000 00c8d8 0000bd 00      0   0  1
> 
> >
> >Correct me if I am wrong, but as my current understanding the DDR linker
> >is broken without this change to the driver. Anyway, maybe something for
> >a future patch.
> 
> If you wanna image in DDR, you could specifiy the address of data section
> in your linker script.
> 
> But for support ddr elf file, you need patches as below:
> https://lore.kernel.org/linux-arm-kernel/CAEnQRZC5t=qmo+OJLW+dqZg4gH9cAN=paWDSGbrJb2AvkKBqxg@mail.gmail.com/T/#ec54c42b70416b002936a643b44b79661dd2a8483
> This patchset was rejected, because we need to get stack/pc from .interrupts
> section and store to ITCM.
> 
> Latest NXP m7 demo has included a new section for stack/pc, but
> this will only be public in 2025 Q3 release, for pre-2025-Q3 releases,
> still need the upper patchset.

Great, thanks for all the information Peng. I will inform my team here.

Best regards,
Hiago.

> 
> Regards,
> Peng
> 
> >
> >Thanks,
> >Hiago.
> >
> >>  
> >> > Thanks,
> >> > Hiago.
> >> > 
> >> > > 
> >> > > Thanks,
> >> > > Mathieu
> >> > > 
> >> > > >  	/* OCRAM_S - alias */
> >> > > >  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
> >> > > >  	/* OCRAM */
> >> > > > -- 
> >> > > > 2.39.5
> >> > > > 
