Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH 6/8] remoteproc: Move resource table load logic to find
Date: Thu, 14 Dec 2017 20:12:19 +0000
Message-ID: <708d06ce6cb540e785c34bd0a1d2d083@SFHDAG7NODE2.st.com>
References: <20171213224111.17864-1-bjorn.andersson@linaro.org>
 <20171213224111.17864-7-bjorn.andersson@linaro.org>
 <04d54471292f446898fd162afd15388f@SFHDAG7NODE2.st.com>
 <20171214194747.GV17344@builder>
In-Reply-To: <20171214194747.GV17344@builder>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: linux-remoteproc-owner@vger.kernel.org [mailto:linux-remoteproc-
> owner@vger.kernel.org] On Behalf Of Bjorn Andersson
> Sent: Thursday, December 14, 2017 8:48 PM
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: Ohad Ben-Cohen <ohad@wizery.com>; linux-
> remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH 6/8] remoteproc: Move resource table load logic to fi=
nd
>=20
> On Thu 14 Dec 04:00 PST 2017, Loic PALLARDY wrote:
> > > -----Original Message-----
> > > From: linux-remoteproc-owner@vger.kernel.org [mailto:linux-
> remoteproc-
> > > owner@vger.kernel.org] On Behalf Of Bjorn Andersson
> [..]
> > > +int rproc_elf_load_rsc_table(struct rproc *rproc, const struct firmw=
are
> *fw)
> > >  {
> > >  	struct elf32_hdr *ehdr;
> > >  	struct elf32_shdr *shdr;
> > >  	struct device *dev =3D &rproc->dev;
> > >  	struct resource_table *table =3D NULL;
> > >  	const u8 *elf_data =3D fw->data;
> > > +	size_t tablesz;
> > >
> > >  	ehdr =3D (struct elf32_hdr *)elf_data;
> > >
> > >  	shdr =3D find_table(dev, ehdr, fw->size);
> > >  	if (!shdr)
> > > -		return NULL;
> > > +		return -EINVAL;
> > Reading patch 7, I don't catch how firmware without resource table are
> > supported as if no table found, an error is returned here.
> > In rproc_fw_boot, you have:
> > 	ret =3D rproc_load_rsc_table(rproc, fw);
> > 	if (ret)
> > 		goto disable_iommu;
> > So boot process is interrupted...
> >
>=20
> When a driver registers a remoteproc with load_rsc_table specified that
> implies that the resource table is not optional as such it's an error to
> not find one.
>=20
> A driver that expects to load firmware without a resource table, such as
> st_slim_rproc with it's dummy resource table would set load_rsc_table to
> NULL.
Yes I saw that if no load_rsc_table, 0 is returned. Thanks for the explanat=
ions, I'll apply the series and review final code.
Regards,
Loic
>=20
>=20
> So the purpose is to maintain the current requirements, with the
> addition of removing the dummy implementations of find_rsc_table.
>=20
> Regards,
> Bjorn
> --
> To unsubscribe from this list: send the line "unsubscribe linux-remotepro=
c" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
