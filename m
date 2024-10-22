Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B991BC07E;
	Tue, 22 Oct 2024 16:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729616344; cv=none; b=uqpwGWMoGqB5w6U0dC75UklgVBJjB51aTGDDNgWWR6G9fSEF71DtYGQ5tmo7Du4P8oE2edVWwqXyXnflXJSuuhVp27YDJeDmc5oheZEzlY+sxgA3XwpF5G82X1RAfLdkJFN20lqQv6U65N6CLLzNUCKtzZySflZoNRVV2btt4OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729616344; c=relaxed/simple;
	bh=gNM2FyAIUUyslnMkuyH7nofcNXbncUfZFL85Lzhoui0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=itxrVZKz8xLqu6WEOb9WExWU4ASBq1xvCpwehu6/cLx2tPpNYo22YchiA6TExNkYH2wj6WiGHPTNzQ5IixuhktYrsodSDEeKPy8cV4n664u5GB/45B2QDCDF71UxcujHgUItMXG9GF1Y+olrpJDPI2PsXZ3kbShfi8iXmiLPZng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+IbmHn/; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+IbmHn/"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb5a9c7420so59804161fa.3;
        Tue, 22 Oct 2024 09:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729616340; x=1730221140; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttbbPBqDDT+azp+547+q7rexAnC5MIoM9W9HtWReKZ0=;
        b=L+IbmHn/zn6lsZO3qQbVIjWnD+cbP933TsaD/xQCf2C3RfqxxDAL4X2IrV1mQBzht7
         3owLasteFZfTxf3dTngpgb8kEjJzxXqf12kI0cstyqjqR2b53wBwhzhV33d4TgSYmo8T
         ZF6gLJ/b8vaBRtKaE9+ETlW/FHTsXwM+98gt95zCaA1S/haSk0dgpMJhpNkgnj3D5aiF
         VcTEoQYlWdxUPnpDVRSUGiYbQ2hYWlp2GvlLwNCbTo+MbbBHGgdCjawG+Gp7sTy24yB5
         8DypzObwSrQj5B04jJKk+cgAQf6wXlbzA3n8jBReWL83L4xTUvRQwFddTb5uaGvC0aSK
         WCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729616340; x=1730221140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ttbbPBqDDT+azp+547+q7rexAnC5MIoM9W9HtWReKZ0=;
        b=HTXzh5Mqzbqt3CskbQi0+hWNy6dZ+6hY685ixYq7GszpDBNwXcIGJdeEmAIaqEHf/I
         WMYXfIrhmQEUITFKzKMUleYqu08n5fbUXhOwKpLpRToP1sIOxxqIY/4ZyTQ9uMtTEfOT
         G/BQja4KrvGRg2r3QmjV4/OUbMtVbKZwbBzkYiIMxmmkG3MpMZHEucT8dxu1ETgltJ1x
         lLK67ROng9TqAVqyEiJBucKla4YMFyp6XKsD3yd52Rnbfx18jPBV0u+nMgLntpgpXaeS
         oEvy/ZLMau43AoPz5diKkni7jh1JXVtVe/YzEksIjkkXIpwMW0J5gKnTx497EN77AG8E
         0T1w==
X-Forwarded-Encrypted: i=1; AJvYcCVGbzOg/qz1z+dcU4haVpSXA7cz6yJm0ryqFpnrDwGRUS+XwOF4B+IBRmWf5T0EuDSG0xrhCgxR6EaX0TgF@vger.kernel.org, AJvYcCVhoCjJv1L2666H1tZybZjzFQKSr2QEPMoJ2+yavgV6Qjw1S9B6K4Uie47n9SFwWOGzmcwK9GVq/0c=@vger.kernel.org, AJvYcCWYFRx/Sy8HElwj+GdQCAM7mSpMq1b7LtRS7yhjU88aFTfw3eVaJee3m2VuF7vyykRYB3zVip+5gR1A0I88XSymGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg55pIUjDdCP9aAXviut2Wa3ws1FkYNE/cte9ZS+XHxVyVZ+IK
	5LbH+koT5aA2AIUPJufXWgIEUX0GmF5Gy3dRzApelzvS/lAs0Q9hz/u/+4CGukbiUc2WmAbPNAQ
	lXhvD0Gkvj1myqGPYYiOkDM5euZs=
