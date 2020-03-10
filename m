Return-Path: <cleger@kalray.eu>
Date: Tue, 10 Mar 2020 16:38:19 +0100 (CET)
From: =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalrayinc.com>
Message-ID: <371773363.9138477.1583854699708.JavaMail.zimbra@kalray.eu>
In-Reply-To: <20200310152031.GA25781@xps15>
References: <20200210162209.23149-1-cleger@kalray.eu> <20200302093902.27849-1-cleger@kalray.eu> <20200302093902.27849-6-cleger@kalray.eu> <20200302231342.GE262924@yoga> <482678048.7666348.1583222551942.JavaMail.zimbra@kalray.eu> <20200310000005.GF14744@builder> <20200310152031.GA25781@xps15>
Subject: Re: [PATCH v5 5/8] remoteproc: Rename rproc_elf_sanity_check for
 elf32
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Jonathan Corbet <corbet@lwn.net>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-remoteproc <linux-remoteproc@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>, Patrice Chotard <patrice.chotard@st.com>, linux-doc <linux-doc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Mathieu,

----- On 10 Mar, 2020, at 16:20, Mathieu Poirier mathieu.poirier@linaro.org=
 wrote:

> On Mon, Mar 09, 2020 at 05:00:05PM -0700, Bjorn Andersson wrote:
>> On Tue 03 Mar 00:02 PST 2020, Cl?ment Leger wrote:
>>=20
>> > Hi Bjorn,
>> >=20
>> > ----- On 3 Mar, 2020, at 00:13, Bjorn Andersson bjorn.andersson@linaro=
.org
>> > wrote:
>> >=20
>> > > On Mon 02 Mar 01:38 PST 2020, Clement Leger wrote:
>> > >=20
>> > >> Since this function will be modified to support both elf32 and elf6=
4,
>> > >> rename the existing one to elf32 (which is the only supported forma=
t
>> > >> at the moment). This will allow not to introduce possible side effe=
ct
>> > >> when adding elf64 support (ie: all backends will still support only
>> > >> elf32 if not requested explicitely using rproc_elf_sanity_check).
>> > >>=20
>> > >=20
>> > > Is there a reason for preventing ELF64 binaries be loaded?
>> >=20
>> > I decided to go this way to let driver maintainer decide if they want
>> > to support elf64 to avoid problems with 64bits addresses/sizes which d=
o
>> > not fit in their native type (size_t for instance). This is probably
>> > not going to happen and there are additionnal checks before calling
>> > rproc_da_to_va. And addresses should be filtered by rproc_da_to_va.
>> > So, actually it seems there is no reason to forbid supporting elf32/64
>> > for all drivers.
>> >=20
>>=20
>> I was hoping to hear some additional feedback on this from others.
>=20
> I didn't follow up on this one because I agreed with your assesment and d=
idn't
> think it was needed.
>=20
> Simply put I would rather see rproc_elf_sanity_check() gain support for e=
lf64
> and let the platform code decide what to do with format they don't suppor=
t
> rather than spinning a new function.
>=20
>>=20
>> I've merge the patch as is, but think it would be nice to clean this up
>> and just have the driver ignore if fed a 32 or 64-elf.
>=20
> It would be really nice to see this cleaned up in time for the coming mer=
ge
> window...

I could have sent a V7, but Bjorn was faster than my comment ;)
Bjorn, Is there any way to revert that or it's already pushed ?
I already have a clean V7.

Thanks,

Cl=C3=A9ment

