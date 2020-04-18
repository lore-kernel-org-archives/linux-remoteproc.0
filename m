Return-Path: <peng.fan@nxp.com>
From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH 2/2] remoteproc: use filesz as backup when translate memsz
 fail
Date: Sat, 18 Apr 2020 09:10:11 +0000
Message-ID: 
 <DB6PR0402MB2760C900A4838657D82023F088D60@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <1586420572-28353-1-git-send-email-peng.fan@nxp.com>
 <1586420572-28353-2-git-send-email-peng.fan@nxp.com>
 <20200410012226.GV20625@builder.lan> <20200417192155.GA6797@xps15>
In-Reply-To: <20200417192155.GA6797@xps15>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

> Subject: Re: [PATCH 2/2] remoteproc: use filesz as backup when translate
> memsz fail
>=20
> On Thu, Apr 09, 2020 at 06:22:26PM -0700, Bjorn Andersson wrote:
> > On Thu 09 Apr 01:22 PDT 2020, Peng Fan wrote:
> >
> > > Since we no need memset if memsz is larger than filesz, we could use
> > > filesz for the da to va translation when memsz translation fail.
> > >
> >
> > To me this implies that the firmware has a segment that's larger than
> > the memory that it's going to run in. I think even if we're not
> > writing to the entire memsz, asking da_to_va for the entire memsz
> > provides a valuable sanity check.
> >
> > Regards,
> > Bjorn
> >
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  drivers/remoteproc/remoteproc_elf_loader.c | 12 ++++++++++--
> > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/remoteproc_elf_loader.c
> > > b/drivers/remoteproc/remoteproc_elf_loader.c
> > > index cc50fe70d50c..74d425a4b34c 100644
> > > --- a/drivers/remoteproc/remoteproc_elf_loader.c
> > > +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> > > @@ -229,8 +229,16 @@ int rproc_elf_load_segments(struct rproc *rproc,
> const struct firmware *fw)
> > >  		if (!ptr) {
> > >  			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
> > >  				memsz);
> > > -			ret =3D -EINVAL;
> > > -			break;
> > > +
> > > +			ptr =3D rproc_da_to_va(rproc, da, filesz);
> > > +			if (!ptr) {
> > > +				dev_err(dev,
> > > +					"bad phdr da 0x%llx mem 0x%llx\n",
> > > +					da, filesz);
> > > +				ret =3D -EINVAL;
> > > +				break;
> > > +			}
> > > +
>=20
> Adding to Bjorn's comment, I think if rproc_da_to_va() fails with memsz b=
ut
> succeeds with filesz something went wrong with how memory was laid out in
> the DT or the ELF resources.  To me this patch offers the wrong solution =
- the
> focus should be on why rproc_da_to_va() fails.

ok, I'll send out patch to fix imx_rproc. It is TCML and TCMU are not mappe=
d continusly.

Thanks,
Peng.

>=20
> Thanks,
> Mathieu
>=20
> > >  		}
> > >
> > >  		/* put the segment where the remote processor expects it */
> > > --
> > > 2.16.4
> > >
