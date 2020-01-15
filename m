Return-Path: <cleger@kalray.eu>
Date: Wed, 15 Jan 2020 15:28:26 +0100 (CET)
From: =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalray.eu>
Message-ID: <79048597.12371594.1579098506802.JavaMail.zimbra@kalray.eu>
In-Reply-To: <088ceab9-f135-6e70-dcf6-f75ec46110b1@st.com>
References: <20200115102142.11229-1-cleger@kalray.eu> <088ceab9-f135-6e70-dcf6-f75ec46110b1@st.com>
Subject: Re: [PATCH] remoteproc: Add support for predefined notifyids
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc <linux-remoteproc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Arnaud,

----- On 15 Jan, 2020, at 15:06, Arnaud Pouliquen arnaud.pouliquen@st.com w=
rote:

> Hi Cl=C3=A9ment,
>=20
> On 1/15/20 11:21 AM, Clement Leger wrote:
>> In order to support preallocated notify ids, if their value is
>> equal to FW_RSC_NOTIFY_ID_ANY, then do no allocate a notify id
>> dynamically but try to allocate the requested one. This is useful when
>> using custom ids to bind them to custom vendor resources. For instance,
>> it allow to assign a group of queues to a specific interrupti in order
>> to dispatch notifications.
>>=20
>> Signed-off-by: Clement Leger <cleger@kalray.eu>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 27 +++++++++++++++++++--------
>>  include/linux/remoteproc.h           |  1 +
>>  2 files changed, 20 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/drivers/remoteproc/remoteproc_core.c
>> b/drivers/remoteproc/remoteproc_core.c
>> index 307df98347ba..b1485fcd0f11 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -351,14 +351,27 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, in=
t i)
>>  =09/*
>>  =09 * Assign an rproc-wide unique index for this vring
>>  =09 * TODO: assign a notifyid for rvdev updates as well
>> -=09 * TODO: support predefined notifyids (via resource table)
>>  =09 */
>> -=09ret =3D idr_alloc(&rproc->notifyids, rvring, 0, 0, GFP_KERNEL);
>> -=09if (ret < 0) {
>> -=09=09dev_err(dev, "idr_alloc failed: %d\n", ret);
>> -=09=09return ret;
>> +=09if (rsc->vring[i].notifyid =3D=3D FW_RSC_NOTIFY_ID_ANY) {
>> +=09=09ret =3D idr_alloc(&rproc->notifyids, rvring, 0, 0, GFP_KERNEL);
>> +=09=09if (ret < 0) {
>> +=09=09=09dev_err(dev, "idr_alloc failed: %d\n", ret);
>> +=09=09=09return ret;
>> +=09=09}
>> +=09=09notifyid =3D ret;
>> +
>> +=09=09/* Let the rproc know the notifyid of this vring.*/
>> +=09=09rsc->vring[i].notifyid =3D notifyid;
>> +=09} else {
>> +=09=09/* Reserve requested notify_id */
>> +=09=09notifyid =3D rsc->vring[i].notifyid;
>> +=09=09ret =3D idr_alloc(&rproc->notifyids, rvring, notifyid,
>> +=09=09=09=09notifyid + 1, GFP_KERNEL);
>> +=09=09if (ret < 0) {
>> +=09=09=09dev_err(dev, "idr_alloc failed: %d\n", ret);
>> +=09=09=09return ret;
>> +=09=09}
>>  =09}
>> -=09notifyid =3D ret;
>> =20
>>  =09/* Potentially bump max_notifyid */
>>  =09if (notifyid > rproc->max_notifyid)
>> @@ -366,8 +379,6 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int =
i)
>> =20
>>  =09rvring->notifyid =3D notifyid;
>> =20
>> -=09/* Let the rproc know the notifyid of this vring.*/
>> -=09rsc->vring[i].notifyid =3D notifyid;
>>  =09return 0;
>>  }
> The rproc_free_vring function resets the notifyid to -1 on free.
> This could generate a side effect if the resource table is not reloaded.

Oh indeed, I did not thought of that. What would you recommend ?
If using -1 in free vring, notify ids will be reallocated at next
round.

I was also worried that it would break some existing user applications
which uses "0" as a notify id in vring but expect the id to be
allocated dynamically. With my modification, it means it will try to=20
use "0" as a predefined id, leading to allocation failure.

>=20
>> =20
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index 16ad66683ad0..dcae3394243e 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -123,6 +123,7 @@ enum fw_resource_type {
>>  };
>> =20
>>  #define FW_RSC_ADDR_ANY (-1)
>> +#define FW_RSC_NOTIFY_ID_ANY (-1)This define can also be used in
>> rproc_free_vring

Indeed.

Thanks for your review.

Regards,

Cl=C3=A9ment

>=20
> Regards,
> Arnaud
>> =20
>>  /**
>>   * struct fw_rsc_carveout - physically contiguous memory request
