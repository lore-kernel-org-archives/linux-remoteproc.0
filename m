Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v3 00/13] remoteproc: add fixed memory region support
Date: Tue, 3 Apr 2018 12:04:17 +0000
Message-ID: <206695dbbf5c4c968680ec3df9937b52@SFHDAG7NODE2.st.com>
References: <1519921440-21356-1-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1519921440-21356-1-git-send-email-loic.pallardy@st.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Arnaud POULIQUEN  <arnaud.pouliquen@st.com>, benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,=20

Just a gentle ping...
As discussed during Linaro connect, I'll appreciate if you can share me you=
r comments...

Regards,
Loic

> -----Original Message-----
> From: Loic PALLARDY
> Sent: Thursday, March 01, 2018 5:24 PM
> To: bjorn.andersson@linaro.org; ohad@wizery.com
> Cc: linux-remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org;
> Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> benjamin.gaignard@linaro.org; Loic PALLARDY <loic.pallardy@st.com>
> Subject: [PATCH v3 00/13] remoteproc: add fixed memory region support
>=20
> The aim of the series is to implement carveout memory management as
> discussed during OpenAMP weekly call and defined in proposed document
> [1]
>=20
> This first series focus only on adding support of the different types of
> carveout memories (dynamic, fixed, platform driver depend...).
> 64bit resource table will be addressed in a next series.
>=20
> [1]: http://openamp.github.io/docs/mca/coprocessor-memory-definition-
> v6.pdf
>=20
> ---
> Changes sine V2:
> Reshuffle the series to:
> - Take into account Bjorn's comments.
> - Add patch to check consistency between carveout resource request and
> IOMMU
>   support.
> - Introduce platform specific prepare and unprepare ops to enable HW like
>   clock, bus, regulator, memory region... before loading co-processor
> firmware.
> - Rely on memory carveout management for all remoteproc memory
> allocations.
> - Lookup pre-registered carveout by name first.
> - Create a subdevice for each vdev declared in firmware resource table th=
at
>   will be used by virtio based driver to retrieve specific memory pool.
>=20
> This series takes some assumptions for carveout names associated to vdev:
> - For vring: "vdev%xvring%x" with vdev index from resource table and vrin=
g
> index
>   in vdev.
> - For vdev buffer: "vdev%xbuffer" with vdev index from resource table
>=20
> This will be changed in the future, adding names field in vdev resource i=
n
> next resource table version.
>=20
>=20
> Changes since V1:
> - Minor corrections on first 7 patches (error management)
> - Add "memory device" support on the top of first 7 patches.
>   Goal is to answer use case reported during OpenAMP weekly discussion:
>   - "Be able to specify memory region for vring and buffer allocation, ev=
en
>     if no specific request defined in firmware resource table."
>   Patches offer the capability to create a "memory device" associated to =
a
>   carveout with a dedicated DMA memory pool. Different resource handlers
> are
>   modified to look-up for specific carveout by name. If match found and
> associated
>   "memory device" present, device is used instead of rproc platform devic=
e
> for
>   allocation.
>=20
>=20
> Loic Pallardy (13):
>   remoteproc: configure IOMMU only if device address requested
>   remoteproc: add rproc_va_to_pa function
>   remoteproc: add release ops in rproc_mem_entry struct
>   remoteproc: add name in rproc_mem_entry struct
>   remoteproc: add helper function to allocate and init rproc_mem_entry
>     struct
>   remoteproc: introduce rproc_add_carveout function
>   remoteproc: introduce rproc_find_carveout_by_name function
>   remoteproc: add prepare and unprepare ops
>   remoteproc: modify rproc_handle_carveout to support pre-registered
>     region
>   remoteproc: modify vring allocation to support pre-registered region
>   remoteproc: create vdev subdevice with specific dma memory pool
>   rpmsg: virtio: allocate buffer from parent
>   remoteproc: st: add reserved memory support
>=20
>  drivers/remoteproc/remoteproc_core.c    | 332
> ++++++++++++++++++++++++++++----
>  drivers/remoteproc/remoteproc_debugfs.c |   1 +
>  drivers/remoteproc/remoteproc_virtio.c  |   2 +-
>  drivers/remoteproc/st_remoteproc.c      |  68 ++++++-
>  drivers/rpmsg/virtio_rpmsg_bus.c        |   2 +-
>  include/linux/remoteproc.h              |  22 ++-
>  6 files changed, 379 insertions(+), 48 deletions(-)
>=20
> --
> 1.9.1