X-Google-Smtp-Source: AGHT+IGrpxS/Ly5KPjCXR/tYb5+5OLmWZJWlAxwPynVBpQKallIRc6zuwGDFeWJtyOybVgHIr2vfN4Qp8oEHlPVTGi0=
X-Received: by 2002:a2e:bea5:0:b0:2fa:cf82:a1b2 with SMTP id
 38308e7fff4ca-2fc9bc3559dmr1285241fa.31.1729616339603; Tue, 22 Oct 2024
 09:58:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017011124.69257-1-yesanishhere@gmail.com>
 <ZxfOirsZsyjopSQm@p14s> <CABCoZhAhct6AFKeNiVqwhz_5jFFsQ89uto4uvoeDo18azijLEQ@mail.gmail.com>
In-Reply-To: <CABCoZhAhct6AFKeNiVqwhz_5jFFsQ89uto4uvoeDo18azijLEQ@mail.gmail.com>
From: anish kumar <yesanishhere@gmail.com>
Date: Tue, 22 Oct 2024 09:58:48 -0700
Message-ID: <CABCoZhA+sio2sOkzsQmDTt-4iZq70Mh8KQG=VCNACBAFXRdq9w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] remoteproc: Documentation: move from staging
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 9:56=E2=80=AFAM anish kumar <yesanishhere@gmail.com=
> wrote:
>
>
>
> On Tue, Oct 22, 2024 at 9:10=E2=80=AFAM Mathieu Poirier <mathieu.poirier@=
linaro.org> wrote:
>>
>> On Wed, Oct 16, 2024 at 06:11:23PM -0700, anish kumar wrote:
>> > In preparation of making the documentation
>> > mainline. Remove the documentation from staging.
>> >
>> > Signed-off-by: anish kumar <yesanishhere@gmail.com>
>> > ---
>> > v2:
>> > | Reported-by: kernel test robot <lkp@intel.com>
>> > | Closes: https://lore.kernel.org/oe-kbuild-all/202410161444.jOKMsoGS-=
lkp@intel.com/
>> >
>> >  Documentation/staging/remoteproc.rst | 359 --------------------------=
-
>> >  MAINTAINERS                          |   1 -
>>
>> We did not understood each other.  Move remoteproc.rst to Documentation/=
 the way
>> it is now in one patch and then make modifications to it in another patc=
h.  Even
>> better if the modifications in the second patch can be broken down furth=
er.
>
>
Thanks for the reply. I will do below:
1. Add the cover letter
2. Move remoteproc.rst to Documentation/ in the first patch.
3. Second patch for remoteproc core.
4. third patch for userspace api documentation.
5. fourth patch for kernel driver api documentation.
>
>>
>> And please add a cover letter for V3.
>>
>> Thanks,
>> Mathieu
>>
>> >  2 files changed, 360 deletions(-)
>> >  delete mode 100644 Documentation/staging/remoteproc.rst
>> >
>> > diff --git a/Documentation/staging/remoteproc.rst b/Documentation/stag=
ing/remoteproc.rst
>> > deleted file mode 100644
>> > index 9cccd3dd6a4b..000000000000
>> > --- a/Documentation/staging/remoteproc.rst
>> > +++ /dev/null
>> > @@ -1,359 +0,0 @@
>> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>> > -Remote Processor Framework
>> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>> > -
>> > -Introduction
>> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > -
>> > -Modern SoCs typically have heterogeneous remote processor devices in =
asymmetric
>> > -multiprocessing (AMP) configurations, which may be running different =
instances
>> > -of operating system, whether it's Linux or any other flavor of real-t=
ime OS.
>> > -
>> > -OMAP4, for example, has dual Cortex-A9, dual Cortex-M3 and a C64x+ DS=
P.
>> > -In a typical configuration, the dual cortex-A9 is running Linux in a =
SMP
>> > -configuration, and each of the other three cores (two M3 cores and a =
DSP)
>> > -is running its own instance of RTOS in an AMP configuration.
>> > -
>> > -The remoteproc framework allows different platforms/architectures to
>> > -control (power on, load firmware, power off) those remote processors =
while
>> > -abstracting the hardware differences, so the entire driver doesn't ne=
ed to be
>> > -duplicated. In addition, this framework also adds rpmsg virtio device=
s
>> > -for remote processors that supports this kind of communication. This =
way,
>> > -platform-specific remoteproc drivers only need to provide a few low-l=
evel
>> > -handlers, and then all rpmsg drivers will then just work
>> > -(for more information about the virtio-based rpmsg bus and its driver=
s,
>> > -please read Documentation/staging/rpmsg.rst).
>> > -Registration of other types of virtio devices is now also possible. F=
irmwares
>> > -just need to publish what kind of virtio devices do they support, and=
 then
