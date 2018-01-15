Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v2 0/8] Remoteproc cleanups
Date: Mon, 15 Jan 2018 10:35:10 +0000
Message-ID: <876e3f0622504971b17e3e3bac99d8fd@SFHDAG7NODE2.st.com>
References: <20180105235805.9948-1-bjorn.andersson@linaro.org>
In-Reply-To: <20180105235805.9948-1-bjorn.andersson@linaro.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Saturday, January 06, 2018 12:58 AM
> To: Ohad Ben-Cohen <ohad@wizery.com>; Bjorn Andersson
> <bjorn.andersson@linaro.org>
> Cc: linux-remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org; Loic
> PALLARDY <loic.pallardy@st.com>
> Subject: [PATCH v2 0/8] Remoteproc cleanups
>=20
> The first patch removes code that became unnecessary when the recovery
> flow was
> redesigned.
>=20
> The following patches moves the assignment of cached_table to the
> resource
> table loader, rather than core code, which allows this to made optional a=
nd
> finally drops the various dummy resource tables provided by drivers.
>=20
> Then finally the last patch ensures that table_ptr isn't left pointing in=
to
> memory of a stopped remoteproc.

I have tested this series on B2260 96Board for st-slim remote processor sup=
port.

Reviewed-By: Loic Pallardy <loic.pallardy@st.com>
Tested-By: Loic Pallardy <loic.pallardy@st.com>

Regards,
Loic
>=20
> Bjorn Andersson (8):
>   remoteproc: Remove depricated crash completion
>   remoteproc: Cache resource table size
>   remoteproc: Clone rproc_ops in rproc_alloc()
>   remoteproc: Merge rproc_ops and rproc_fw_ops
>   remoteproc: Don't handle empty resource table
>   remoteproc: Move resource table load logic to find
>   remoteproc: Drop dangling find_rsc_table dummies
>   remoteproc: Reset table_ptr on stop
>=20
>  drivers/remoteproc/qcom_adsp_pil.c         |  8 +--
>  drivers/remoteproc/qcom_common.c           | 19 -------
>  drivers/remoteproc/qcom_common.h           |  4 --
>  drivers/remoteproc/qcom_q6v5_pil.c         | 18 +------
>  drivers/remoteproc/qcom_wcnss.c            |  8 +--
>  drivers/remoteproc/remoteproc_core.c       | 83 ++++++++++++------------=
---
> ---
>  drivers/remoteproc/remoteproc_elf_loader.c | 59 ++++++++++-----------
>  drivers/remoteproc/remoteproc_internal.h   | 57 +++++++-------------
>  drivers/remoteproc/st_slim_rproc.c         | 32 ++----------
>  include/linux/remoteproc.h                 | 21 ++++++--
>  10 files changed, 106 insertions(+), 203 deletions(-)
>=20
> --
> 2.15.0
