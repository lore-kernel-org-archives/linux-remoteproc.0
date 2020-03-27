Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v2 00/17] remoteproc: Add support for synchronisation with
 MCU
Date: Fri, 27 Mar 2020 17:20:14 +0000
Message-ID: <4d264de6259449338cef9b2da1f39304@SFHDAG7NODE2.st.com>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "s-anna@ti.com" <s-anna@ti.com>, "peng.fan@nxp.com" <peng.fan@nxp.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Fabien DESSENNE <fabien.dessenne@st.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Mathieu,

> -----Original Message-----
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: mardi 24 mars 2020 22:46
> To: bjorn.andersson@linaro.org
> Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> <arnaud.pouliquen@st.com>; Fabien DESSENNE
> <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> Subject: [PATCH v2 00/17] remoteproc: Add support for synchronisation wit=
h
> MCU
>=20
> This is the second revision of this set that tries to address the
> problem of synchronising with an MCU with as much flexibility as
> possible.
>=20
> New in this revision is a fix for a couple of bugs I found while
> testing things.  First with the helper macro in patch 09 and the
> suppression of a boot message when synchronising with an MCU
> in patch 12.  I have completely removed what used to be patch 18,
> the example on how to use the new API.  This will be the subject
> of an upcoming patchset.
>=20
> Tested on ST's mp157c platform.  Applies on v5.6-rc7 to keep things
> simple.

Thanks Mathieu for the 2 series. I tested on my STM32MP157-DK2 the differen=
t
synchronization use cases (on_init, after_stop, after_crash), mixing the va=
lues and
I succeed to start/stop/restart M4 coprocessor with or without reloading fi=
rmware
according to sync values. (I only applied the correction I proposed in patc=
h 16 review
to allow to resync with a preloaded or an already running coprocessor.

Regards,
Loic
>=20
> Comments would be much appreciated.
>=20
> Thanks,
> Mathieu
>=20
> Mathieu Poirier (17):
>   remoteproc: Add new operation and state machine for MCU
>     synchronisation
>   remoteproc: Introduce function rproc_set_mcu_sync_state()
>   remoteproc: Split firmware name allocation from rproc_alloc()
>   remoteproc: Split rproc_ops allocation from rproc_alloc()
>   remoteproc: Get rid of tedious error path
>   remoteproc: Introduce function rproc_alloc_internals()
>   remoteproc: Introduce function rproc_alloc_state_machine()
>   remoteproc: Allocate synchronisation state machine
>   remoteproc: Call the right core function based on synchronisation
>     state
>   remoteproc: Decouple firmware load and remoteproc booting
>   remoteproc: Repurpose function rproc_trigger_auto_boot()
>   remoteproc: Rename function rproc_fw_boot()
>   remoteproc: Introducting new functions to start and stop an MCU
>   remoteproc: Refactor function rproc_trigger_recovery()
>   remoteproc: Correctly deal with MCU synchronisation when changing FW
>     image
>   remoteproc: Correctly deal with MCU synchronisation when changing
>     state
>   remoteproc: Make MCU synchronisation state changes on stop and crashed
>=20
>  drivers/remoteproc/remoteproc_core.c     | 387 ++++++++++++++++++-----
>  drivers/remoteproc/remoteproc_debugfs.c  |  31 ++
>  drivers/remoteproc/remoteproc_internal.h |  91 ++++--
>  drivers/remoteproc/remoteproc_sysfs.c    |  57 +++-
>  include/linux/remoteproc.h               |  28 +-
>  5 files changed, 487 insertions(+), 107 deletions(-)
>=20
> --
> 2.20.1