>> > -remoteproc will add those devices. This makes it possible to reuse th=
e
>> > -existing virtio drivers with remote processor backends at a minimal d=
evelopment
>> > -cost.
>> > -
>> > -User API
>> > -=3D=3D=3D=3D=3D=3D=3D=3D
>> > -
>> > -::
>> > -
>> > -  int rproc_boot(struct rproc *rproc)
>> > -
>> > -Boot a remote processor (i.e. load its firmware, power it on, ...).
>> > -
>> > -If the remote processor is already powered on, this function immediat=
ely
>> > -returns (successfully).
>> > -
>> > -Returns 0 on success, and an appropriate error value otherwise.
>> > -Note: to use this function you should already have a valid rproc
>> > -handle. There are several ways to achieve that cleanly (devres, pdata=
,
>> > -the way remoteproc_rpmsg.c does this, or, if this becomes prevalent, =
we
>> > -might also consider using dev_archdata for this).
>> > -
>> > -::
>> > -
>> > -  void rproc_shutdown(struct rproc *rproc)
>> > -
>> > -Power off a remote processor (previously booted with rproc_boot()).
>> > -In case @rproc is still being used by an additional user(s), then
>> > -this function will just decrement the power refcount and exit,
>> > -without really powering off the device.
>> > -
>> > -Every call to rproc_boot() must (eventually) be accompanied by a call
>> > -to rproc_shutdown(). Calling rproc_shutdown() redundantly is a bug.
>> > -
>> > -.. note::
>> > -
>> > -  we're not decrementing the rproc's refcount, only the power refcoun=
t.
>> > -  which means that the @rproc handle stays valid even after
>> > -  rproc_shutdown() returns, and users can still use it with a subsequ=
ent
>> > -  rproc_boot(), if needed.
>> > -
>> > -::
>> > -
>> > -  struct rproc *rproc_get_by_phandle(phandle phandle)
>> > -
>> > -Find an rproc handle using a device tree phandle. Returns the rproc
>> > -handle on success, and NULL on failure. This function increments
>> > -the remote processor's refcount, so always use rproc_put() to
>> > -decrement it back once rproc isn't needed anymore.
>> > -
>> > -Typical usage
>> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > -
>> > -::
>> > -
>> > -  #include <linux/remoteproc.h>
>> > -
>> > -  /* in case we were given a valid 'rproc' handle */
>> > -  int dummy_rproc_example(struct rproc *my_rproc)
>> > -  {
>> > -     int ret;
>> > -
>> > -     /* let's power on and boot our remote processor */
>> > -     ret =3D rproc_boot(my_rproc);
>> > -     if (ret) {
>> > -             /*
>> > -              * something went wrong. handle it and leave.
>> > -              */
>> > -     }
>> > -
>> > -     /*
>> > -      * our remote processor is now powered on... give it some work
>> > -      */
>> > -
>> > -     /* let's shut it down now */
>> > -     rproc_shutdown(my_rproc);
>> > -  }
>> > -
>> > -API for implementors
>> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > -
>> > -::
>> > -
>> > -  struct rproc *rproc_alloc(struct device *dev, const char *name,
>> > -                             const struct rproc_ops *ops,
>> > -                             const char *firmware, int len)
>> > -
>> > -Allocate a new remote processor handle, but don't register
>> > -it yet. Required parameters are the underlying device, the
>> > -name of this remote processor, platform-specific ops handlers,
>> > -the name of the firmware to boot this rproc with, and the
>> > -length of private data needed by the allocating rproc driver (in byte=
s).
>> > -
>> > -This function should be used by rproc implementations during
>> > -initialization of the remote processor.
>> > -
>> > -After creating an rproc handle using this function, and when ready,
>> > -implementations should then call rproc_add() to complete
>> > -the registration of the remote processor.
>> > -
>> > -On success, the new rproc is returned, and on failure, NULL.
>> > -
>> > -.. note::
>> > -
>> > -  **never** directly deallocate @rproc, even if it was not registered
>> > -  yet. Instead, when you need to unroll rproc_alloc(), use rproc_free=
().
>> > -
>> > -::
>> > -
>> > -  void rproc_free(struct rproc *rproc)
>> > -
>> > -Free an rproc handle that was allocated by rproc_alloc.
>> > -
>> > -This function essentially unrolls rproc_alloc(), by decrementing the
>> > -rproc's refcount. It doesn't directly free rproc; that would happen
>> > -only if there are no other references to rproc and its refcount now
>> > -dropped to zero.
>> > -
>> > -::
>> > -
>> > -  int rproc_add(struct rproc *rproc)
>> > -
>> > -Register @rproc with the remoteproc framework, after it has been
>> > -allocated with rproc_alloc().
>> > -
>> > -This is called by the platform-specific rproc implementation, wheneve=
r
>> > -a new remote processor device is probed.
>> > -
>> > -Returns 0 on success and an appropriate error code otherwise.
>> > -Note: this function initiates an asynchronous firmware loading
>> > -context, which will look for virtio devices supported by the rproc's
>> > -firmware.
>> > -
>> > -If found, those virtio devices will be created and added, so as a res=
ult
>> > -of registering this remote processor, additional virtio drivers might=
 get
