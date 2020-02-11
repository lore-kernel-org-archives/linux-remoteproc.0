Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Tue, 11 Feb 2020 16:12:53 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v4 0/5] remoteproc: Add elf64 support
Message-ID: <20200211231253.GC27770@xps15>
References: <527785289.2852303.1581062223707.JavaMail.zimbra@kalray.eu>
 <20200210162209.23149-1-cleger@kalray.eu>
 <5b8045be-0942-2ecf-5dba-dad58071f6af@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b8045be-0942-2ecf-5dba-dad58071f6af@st.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc: Clement Leger <cleger@kalray.eu>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-remoteproc@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>, Patrice Chotard <patrice.chotard@st.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Feb 11, 2020 at 04:57:18PM +0100, Arnaud POULIQUEN wrote:
> Hi Clement,
> 
> I tested the series on the stm32 platform for remote proc firmwre load: no regression found.
> I do not test the da_to_va feature as not implemented on stm32 platform.

It would be very interesting if you could test the coredump, that would give us
a lot more confidence in the implementation.

Thanks,
Mathieu

> 
> Regards,
> Arnaud
> 
> 
> 
> On 2/10/20 5:22 PM, Clement Leger wrote:
> > This serie add support for elf64 in remoteproc (elf loader, coredump). 
> > First two patches modifies the type of len argument (in da_to_va) and
> > boot_addr in order to allow loading elf64 segment with a u64 size
> > and a u64 entry point.
> > Next patch introduce a set of macros to access elf64 and elf32
> > transparently.
> > Last two patches are the actual modification in the elf loader and
> > remoteproc coredump support to add elf64 support.
> > 
> > Changes from V3:
> >  - Adapt coredump to elf64 file format
> >  - Rename remoteproc_elf_loader.h to remoteproc_elf_helpers.h
> >  - Update copyright year in remoteproc_elf_helpers.h
> >  - Rename macros elf_hdr_* to elf_get_hdr_* for coherency with elf_hdr_set_*
> >  - Split elf64 loader patch in 3:
> >    - boot_addr u64 change
> >    - remoteproc_elf_helpers.h creation
> >    - elf64 loading
> > 
> > Clement Leger (5):
> >   remoteproc: Use u64 len for da_to_va
> >   remoteproc: Use u64 type for boot_addr
> >   remoteproc: Add elf helpers to access elf64 and elf32 fields
> >   remoteproc: Add elf64 support in elf loader
> >   remoteproc: Adapt coredump to generate correct elf type
> > 
> >  Documentation/remoteproc.txt                |   2 +-
> >  drivers/remoteproc/imx_rproc.c              |  11 +-
> >  drivers/remoteproc/keystone_remoteproc.c    |   4 +-
> >  drivers/remoteproc/qcom_q6v5_adsp.c         |   2 +-
> >  drivers/remoteproc/qcom_q6v5_mss.c          |   2 +-
> >  drivers/remoteproc/qcom_q6v5_pas.c          |   2 +-
> >  drivers/remoteproc/qcom_q6v5_wcss.c         |   2 +-
> >  drivers/remoteproc/qcom_wcnss.c             |   2 +-
> >  drivers/remoteproc/remoteproc_core.c        |  69 +++++++------
> >  drivers/remoteproc/remoteproc_elf_helpers.h |  95 ++++++++++++++++++
> >  drivers/remoteproc/remoteproc_elf_loader.c  | 150 ++++++++++++++++++----------
> >  drivers/remoteproc/remoteproc_internal.h    |   4 +-
> >  drivers/remoteproc/st_remoteproc.c          |   2 +-
> >  drivers/remoteproc/st_slim_rproc.c          |   4 +-
> >  drivers/remoteproc/wkup_m3_rproc.c          |   4 +-
> >  include/linux/remoteproc.h                  |   7 +-
> >  16 files changed, 252 insertions(+), 110 deletions(-)
> >  create mode 100644 drivers/remoteproc/remoteproc_elf_helpers.h
> > 