>=20
> Thanks
> Mathieu
>=20
>>=20
>> Regards,
>> Bjorn
>>=20
>> > Regards,
>> >=20
>> > Cl=C3=A9ment
>> >=20
>> > >=20
>> > > Regards,
>> > > Bjorn
>> > >=20
>> > >> Signed-off-by: Clement Leger <cleger@kalray.eu>
>> > >> ---
>> > >>  drivers/remoteproc/remoteproc_core.c       | 2 +-
>> > >>  drivers/remoteproc/remoteproc_elf_loader.c | 6 +++---
>> > >>  drivers/remoteproc/remoteproc_internal.h   | 2 +-
>> > >>  drivers/remoteproc/st_remoteproc.c         | 2 +-
>> > >>  drivers/remoteproc/st_slim_rproc.c         | 2 +-
>> > >>  drivers/remoteproc/stm32_rproc.c           | 2 +-
>> > >>  6 files changed, 8 insertions(+), 8 deletions(-)
>> > >>=20
>> > >> diff --git a/drivers/remoteproc/remoteproc_core.c
>> > >> b/drivers/remoteproc/remoteproc_core.c
>> > >> index 4bfaf4a3c4a3..99f0b796fbc7 100644
>> > >> --- a/drivers/remoteproc/remoteproc_core.c
>> > >> +++ b/drivers/remoteproc/remoteproc_core.c
>> > >> @@ -2055,7 +2055,7 @@ struct rproc *rproc_alloc(struct device *dev,=
 const char
>> > >> *name,
>> > >>  =09=09rproc->ops->load =3D rproc_elf_load_segments;
>> > >>  =09=09rproc->ops->parse_fw =3D rproc_elf_load_rsc_table;
>> > >>  =09=09rproc->ops->find_loaded_rsc_table =3D rproc_elf_find_loaded_=
rsc_table;
>> > >> -=09=09rproc->ops->sanity_check =3D rproc_elf_sanity_check;
>> > >> +=09=09rproc->ops->sanity_check =3D rproc_elf32_sanity_check;
>> > >>  =09=09rproc->ops->get_boot_addr =3D rproc_elf_get_boot_addr;
>> > >>  =09}
>> > >> =20
>> > >> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c
>> > >> b/drivers/remoteproc/remoteproc_elf_loader.c
>> > >> index c2a9783cfb9a..5a67745f2638 100644
>> > >> --- a/drivers/remoteproc/remoteproc_elf_loader.c
>> > >> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
>> > >> @@ -25,13 +25,13 @@
>> > >>  #include "remoteproc_internal.h"
>> > >> =20
>> > >>  /**
>> > >> - * rproc_elf_sanity_check() - Sanity Check ELF firmware image
>> > >> + * rproc_elf_sanity_check() - Sanity Check ELF32 firmware image
>> > >>   * @rproc: the remote processor handle
>> > >>   * @fw: the ELF firmware image
>> > >>   *
>> > >>   * Make sure this fw image is sane.
>> > >>   */
>> > >> -int rproc_elf_sanity_check(struct rproc *rproc, const struct firmw=
are *fw)
>> > >> +int rproc_elf32_sanity_check(struct rproc *rproc, const struct fir=
mware *fw)
>> > >>  {
>> > >>  =09const char *name =3D rproc->firmware;
>> > >>  =09struct device *dev =3D &rproc->dev;
>> > >> @@ -89,7 +89,7 @@ int rproc_elf_sanity_check(struct rproc *rproc, c=
onst struct
>> > >> firmware *fw)
>> > >> =20
>> > >>  =09return 0;
>> > >>  }
>> > >> -EXPORT_SYMBOL(rproc_elf_sanity_check);
>> > >> +EXPORT_SYMBOL(rproc_elf32_sanity_check);
>> > >> =20
>> > >>  /**
>> > >>   * rproc_elf_get_boot_addr() - Get rproc's boot address.
>> > >> diff --git a/drivers/remoteproc/remoteproc_internal.h
>> > >> b/drivers/remoteproc/remoteproc_internal.h
>> > >> index 0deae5f237b8..28639c588d58 100644
>> > >> --- a/drivers/remoteproc/remoteproc_internal.h
>> > >> +++ b/drivers/remoteproc/remoteproc_internal.h
>> > >> @@ -54,7 +54,7 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da,=
 size_t len);
>> > >>  phys_addr_t rproc_va_to_pa(void *cpu_addr);
>> > >>  int rproc_trigger_recovery(struct rproc *rproc);
>> > >> =20
>> > >> -int rproc_elf_sanity_check(struct rproc *rproc, const struct firmw=
are *fw);
>> > >> +int rproc_elf32_sanity_check(struct rproc *rproc, const struct fir=
mware *fw);
>> > >>  u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firm=
ware *fw);
>> > >>  int rproc_elf_load_segments(struct rproc *rproc, const struct firm=
ware *fw);
>> > >>  int rproc_elf_load_rsc_table(struct rproc *rproc, const struct fir=
mware *fw);
>> > >> diff --git a/drivers/remoteproc/st_remoteproc.c
>> > >> b/drivers/remoteproc/st_remoteproc.c
>> > >> index a3268d95a50e..a6cbfa452764 100644
>> > >> --- a/drivers/remoteproc/st_remoteproc.c
>> > >> +++ b/drivers/remoteproc/st_remoteproc.c
>> > >> @@ -233,7 +233,7 @@ static const struct rproc_ops st_rproc_ops =3D =
{
>> > >>  =09.parse_fw=09=09=3D st_rproc_parse_fw,
>> > >>  =09.load=09=09=09=3D rproc_elf_load_segments,
>> > >>  =09.find_loaded_rsc_table=09=3D rproc_elf_find_loaded_rsc_table,
>> > >> -=09.sanity_check=09=09=3D rproc_elf_sanity_check,
>> > >> +=09.sanity_check=09=09=3D rproc_elf32_sanity_check,
>> > >>  =09.get_boot_addr=09=09=3D rproc_elf_get_boot_addr,
>> > >>  };
>> > >> =20
>> > >> diff --git a/drivers/remoteproc/st_slim_rproc.c
>> > >> b/drivers/remoteproc/st_slim_rproc.c
>> > >> index 09bcb4d8b9e0..3cca8b65a8db 100644
>> > >> --- a/drivers/remoteproc/st_slim_rproc.c
>> > >> +++ b/drivers/remoteproc/st_slim_rproc.c
>> > >> @@ -203,7 +203,7 @@ static const struct rproc_ops slim_rproc_ops =
=3D {
>> > >>  =09.da_to_va       =3D slim_rproc_da_to_va,
>> > >>  =09.get_boot_addr=09=3D rproc_elf_get_boot_addr,
>> > >>  =09.load=09=09=3D rproc_elf_load_segments,
>> > >> -=09.sanity_check=09=3D rproc_elf_sanity_check,
>> > >> +=09.sanity_check=09=3D rproc_elf32_sanity_check,
>> > >>  };
>> > >> =20
>> > >>  /**
>> > >> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/=
stm32_rproc.c
>> > >> index a18f88044111..9a8b5f5e2572 100644
>> > >> --- a/drivers/remoteproc/stm32_rproc.c
>> > >> +++ b/drivers/remoteproc/stm32_rproc.c
>> > >> @@ -505,7 +505,7 @@ static struct rproc_ops st_rproc_ops =3D {
>> > >>  =09.load=09=09=3D rproc_elf_load_segments,
>> > >>  =09.parse_fw=09=3D stm32_rproc_parse_fw,
>> > >>  =09.find_loaded_rsc_table =3D rproc_elf_find_loaded_rsc_table,
>> > >> -=09.sanity_check=09=3D rproc_elf_sanity_check,
>> > >> +=09.sanity_check=09=3D rproc_elf32_sanity_check,
>> > >>  =09.get_boot_addr=09=3D rproc_elf_get_boot_addr,
>> > >>  };
>> > >> =20
>> > >> --
> > > >> 2.15.0.276.g89ea799
