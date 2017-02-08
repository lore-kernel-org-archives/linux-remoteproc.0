Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v1 0/6] rtio_rpmsg: make rpmsg channel configurable
Date: Wed, 8 Feb 2017 16:35:30 +0000
Message-ID: <618da904c3744150b77740825dc4fb4a@SFHDAG7NODE2.st.com>
References: <1481142941-15616-1-git-send-email-loic.pallardy@st.com>
 <3b1b4f00-c4a4-e7f5-f46f-10b0dcde591f@st.com>
 <a1722e0e-ff48-df98-8107-53ce769d6a89@ti.com>
 <538e9ca6c6ca468d93b619e4df890c2e@SFHDAG7NODE2.st.com>
 <3948b470-605d-fbe4-dbff-ac56cfedcc1d@ti.com>
In-Reply-To: <3948b470-605d-fbe4-dbff-ac56cfedcc1d@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Suman Anna <s-anna@ti.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, Patrice CHOTARD <patrice.chotard@st.com>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "kernel@stlinux.com" <kernel@stlinux.com>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Suman Anna [mailto:s-anna@ti.com]
> Sent: Monday, January 16, 2017 5:03 PM
> To: Loic PALLARDY <loic.pallardy@st.com>; bjorn.andersson@linaro.org;
> ohad@wizery.com; lee.jones@linaro.org; Patrice CHOTARD
> <patrice.chotard@st.com>
> Cc: linux-remoteproc@vger.kernel.org; kernel@stlinux.com
> Subject: Re: [PATCH v1 0/6] rtio_rpmsg: make rpmsg channel configurable
>=20
> On 01/14/2017 01:20 PM, Loic PALLARDY wrote:
> >
> >
> >> -----Original Message-----
> >> From: Suman Anna [mailto:s-anna@ti.com]
> >> Sent: Saturday, January 14, 2017 2:36 AM
> >> To: Loic PALLARDY <loic.pallardy@st.com>; bjorn.andersson@linaro.org;
> >> ohad@wizery.com; lee.jones@linaro.org; Patrice CHOTARD
> >> <patrice.chotard@st.com>
> >> Cc: linux-remoteproc@vger.kernel.org; kernel@stlinux.com
> >> Subject: Re: [PATCH v1 0/6] rtio_rpmsg: make rpmsg channel
> >> configurable
> >>
> >> Hi Loic,
> >>
> >>>
> >>> On 12/07/2016 09:35 PM, Loic Pallardy wrote:
> >>>> This goal of this series is to offer more flexibility for
> >>>> virtio_rpmsg communication link configuration.
> >>>>
> >>>> It should be possible to tune rpmsg buffer size per Rpmsg link, to
> >>>> provide selected configuration to coprocessor, to take into account
> >>>> coprocessor specificities like memory region.
> >>>>
> >>>> This series introduces an optional virtio rpmsg configuration
> >>>> structure, which will be managed as an extension of struct
> >>>> fw_rsc_vdev present in coprocessor firmware resource table.
> >>>> Structure access is possible thanks to virtio get and set API.
> >>>> This structure contains the different information to tune the link
> >>>> between the host and the coprocessor.
> >>>>
> >>>> Patch "rpmsg: virtio_rpmsg_bus: fix sg_set_buf() when addr is not a
> >>>> valid kernel address" has the same goal as Wendy's RFC [1]. I don't
> >>>> have tested Wendy's series with level driver buffer allocation.
> >>>>
> >>>> Last patch "rpmsg: virtio_rpmsg: set buffer configuration to virtio"
> >>>> has a
> >>>> dependency with remoteproc subdevice boot sequence as
> coprocessor
> >>>> resource table must be updated before coprocessor start. See [2]
> >>>>
> >>>> [1] http://www.spinics.net/lists/linux-remoteproc/msg00852.html
> >>>> [2] http://www.spinics.net/lists/linux-remoteproc/msg00826.html
> >>>>
> >>>
> >>> Hi Bjorn,
> >>>
> >>> Gentle reminder. This series is present on ML since one month
> >>> without update or objection. I hope to see it in your next pull reque=
st for
> v4.11.
> >>
> >> I like the overall objective of this series. I will need some time to
> >> test the series, but have some preliminary comments. You would mostly
> >> need to send a v2.
> >>
> > Hi Suman,
> >
> > It will be with pleasure. Thanks for your comments. I'll update the ser=
ies
> and send a v2.
> > Regards,
> > Loic
>=20
> Hi Loic,
>=20
> I have given this series a test spin, and so far it works fine on TI plat=
forms
> which do not have have this config (so backward compatible). I am interes=
ted
> in seeing where the plumbing is done for updating the va for this, is the=
re
> any patch on the ST remoteproc that I can look at for this.
>
Hi Suman,

Sorry for my late answer. Very busy since beginning of this year.
All the plumbing is in st_remoteproc, in probe function.
All memory regions are declared as reserved memory. Probe function will par=
se DT reserved memory nodes to get information about fixed memory regions a=
ssociated to coprocessor (memory regions are accessed by name).
Then regions accesses are granted either thanks to memremap or thanks to dm=
a_alloc_coherent.
Next step is to update firmware resource table with memory region informati=
on (pa, da, len and va (only for rpmsg buffer))
This is done using series [1] which allows to verify and modify any part of=
 one resource table.

st_rproc_probe sequence becomes:
rproc_alloc --> alloc "struct rproc"
          |
          V
st_rproc_parse_dt --> parse DT and detected associated memory region (code,=
 vrings, buffer)
          |
          V
rproc_add --> (without autoboot feature) to create new remoteproc device
          |
          V
rproc_request_resource --> overload vdev resource in firmware resource tabl=
e (applied by rproc_boot)
          |
          V
rproc_boot --> coprocessor with modified resource table

I need to clean up my internal code before sharing with you.

Regards,
Loic

[1] https://lkml.org/lkml/2016/10/12/466
=20
> regards
> Suman
>=20
> >
> >> regards
> >> Suman
> >>
> >>>
> >>> Best regards,
> >>> Loic
> >>>
> >>>> Loic Pallardy (6):
> >>>>   rpmsg: virtio_rpmsg: set rpmsg_buf_size customizable
> >>>>   rpmsg: virtio_rpmsg_bus: fix sg_set_buf() when addr is not a valid
> >>>>     kernel address
> >>>>   include: virtio_rpmsg: add virtio rpmsg configuration structure
> >>>>   rpmsg: virtio_rpmsg: get buffer configuration from virtio
> >>>>   rpmsg: virtio_rpmsg: don't allocate buffer if provided by low leve=
l
> >>>>     driver
> >>>>   rpmsg: virtio_rpmsg: set buffer configuration to virtio
> >>>>
> >>>>  drivers/rpmsg/virtio_rpmsg_bus.c   | 176
> >>>> ++++++++++++++++++++++++++++++-------
> >>>>  include/linux/rpmsg/virtio_rpmsg.h |  32 +++++++
> >>>>  2 files changed, 177 insertions(+), 31 deletions(-)  create mode
> >>>> 100644 include/linux/rpmsg/virtio_rpmsg.h
> >>>>
> >>> --
> >>> To unsubscribe from this list: send the line "unsubscribe
> >>> linux-remoteproc" in the body of a message to
> >>> majordomo@vger.kernel.org More majordomo info at
> >>> http://vger.kernel.org/majordomo-info.html
> >
