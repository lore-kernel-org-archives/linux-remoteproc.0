Date: Tue, 10 Mar 2020 12:30:46 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 5/8] remoteproc: Rename rproc_elf_sanity_check for
 elf32
Message-ID: <20200310193042.GK264362@yoga>
References: <20200210162209.23149-1-cleger@kalray.eu>
 <20200302093902.27849-1-cleger@kalray.eu>
 <20200302093902.27849-6-cleger@kalray.eu>
 <20200302231342.GE262924@yoga>
 <482678048.7666348.1583222551942.JavaMail.zimbra@kalray.eu>
 <20200310000005.GF14744@builder>
 <20200310152031.GA25781@xps15>
 <371773363.9138477.1583854699708.JavaMail.zimbra@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <371773363.9138477.1583854699708.JavaMail.zimbra@kalray.eu>
To: Cl?ment Leger <cleger@kalrayinc.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Jonathan Corbet <corbet@lwn.net>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-remoteproc <linux-remoteproc@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>, Patrice Chotard <patrice.chotard@st.com>, linux-doc <linux-doc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 10 Mar 08:38 PDT 2020, Cl?ment Leger wrote:

> Hi Mathieu,
> 
> ----- On 10 Mar, 2020, at 16:20, Mathieu Poirier mathieu.poirier@linaro.org wrote:
> 
> > On Mon, Mar 09, 2020 at 05:00:05PM -0700, Bjorn Andersson wrote:
> >> On Tue 03 Mar 00:02 PST 2020, Cl?ment Leger wrote:
> >> 
> >> > Hi Bjorn,
> >> > 
> >> > ----- On 3 Mar, 2020, at 00:13, Bjorn Andersson bjorn.andersson@linaro.org
> >> > wrote:
> >> > 
> >> > > On Mon 02 Mar 01:38 PST 2020, Clement Leger wrote:
> >> > > 
> >> > >> Since this function will be modified to support both elf32 and elf64,
> >> > >> rename the existing one to elf32 (which is the only supported format
> >> > >> at the moment). This will allow not to introduce possible side effect
> >> > >> when adding elf64 support (ie: all backends will still support only
> >> > >> elf32 if not requested explicitely using rproc_elf_sanity_check).
> >> > >> 
> >> > > 
> >> > > Is there a reason for preventing ELF64 binaries be loaded?
> >> > 
> >> > I decided to go this way to let driver maintainer decide if they want
> >> > to support elf64 to avoid problems with 64bits addresses/sizes which do
> >> > not fit in their native type (size_t for instance). This is probably
> >> > not going to happen and there are additionnal checks before calling
> >> > rproc_da_to_va. And addresses should be filtered by rproc_da_to_va.
> >> > So, actually it seems there is no reason to forbid supporting elf32/64
> >> > for all drivers.
> >> > 
> >> 
> >> I was hoping to hear some additional feedback on this from others.
> > 
> > I didn't follow up on this one because I agreed with your assesment and didn't
> > think it was needed.
> > 
> > Simply put I would rather see rproc_elf_sanity_check() gain support for elf64
> > and let the platform code decide what to do with format they don't support
> > rather than spinning a new function.
> > 
> >> 
> >> I've merge the patch as is, but think it would be nice to clean this up
> >> and just have the driver ignore if fed a 32 or 64-elf.
> > 
> > It would be really nice to see this cleaned up in time for the coming merge
> > window...
> 
> I could have sent a V7, but Bjorn was faster than my comment ;)

I figured it had been maturing on the list long enough and expected the
cleanup to be a nice incremental patch.

> Bjorn, Is there any way to revert that or it's already pushed ?
> I already have a clean V7.
> 

Please base your changes on what's in rproc-next (and today's
linux-next).

Thank you,
Bjorn