>> > -probed.
>> > -
>> > -::
>> > -
>> > -  int rproc_del(struct rproc *rproc)
>> > -
>> > -Unroll rproc_add().
>> > -
>> > -This function should be called when the platform specific rproc
>> > -implementation decides to remove the rproc device. it should
>> > -_only_ be called if a previous invocation of rproc_add()
>> > -has completed successfully.
>> > -
>> > -After rproc_del() returns, @rproc is still valid, and its
>> > -last refcount should be decremented by calling rproc_free().
>> > -
>> > -Returns 0 on success and -EINVAL if @rproc isn't valid.
>> > -
>> > -::
>> > -
>> > -  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type =
type)
>> > -
>> > -Report a crash in a remoteproc
>> > -
>> > -This function must be called every time a crash is detected by the
>> > -platform specific rproc implementation. This should not be called fro=
m a
>> > -non-remoteproc driver. This function can be called from atomic/interr=
upt
>> > -context.
>> > -
>> > -Implementation callbacks
>> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>> > -
>> > -These callbacks should be provided by platform-specific remoteproc
>> > -drivers::
>> > -
>> > -  /**
>> > -   * struct rproc_ops - platform-specific device handlers
>> > -   * @start: power on the device and boot it
>> > -   * @stop:  power off the device
>> > -   * @kick:  kick a virtqueue (virtqueue id given as a parameter)
>> > -   */
>> > -  struct rproc_ops {
>> > -     int (*start)(struct rproc *rproc);
>> > -     int (*stop)(struct rproc *rproc);
>> > -     void (*kick)(struct rproc *rproc, int vqid);
>> > -  };
>> > -
>> > -Every remoteproc implementation should at least provide the ->start a=
nd ->stop
>> > -handlers. If rpmsg/virtio functionality is also desired, then the ->k=
ick handler
>> > -should be provided as well.
>> > -
>> > -The ->start() handler takes an rproc handle and should then power on =
the
>> > -device and boot it (use rproc->priv to access platform-specific priva=
te data).
>> > -The boot address, in case needed, can be found in rproc->bootaddr (re=
moteproc
>> > -core puts there the ELF entry point).
>> > -On success, 0 should be returned, and on failure, an appropriate erro=
r code.
>> > -
>> > -The ->stop() handler takes an rproc handle and powers the device down=
.
>> > -On success, 0 is returned, and on failure, an appropriate error code.
>> > -
>> > -The ->kick() handler takes an rproc handle, and an index of a virtque=
ue
>> > -where new message was placed in. Implementations should interrupt the=
 remote
