Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v2 0/7] remoteproc: Fixes for memoy carveout management
Date: Fri, 1 Feb 2019 15:59:27 +0000
Message-ID: <6d88bb6cdf1947c185b7aebe01a998a0@SFHDAG7NODE2.st.com>
References: <1547128151-44077-1-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1547128151-44077-1-git-send-email-loic.pallardy@st.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Arnaud POULIQUEN  <arnaud.pouliquen@st.com>, benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>, "s-anna@ti.com" <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

> -----Original Message-----
> From: Loic PALLARDY <loic.pallardy@st.com>
> Sent: jeudi 10 janvier 2019 14:49
> To: bjorn.andersson@linaro.org; ohad@wizery.com
> Cc: linux-remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org;
> Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> benjamin.gaignard@linaro.org; s-anna@ti.com; Loic PALLARDY
> <loic.pallardy@st.com>
> Subject: [PATCH v2 0/7] remoteproc: Fixes for memoy carveout
> management
>=20
> These patches fix the comments sent on remoteproc mailing
> list after acceptation of memory carveout patch series [1].
>=20
> In few words, series corrects:
> - memory carveout allocation for rproc without iommu
> - rproc_da_to_va and trace buffer access to take into account
>   late carveout allocation
> - resource table cast by adding warning messages

Could you please merge this series for next pull request as it contains onl=
y fixes of patches merged in kernel 4.20.

Regards,
Loic=20

>=20
> Regards,
> Loic
>=20
> [1] https://lkml.org/lkml/2018/7/27/612
>=20
> ---
> Changes from v1:
> - Modify way to notify resource table cast issue
> - Complete trace buffer patch
>=20
>=20
> Loic Pallardy (7):
>   remoteproc: correct rproc_mem_entry_init() comments
>   remoteproc: fix rproc_da_to_va in case of unallocated carveout
>   remoteproc: fix rproc_alloc_carveout() bad variable cast
>   remoteproc: add warning on resource table cast
>   remoteproc: fix rproc_alloc_carveout() for rproc with iommu domain
>   remoteproc: fix trace buffer va initialization
>   remoteproc: fix rproc_check_carveout_da() returned error and comments
>=20
>  drivers/remoteproc/remoteproc_core.c     | 108 ++++++++++++++++++-----
> --------
>  drivers/remoteproc/remoteproc_debugfs.c  |  21 ++++--
>  drivers/remoteproc/remoteproc_internal.h |   9 ++-
>  3 files changed, 89 insertions(+), 49 deletions(-)
>=20
> --
> 2.7.4
