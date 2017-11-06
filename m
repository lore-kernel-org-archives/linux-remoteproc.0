Return-Path: <broonie@sirena.co.uk>
Date: Mon, 6 Nov 2017 11:21:43 +0000
From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build warning after merge of the regmap tree
Message-ID: <20171106112143.ht4cmm2qngdbmmuy@sirena.co.uk>
References: <20171106115214.19cb007a@canb.auug.org.au>
 <20171106152157.2ad9a5a9@canb.auug.org.au>
 <20171106153037.2afa3e7b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="agmybq6rue55gqhj"
Content-Disposition: inline
In-Reply-To: <20171106153037.2afa3e7b@canb.auug.org.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>, linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>


--agmybq6rue55gqhj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 06, 2017 at 03:30:37PM +1100, Stephen Rothwell wrote:
> On Mon, 6 Nov 2017 15:21:57 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> > On Mon, 6 Nov 2017 11:52:14 +1100 Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:

> > > After merging the regmap tree, today's linux-next build
> > > (arm_multi_v7_defconfig) produced this warning:

Not snipping Kconfig errors for context, looks like Kconfig is exploding...

> > > drivers/gpio/Kconfig:13:error: recursive dependency detected!
> > > For a resolution refer to Documentation/kbuild/kconfig-language.txt
> > > subsection "Kconfig recursive dependency limitations"
> > > drivers/gpio/Kconfig:13:	symbol GPIOLIB is selected by PINCTRL_SUNXI
> > > For a resolution refer to Documentation/kbuild/kconfig-language.txt
> > > subsection "Kconfig recursive dependency limitations"
> > > drivers/pinctrl/sunxi/Kconfig:3:	symbol PINCTRL_SUNXI is selected by =
PINCTRL_SUN6I_A31_R
> > > For a resolution refer to Documentation/kbuild/kconfig-language.txt
> > > subsection "Kconfig recursive dependency limitations"
> > > drivers/pinctrl/sunxi/Kconfig:21:	symbol PINCTRL_SUN6I_A31_R depends =
on RESET_CONTROLLER
> > > For a resolution refer to Documentation/kbuild/kconfig-language.txt
> > > subsection "Kconfig recursive dependency limitations"
> > > drivers/reset/Kconfig:4:	symbol RESET_CONTROLLER is selected by QCOM_=
SCM
> > > For a resolution refer to Documentation/kbuild/kconfig-language.txt
> > > subsection "Kconfig recursive dependency limitations"
> > > drivers/firmware/Kconfig:205:	symbol QCOM_SCM is selected by QCOM_ADS=
P_PIL
> > > For a resolution refer to Documentation/kbuild/kconfig-language.txt
> > > subsection "Kconfig recursive dependency limitations"
> > > drivers/remoteproc/Kconfig:90:	symbol QCOM_ADSP_PIL depends on QCOM_S=
MEM
> > > For a resolution refer to Documentation/kbuild/kconfig-language.txt
> > > subsection "Kconfig recursive dependency limitations"
> > > drivers/soc/qcom/Kconfig:49:	symbol QCOM_SMEM depends on HWSPINLOCK
> > > For a resolution refer to Documentation/kbuild/kconfig-language.txt
> > > subsection "Kconfig recursive dependency limitations"
> > > drivers/hwspinlock/Kconfig:5:	symbol HWSPINLOCK is selected by REGMAP
> > > For a resolution refer to Documentation/kbuild/kconfig-language.txt
> > > subsection "Kconfig recursive dependency limitations"
> > > drivers/base/regmap/Kconfig:6:	symbol REGMAP is selected by PINCTRL_S=
X150X
> > > For a resolution refer to Documentation/kbuild/kconfig-language.txt
> > > subsection "Kconfig recursive dependency limitations"
> > > drivers/pinctrl/Kconfig:227:	symbol PINCTRL_SX150X is selected by GPI=
O_SX150X
> > > For a resolution refer to Documentation/kbuild/kconfig-language.txt
> > > subsection "Kconfig recursive dependency limitations"
> > > drivers/gpio/Kconfig:821:	symbol GPIO_SX150X depends on GPIOLIB
> > > warning: (ARCH_VEXPRESS) selects MFD_VEXPRESS_SYSREG which has unmet =
direct dependencies (HAS_IOMEM && VEXPRESS_CONFIG && GPIOLIB && !ARCH_USES_=
GETTIMEOFFSET)
> > > warning: (ARCH_NOMADIK && ARCH_U8500) selects PINCTRL_NOMADIK which h=
as unmet direct dependencies (PINCTRL && (ARCH_U8500 || ARCH_NOMADIK) && OF=
 && GPIOLIB)
> > > warning: (PINCTRL_AT91 && PINCTRL_AT91PIO4 && PINCTRL_MESON && PINCTR=
L_OXNAS && PINCTRL_PISTACHIO && PINCTRL_PIC32 && PINCTRL_NOMADIK && PINCTRL=
_MTK && GPIO_TB10X) selects OF_GPIO which has unmet direct dependencies (GP=
IOLIB && OF && HAS_IOMEM)

> > > Maybe introduced by commit

> > >   f25637a6b89e ("regmap: Add a config option for hwspinlock") =20

> > Things got worse during the day until config started segfaulting, so I
> > reverted this commit.

> That necessitated me reverting commits

>   8698b9364710 ("regmap: Add hardware spinlock support")
>   267f3e4f18f1 ("regmap: Also protect hwspinlock in error handling path")
>   e8419c40a5ad ("regmap: Clean up hwspinlock on regmap exit")

This seems like there's a Kconfig bug, it's claiming HWSPINLOCK is
selected by regmap but the select is conditional and not actually
enabled.  You could potentially get a recursive dependency but there
isn't one right now.  The root issue here is that HWSPINLOCK can be
built modular which makes it very painful to use from core code.

--agmybq6rue55gqhj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAloARcQACgkQJNaLcl1U
h9C48Af8DsmbmPszkoeO3CrbS/ZtAc1XvCpT5THuTsvwwkZBud+FG9MsgfKvCwc1
G2Nb2+Nqt45pUyGlHmv15OspgCTChJfuCecMCOXT/aZP/LLLhv2K1IIZR0yRCQVI
/xJ4VijaGivf/OxvGT29Zpvz8o5If6XKbgQjpndg197BQJWsZRzVYQGupB1D5zVJ
CmMcB8bzxogon9y+rfXoYwfjbNw9CA30hk2inBjPXed/LkVpx7De4P8qMwKIXt+8
mkWA7U83xJ+ldBsurAgDyy++VnRBa/n8fauFcl5sub8VmImFlbI2dVV1zJQ4fZ/M
Q4k0QT9ryC5J52upUIF5fgKEweDCCw==
=feuq
-----END PGP SIGNATURE-----

--agmybq6rue55gqhj--
