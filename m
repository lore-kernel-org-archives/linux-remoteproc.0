Return-Path: <peng.fan@nxp.com>
From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH 1/2] remoteproc: drop memset when loading elf segments
Date: Fri, 10 Apr 2020 01:29:59 +0000
Message-ID: 
 <AM0PR04MB44816C59A9BE84465AC8F2C388DE0@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <1586420572-28353-1-git-send-email-peng.fan@nxp.com>
 <20200410012034.GU20625@builder.lan>
In-Reply-To: <20200410012034.GU20625@builder.lan>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

> Subject: Re: [PATCH 1/2] remoteproc: drop memset when loading elf
> segments
>=20
> On Thu 09 Apr 01:22 PDT 2020, Peng Fan wrote:
>=20
> > To arm64, "dc      zva, dst" is used in memset.
> > Per ARM DDI 0487A.j, chapter C5.3.8 DC ZVA, Data Cache Zero by VA,
> >
> > "If the memory region being zeroed is any type of Device memory, this
> > instruction can give an alignment fault which is prioritized in the
> > same way as other alignment faults that are determined by the memory
> > type."
> >
> > On i.MX platforms, when elf is loaded to onchip TCM area, the region
> > is ioremapped, so "dc zva, dst" will trigger abort.
> >
> > Since memset is not strictly required, let's drop it.
> >
>=20
> This would imply that we trust that the firmware doesn't expect remotepro=
c
> to zero out the memory, which we've always done. So I don't think we can =
say
> that it's not required.

Saying an image runs on a remote core needs Linux to help zero out BSS sect=
ion,
this not make sense to me. My case is as following, I need to load section =
7 data.
I no need to let remoteproc to memset section 8/9/10/11/12, the firmware it=
self
could handle that. Just because the memsz is larger than filesz, remoreproc=
 must
memset?
Section Headers:
  [Nr] Name              Type            Addr     Off    Size   ES Flg Lk I=
nf Al
  [ 0]                   NULL            00000000 000000 000000 00      0  =
 0  0
  [ 1] .interrupts       PROGBITS        1ffe0000 010000 000240 00   A  0  =
 0  4
  [ 2] .resource_table   PROGBITS        1ffe0240 010240 000058 00   A  0  =
 0  1
  [ 3] .text             PROGBITS        1ffe02a0 0102a0 009ccc 00  AX  0  =
 0 16
  [ 4] .ARM              ARM_EXIDX       1ffe9f6c 019f6c 000008 00  AL  3  =
 0  4
  [ 5] .init_array       INIT_ARRAY      1ffe9f74 019f74 000004 04  WA  0  =
 0  4
  [ 6] .fini_array       FINI_ARRAY      1ffe9f78 019f78 000004 04  WA  0  =
 0  4
  [ 7] .data             PROGBITS        1fff9240 029240 000084 00  WA  0  =
 0  4
  [ 8] .ncache.init      PROGBITS        1fff92c4 0292c4 000000 00   W  0  =
 0  1
  [ 9] .ncache           NOBITS          1fff92c4 0292c4 000a80 00  WA  0  =
 0  4
  [10] .bss              NOBITS          1fff9d44 0292c4 01f5c0 00  WA  0  =
 0  4
  [11] .heap             NOBITS          20019304 0292c4 000404 00  WA  0  =
 0  1
  [12] .stack            NOBITS          20019708 0292c4 000400 00  WA  0  =
 0  1

>=20
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/remoteproc_elf_loader.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/remoteproc/remoteproc_elf_loader.c
> > b/drivers/remoteproc/remoteproc_elf_loader.c
> > index 16e2c496fd45..cc50fe70d50c 100644
> > --- a/drivers/remoteproc/remoteproc_elf_loader.c
> > +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> > @@ -238,14 +238,11 @@ int rproc_elf_load_segments(struct rproc *rproc,
> const struct firmware *fw)
> >  			memcpy(ptr, elf_data + offset, filesz);
> >
> >  		/*
> > -		 * Zero out remaining memory for this segment.
> > +		 * No need zero out remaining memory for this segment.
> >  		 *
> >  		 * This isn't strictly required since dma_alloc_coherent already
> > -		 * did this for us. albeit harmless, we may consider removing
> > -		 * this.
> > +		 * did this for us.
>=20
> In the case of recovery this comment is wrong, we do not
> dma_alloc_coherent() the carveout during a recovery.

Isn't the it the firmware's job to memset the region?

>=20
> And in your case you ioremapped existing TCM, so it's never true.
>=20
> >  		 */
> > -		if (memsz > filesz)
> > -			memset(ptr + filesz, 0, memsz - filesz);
>=20
> So I think you do want to zero out this region. Question is how we do it.=
..

I have contacted our M4 owners, we no need clear it from Linux side.
We also support booting m4 before booting Linux, at that case, Linux has
noting to do with memset. It is just I try loading m4 image with Linux,
and met the issue that memset trigger abort.

Thanks,
Peng.

>=20
> Regards,
> Bjorn
>=20
> >  	}
> >
> >  	if (ret =3D=3D 0)
> > --
> > 2.16.4
> >
