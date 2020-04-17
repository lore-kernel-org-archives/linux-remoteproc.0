Return-Path: <cleger@kalray.eu>
Date: Fri, 17 Apr 2020 21:43:47 +0200 (CEST)
From: =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalrayinc.com>
Message-ID: <1280711269.16158926.1587152627279.JavaMail.zimbra@kalray.eu>
In-Reply-To: <20200417193837.GB6797@xps15>
References: <20200410102433.2672-1-cleger@kalray.eu> <20200410102433.2672-2-cleger@kalray.eu> <20200417193837.GB6797@xps15>
Subject: Re: [PATCH 1/2] remoteproc: add rproc_coredump_set_elf_info
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-remoteproc <linux-remoteproc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-stm32 <linux-stm32@st-md-mailman.stormreply.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-ID: <linux-remoteproc@vger.kernel.org>

----- On 17 Apr, 2020, at 21:38, Mathieu Poirier mathieu.poirier@linaro.org=
 wrote:

> On Fri, Apr 10, 2020 at 12:24:32PM +0200, Clement Leger wrote:
>> This function allows drivers to correctly setup the coredump output
>> elf information.
>>=20
>> Signed-off-by: Clement Leger <cleger@kalray.eu>
>> ---
>>  drivers/remoteproc/remoteproc_core.c       | 32 ++++++++++++++++++++--
>>  drivers/remoteproc/remoteproc_elf_loader.c |  3 --
>>  include/linux/remoteproc.h                 |  2 ++
>>  3 files changed, 32 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/drivers/remoteproc/remoteproc_core.c
>> b/drivers/remoteproc/remoteproc_core.c
>> index a9ac1d01e09b..382443bab583 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1562,6 +1562,28 @@ int rproc_coredump_add_custom_segment(struct rpro=
c
>> *rproc,
>>  }
>>  EXPORT_SYMBOL(rproc_coredump_add_custom_segment);
>> =20
>> +/**
>> + * rproc_coredump_set_elf_info() - set coredump elf information
>> + * @rproc:=09handle of a remote processor
>> + * @class:=09elf class for coredump elf file
>> + * @size:=09elf machine for coredump elf file

I just noticed that there is a typo, this should be "machine" and not "size=
".
Let me know if you'll fix it when applying.

Thanks,

Cl=C3=A9ment

>> + *
>> + * Set elf information which will be used for coredump elf file.
>> + *
>> + * Return: 0 on success, negative errno on error.
>> + */
>> +int rproc_coredump_set_elf_info(struct rproc *rproc, u8 class, u16 mach=
ine)
>> +{
>> +=09if (class !=3D ELFCLASS64 && class !=3D ELFCLASS32)
>> +=09=09return -EINVAL;
>> +
>> +=09rproc->elf_class =3D class;
>> +=09rproc->elf_machine =3D machine;
>> +
>> +=09return 0;
>> +}
>> +EXPORT_SYMBOL(rproc_coredump_set_elf_info);
>> +
>>  /**
>>   * rproc_coredump() - perform coredump
>>   * @rproc:=09rproc handle
>> @@ -1584,6 +1606,11 @@ static void rproc_coredump(struct rproc *rproc)
>>  =09if (list_empty(&rproc->dump_segments))
>>  =09=09return;
>> =20
>> +=09if (class =3D=3D ELFCLASSNONE) {
>> +=09=09dev_err(&rproc->dev, "Elf class is not set\n");
>> +=09=09return;
>> +=09}
>> +
>>  =09data_size =3D elf_size_of_hdr(class);
>>  =09list_for_each_entry(segment, &rproc->dump_segments, node) {
>>  =09=09data_size +=3D elf_size_of_phdr(class) + segment->size;
>> @@ -1602,7 +1629,7 @@ static void rproc_coredump(struct rproc *rproc)
>>  =09elf_hdr_init_ident(ehdr, class);
>> =20
>>  =09elf_hdr_set_e_type(class, ehdr, ET_CORE);
>> -=09elf_hdr_set_e_machine(class, ehdr, EM_NONE);
>> +=09elf_hdr_set_e_machine(class, ehdr, rproc->elf_machine);
>>  =09elf_hdr_set_e_version(class, ehdr, EV_CURRENT);
>>  =09elf_hdr_set_e_entry(class, ehdr, rproc->bootaddr);
>>  =09elf_hdr_set_e_phoff(class, ehdr, elf_size_of_hdr(class));
>> @@ -2043,7 +2070,8 @@ struct rproc *rproc_alloc(struct device *dev, cons=
t char
>> *name,
>>  =09rproc->name =3D name;
>>  =09rproc->priv =3D &rproc[1];
>>  =09rproc->auto_boot =3D true;
>> -=09rproc->elf_class =3D ELFCLASS32;
>> +=09rproc->elf_class =3D ELFCLASSNONE;
>> +=09rproc->elf_machine =3D EM_NONE;
>> =20
>>  =09device_initialize(&rproc->dev);
>>  =09rproc->dev.parent =3D dev;
>> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c
>> b/drivers/remoteproc/remoteproc_elf_loader.c
>> index 16e2c496fd45..4869fb7d8fe4 100644
>> --- a/drivers/remoteproc/remoteproc_elf_loader.c
>> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
>> @@ -248,9 +248,6 @@ int rproc_elf_load_segments(struct rproc *rproc, con=
st
>> struct firmware *fw)
>>  =09=09=09memset(ptr + filesz, 0, memsz - filesz);
>>  =09}
>> =20
>> -=09if (ret =3D=3D 0)
>> -=09=09rproc->elf_class =3D class;
>> -
>>  =09return ret;
>>  }
>>  EXPORT_SYMBOL(rproc_elf_load_segments);
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index ed127b2d35ca..d67eb5a40476 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -515,6 +515,7 @@ struct rproc {
>>  =09struct list_head dump_segments;
>>  =09int nb_vdev;
>>  =09u8 elf_class;
>> +=09u16 elf_machine;
>>  };
>=20
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>=20
>> =20
>>  /**
>> @@ -619,6 +620,7 @@ int rproc_coredump_add_custom_segment(struct rproc *=
rproc,
>>  =09=09=09=09=09=09     struct rproc_dump_segment *segment,
>>  =09=09=09=09=09=09     void *dest),
>>  =09=09=09=09      void *priv);
>> +int rproc_coredump_set_elf_info(struct rproc *rproc, u8 class, u16 mach=
ine);
>> =20
>>  static inline struct rproc_vdev *vdev_to_rvdev(struct virtio_device *vd=
ev)
>>  {
>> --
>> 2.17.1
