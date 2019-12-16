Return-Path: <cleger@kalray.eu>
Date: Mon, 16 Dec 2019 17:16:48 +0100 (CET)
From: =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalray.eu>
Message-ID: <1421722418.96878492.1576513008758.JavaMail.zimbra@kalray.eu>
In-Reply-To: <1428337657.96784882.1576485771590.JavaMail.zimbra@kalray.eu>
References: <20191210164014.50739-1-paul@crapouillou.net> <20191210164014.50739-3-paul@crapouillou.net> <f25180f2-7c6d-0022-12b2-cd9c202f39d3@st.com> <1576362603.3.5@crapouillou.net> <1428337657.96784882.1576485771590.JavaMail.zimbra@kalray.eu>
Subject: Re: [PATCH v4 3/5] remoteproc: Add prepare/unprepare callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Paul Cercueil <paul@crapouillou.net>
Cc: Fabien DESSENNE <fabien.dessenne@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, od <od@zcrc.me>, linux-remoteproc <linux-remoteproc@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Paul,

I tested your patch and implemented the prepare callback only.
This is working correctly and the callback is correctly called
to enable clocks right before loading code into memory.

Regarding unprepare, I have no usecase for this since clocks
disabling and resetting is done in rproc_stop. Thus, I did not
tested this part. Did you add it to be called after the subdevices
unprepare call ? If not, what is the use case for this ?
ie, what are you doing in unprepare that you don't do in stop ?

Obviously it should work but I can't say I tested it completely !

Regards,

Cl=C3=A9ment


----- On 16 Dec, 2019, at 09:42, Cl=C3=A9ment Leger cleger@kalray.eu wrote:

> Hi Paul
>=20
> ----- On 14 Dec, 2019, at 23:30, Paul Cercueil paul@crapouillou.net wrote=
:
>=20
>> Hi Fabien,
>>=20
>>=20
>> Le jeu., d=C3=A9c. 12, 2019 at 10:03, Fabien DESSENNE
>> <fabien.dessenne@st.com> a =C3=A9crit :
>>> Hi Paul
>>>=20
>>>=20
>>> On 10/12/2019 5:40 PM, Paul Cercueil wrote:
>>>>  The .prepare() callback is called before the firmware is loaded to
>>>>  memory. This is useful for instance in the case where some setup is
>>>>  required for the memory to be accessible.
>>>=20
>>>=20
>>> I am trying to figure out what king of 'setup' may be required. From
>>> the
>>> ingenic driver I understand that you need to enable clocks to allow
>>> some
>>> memory access.
>>>=20
>>> Instead of adding this new ops, why not enabling clocks in probe()?
>>=20
>> Enabling the clocks in the probe means that the clocks will be
>> unconditionally enabled until the driver is removed, even if the remote
>> processor end up being unused. That would be a waste of power.
>=20
> We have the same kind of "problem" for k1c remoteproc driver (not yet
> upstream, depends on new arch). We need to enable clocks to load code
> into remote processor memory and currently we do that in probe.
> However, as you stated, we would like to enable them as late as possible
> (just before loading code) to avoid wasting power unnecessarily. So the
> "prepare" callback totally makes sense.
>=20
> Regards,
>=20
> Cl=C3=A9ment
>=20
>>=20
>> Cheers,
>> -Paul
>>=20
>>=20
>>>=20
>>> BR
>>>=20
>>> Fabien
>>>=20
>>>=20
>>>>=20
>>>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>>>  ---
>>>>=20
>>>>  Notes:
>>>>       v2-v4: No change
>>>>=20
>>>>    drivers/remoteproc/remoteproc_core.c | 16 +++++++++++++++-
>>>>    include/linux/remoteproc.h           |  4 ++++
>>>>    2 files changed, 19 insertions(+), 1 deletion(-)
>>>>=20
>>>>  diff --git a/drivers/remoteproc/remoteproc_core.c
>>>> b/drivers/remoteproc/remoteproc_core.c
>>>>  index 0a9fc7fdd1c3..3ea5f675a148 100644
>>>>  --- a/drivers/remoteproc/remoteproc_core.c
>>>>  +++ b/drivers/remoteproc/remoteproc_core.c
>>>>  @@ -1299,11 +1299,19 @@ static int rproc_start(struct rproc *rproc,
>>>> const struct firmware *fw)
>>>>    =09struct device *dev =3D &rproc->dev;
>>>>    =09int ret;
>>>>=20
>>>>  +=09if (rproc->ops->prepare) {
>>>>  +=09=09ret =3D rproc->ops->prepare(rproc);
>>>>  +=09=09if (ret) {
>>>>  +=09=09=09dev_err(dev, "Failed to prepare rproc: %d\n", ret);
>>>>  +=09=09=09return ret;
>>>>  +=09=09}
>>>>  +=09}
>>>>  +
>>>>    =09/* load the ELF segments to memory */
>>>>    =09ret =3D rproc_load_segments(rproc, fw);
>>>>    =09if (ret) {
>>>>    =09=09dev_err(dev, "Failed to load program segments: %d\n", ret);
>>>>  -=09=09return ret;
>>>>  +=09=09goto unprepare_rproc;
>>>>    =09}
>>>>=20
>>>>    =09/*
>>>>  @@ -1354,6 +1362,9 @@ static int rproc_start(struct rproc *rproc,
>>>> const struct firmware *fw)
>>>>    =09rproc_unprepare_subdevices(rproc);
>>>>    reset_table_ptr:
>>>>    =09rproc->table_ptr =3D rproc->cached_table;
>>>>  +unprepare_rproc:
>>>>  +=09if (rproc->ops->unprepare)
>>>>  +=09=09rproc->ops->unprepare(rproc);
>>>>=20
>>>>    =09return ret;
>>>>    }
>>>>  @@ -1483,6 +1494,9 @@ static int rproc_stop(struct rproc *rproc,
>>>> bool crashed)
>>>>=20
>>>>    =09rproc->state =3D RPROC_OFFLINE;
>>>>=20
>>>>  +=09if (rproc->ops->unprepare)
>>>>  +=09=09rproc->ops->unprepare(rproc);
>>>>  +
>>>>    =09dev_info(dev, "stopped remote processor %s\n", rproc->name);
>>>>=20
>>>>    =09return 0;
>>>>  diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>>>>  index 5f201f0c86c3..a6272d1ba384 100644
>>>>  --- a/include/linux/remoteproc.h
>>>>  +++ b/include/linux/remoteproc.h
>>>>  @@ -355,6 +355,8 @@ enum rsc_handling_status {
>>>>=20
>>>>    /**
>>>>     * struct rproc_ops - platform-specific device handlers
>>>>  + * @prepare:=09prepare the device for power up (before the firmware
>>>> is loaded)
>>>>  + * @unprepare:=09unprepare the device after it is stopped
>>>>     * @start:=09power on the device and boot it
>>>>     * @stop:=09power off the device
>>>>     * @kick:=09kick a virtqueue (virtqueue id given as a parameter)
>>>>  @@ -371,6 +373,8 @@ enum rsc_handling_status {
>>>>     * @get_boot_addr:=09get boot address to entry point specified in
>>>> firmware
>>>>     */
>>>>    struct rproc_ops {
>>>>  +=09int (*prepare)(struct rproc *rproc);
>>>>  +=09void (*unprepare)(struct rproc *rproc);
>>>>    =09int (*start)(struct rproc *rproc);
>>>>    =09int (*stop)(struct rproc *rproc);
> > >>    =09void (*kick)(struct rproc *rproc, int vqid);