>> > -processor and let it know it has pending messages. Notifying remote p=
rocessors
>> > -the exact virtqueue index to look in is optional: it is easy (and not
>> > -too expensive) to go through the existing virtqueues and look for new=
 buffers
>> > -in the used rings.
>> > -
>> > -Binary Firmware Structure
>> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>> > -
>> > -At this point remoteproc supports ELF32 and ELF64 firmware binaries. =
However,
>> > -it is quite expected that other platforms/devices which we'd want to
>> > -support with this framework will be based on different binary formats=
.
>> > -
>> > -When those use cases show up, we will have to decouple the binary for=
mat
>> > -from the framework core, so we can support several binary formats wit=
hout
>> > -duplicating common code.
>> > -
>> > -When the firmware is parsed, its various segments are loaded to memor=
y
>> > -according to the specified device address (might be a physical addres=
s
>> > -if the remote processor is accessing memory directly).
>> > -
>> > -In addition to the standard ELF segments, most remote processors woul=
d
>> > -also include a special section which we call "the resource table".
>> > -
>> > -The resource table contains system resources that the remote processo=
r
>> > -requires before it should be powered on, such as allocation of physic=
ally
>> > -contiguous memory, or iommu mapping of certain on-chip peripherals.
>> > -Remotecore will only power up the device after all the resource table=
's
>> > -requirement are met.
>> > -
>> > -In addition to system resources, the resource table may also contain
>> > -resource entries that publish the existence of supported features
>> > -or configurations by the remote processor, such as trace buffers and
>> > -supported virtio devices (and their configurations).
>> > -
>> > -The resource table begins with this header::
>> > -
>> > -  /**
>> > -   * struct resource_table - firmware resource table header
>> > -   * @ver: version number
>> > -   * @num: number of resource entries
>> > -   * @reserved: reserved (must be zero)
>> > -   * @offset: array of offsets pointing at the various resource entri=
es
>> > -   *
>> > -   * The header of the resource table, as expressed by this structure=
,
>> > -   * contains a version number (should we need to change this format =
in the
>> > -   * future), the number of available resource entries, and their off=
sets
>> > -   * in the table.
>> > -   */
>> > -  struct resource_table {
>> > -     u32 ver;
>> > -     u32 num;
>> > -     u32 reserved[2];
>> > -     u32 offset[0];
>> > -  } __packed;
>> > -
>> > -Immediately following this header are the resource entries themselves=
,
>> > -each of which begins with the following resource entry header::
>> > -
>> > -  /**
>> > -   * struct fw_rsc_hdr - firmware resource entry header
>> > -   * @type: resource type
>> > -   * @data: resource data
>> > -   *
>> > -   * Every resource entry begins with a 'struct fw_rsc_hdr' header pr=
oviding
>> > -   * its @type. The content of the entry itself will immediately foll=
ow
>> > -   * this header, and it should be parsed according to the resource t=
ype.
>> > -   */
>> > -  struct fw_rsc_hdr {
>> > -     u32 type;
>> > -     u8 data[0];
>> > -  } __packed;
>> > -
>> > -Some resources entries are mere announcements, where the host is info=
rmed
>> > -of specific remoteproc configuration. Other entries require the host =
to
>> > -do something (e.g. allocate a system resource). Sometimes a negotiati=
on
>> > -is expected, where the firmware requests a resource, and once allocat=
ed,
>> > -the host should provide back its details (e.g. address of an allocate=
d
>> > -memory region).
>> > -
>> > -Here are the various resource types that are currently supported::
>> > -
>> > -  /**
>> > -   * enum fw_resource_type - types of resource entries
>> > -   *
>> > -   * @RSC_CARVEOUT:   request for allocation of a physically contiguo=
us
>> > -   *             memory region.
>> > -   * @RSC_DEVMEM:     request to iommu_map a memory-based peripheral.
>> > -   * @RSC_TRACE:         announces the availability of a trace buffer=
 into which
>> > -   *             the remote processor will be writing logs.
>> > -   * @RSC_VDEV:       declare support for a virtio device, and serve =
as its
>> > -   *             virtio header.
>> > -   * @RSC_LAST:       just keep this one at the end
>> > -   * @RSC_VENDOR_START:      start of the vendor specific resource ty=
pes range
>> > -   * @RSC_VENDOR_END:        end of the vendor specific resource type=
s range
>> > -   *
>> > -   * Please note that these values are used as indices to the rproc_h=
andle_rsc
>> > -   * lookup table, so please keep them sane. Moreover, @RSC_LAST is u=
sed to
>> > -   * check the validity of an index before the lookup table is access=
ed, so
>> > -   * please update it as needed.
>> > -   */
>> > -  enum fw_resource_type {
>> > -     RSC_CARVEOUT            =3D 0,
>> > -     RSC_DEVMEM              =3D 1,
>> > -     RSC_TRACE               =3D 2,
>> > -     RSC_VDEV                =3D 3,
>> > -     RSC_LAST                =3D 4,
>> > -     RSC_VENDOR_START        =3D 128,
>> > -     RSC_VENDOR_END          =3D 512,
>> > -  };
>> > -
>> > -For more details regarding a specific resource type, please see its
>> > -dedicated structure in include/linux/remoteproc.h.
>> > -
>> > -We also expect that platform-specific resource entries will show up
>> > -at some point. When that happens, we could easily add a new RSC_PLATF=
ORM
>> > -type, and hand those resources to the platform-specific rproc driver =
to handle.
>> > -
>> > -Virtio and remoteproc
>> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > -
>> > -The firmware should provide remoteproc information about virtio devic=
es
>> > -that it supports, and their configurations: a RSC_VDEV resource entry
>> > -should specify the virtio device id (as in virtio_ids.h), virtio feat=
ures,
>> > -virtio config space, vrings information, etc.
>> > -
>> > -When a new remote processor is registered, the remoteproc framework
>> > -will look for its resource table and will register the virtio devices
>> > -it supports. A firmware may support any number of virtio devices, and
>> > -of any type (a single remote processor can also easily support severa=
l
>> > -rpmsg virtio devices this way, if desired).
>> > -
>> > -Of course, RSC_VDEV resource entries are only good enough for static
>> > -allocation of virtio devices. Dynamic allocations will also be made p=
ossible
>> > -using the rpmsg bus (similar to how we already do dynamic allocations=
 of
>> > -rpmsg channels; read more about it in rpmsg.txt).
>> > diff --git a/MAINTAINERS b/MAINTAINERS
>> > index eeb4c70b3d5b..c0aa32970d07 100644
>> > --- a/MAINTAINERS
>> > +++ b/MAINTAINERS
>> > @@ -15907,7 +15907,6 @@ S:    Maintained
>> >  T:   git git://git.kernel.org/pub/scm/linux/kernel/git/andersson/remo=
teproc.git rproc-next
>> >  F:   Documentation/ABI/testing/sysfs-class-remoteproc
>> >  F:   Documentation/devicetree/bindings/remoteproc/
>> > -F:   Documentation/staging/remoteproc.rst
>> >  F:   drivers/remoteproc/
>> >  F:   include/linux/remoteproc.h
>> >  F:   include/linux/remoteproc/
>> > --
>> > 2.39.3 (Apple Git-146)
>> >
>> >
