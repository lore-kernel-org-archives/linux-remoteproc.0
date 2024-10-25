Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7105D209F31;
	Fri, 25 Oct 2024 15:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729869213; cv=none; b=tFXUxSorObbVzU+UzCEusIFMV8tLazN0KG+2PgkDt/vPdC7Riv+jA32q1xIQDzb5gWq+jEn7HW+2UoOR0Xq68VTgWq54nJBCuSGfn9HytBF/9nMA5S2Ntl6ntSa7zztGD0d4Wg+y5s2ed667hfnOEJlTyjrq60ZgNL8iNbdmYLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729869213; c=relaxed/simple;
	bh=pJJnZWDbfC6mo7L52Qz/hG3d3hpBQ8JXikqTFL4rOaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RJwTuyZnNKfWdBzva0hTcs6XRtJjU0QEjaFsP1lWY7RbA8kf9jHYtSnQnlEHUOoE8B3wHXLzH/dyVfp9vjQ/6JpLOD6rS+Xl5kpaFUPv9CmpcXiFofjgUVR2QJuAFThDdJ+uTXvQwOAiRC8bO3HDf+FWhWanx4Z9/mC7oi70xl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLt530Ji; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLt530Ji"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539e6c754bdso2020663e87.2;
        Fri, 25 Oct 2024 08:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729869206; x=1730474006; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYAnekjCXlhuXV2Yu0vpJPkMf9yQ8DbSb/XOOnm4sSQ=;
        b=jLt530JiQJGsZNWWJGCgnp7NgbU1dNKgzvY9gDIFNEj2RynOkbRfqVvLbla7z0hxxP
         qiVyre3hHgYj9znc/A4A8LKkRjfJkQuPF6BF0bW4mjcJhnmZKrfHk7NQgyH5XkOhG15V
         EggWJ5RS2Ejx7wvUW85iU/cv4i0DXhY9GJZnrWFBB5orDsl/Wh3ElxCbxa7pJducMumh
         2lDc1HXxS/ztVgwtyuEOmJi2pN3V23rYXUfbrFM0BZ273BO/0/hnT1yX4rtCTn/BE32L
         mF5YQ+G8xWKZ8WhredrQeWM9GtJNgMYra30pzezVV3akplwjsO371bi5GB4p6h1/BeSC
         Cd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729869206; x=1730474006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYAnekjCXlhuXV2Yu0vpJPkMf9yQ8DbSb/XOOnm4sSQ=;
        b=C5H1hnLr0wyF+IkeFMFPBDMcIrOD0yA9TS24bshPiW5jD/YOj+s7m7t3/WUqWNhoDY
         Vp+KiVQkK59ob57lgV9hzvpIVVaOQ6Cq7kEvTPv35HnYeQqPtqZA1ZLn2BRHU+CYTP8V
         upgb49kOhtqmq0VfZt222YuYt3k1dHvMmFE8Pst8dpYyNME27hJzHgUESikBP09Yd180
         HHbzDjVtsrS1zbjscR/6DtUvEhVHR+lvwBRkmaRyY/+Yh+F23Eelk4tye29d02NS1yuW
         2hlo35tlSuXxzyXPRF747w5ATg8CUC82Sn8PwVV+KIZY82t17FaIu4Te0WAh5eMCOFpU
         ObvA==
X-Forwarded-Encrypted: i=1; AJvYcCVEbeopxTSEUNL+GJSKAJYCd8g50titqoNqsUCF4SJrbkREDk66wTRwJGn9IbWjZDnboRb71x7Ova0=@vger.kernel.org, AJvYcCVdzUjpEYEYjzbEGCp3j3DXDE00IRR2ALny8YrBZzkWdmzcydNob8eYDrmE590p62cPzTxyvElywD5GjTTzSYIr4w==@vger.kernel.org, AJvYcCVi5JhER2NvE6nkExBzSlPj91gxYdW8raE3Vr1VqFUcGRd+QhT/3C+sCy95/T5EqWKRx5X2wQ7K0hopRRIB@vger.kernel.org
X-Gm-Message-State: AOJu0YwN6hX+rpfH62sdqhQHqjAHXOMFqjBrBwRMchSJHMLuvS5J7zZI
	BV2Ojd66qKEcBleST6Iid7+cFacLFJ5N/mqR1fXL0oCh7mrfz95jIRTyfY5+VYNXMEIWJ53ooIw
	CHQky+alX5Xduvr2b7UAdEAjfOH4=
X-Google-Smtp-Source: AGHT+IEudXA3YKuTKKOgdm0vg3ZgNVc/6pVgtgzArE7aOIY9JNEtuv4ZHJytllGyaANzYVcuVVBpv3865fHn+8kxvuc=
X-Received: by 2002:a05:6512:2387:b0:539:f1ce:5fa8 with SMTP id
 2adb3069b0e04-53b1a3a710fmr5965050e87.49.1729869205873; Fri, 25 Oct 2024
 08:13:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023053357.5261-1-yesanishhere@gmail.com> <20241023053357.5261-4-yesanishhere@gmail.com>
 <ZxptkuoohxeWKaeD@p14s> <CABCoZhDHnAMEkUc5Qh+1atdZi2S7H+JHk1Ng6vjvGsF-NjW7dg@mail.gmail.com>
 <ZxuxwriIj4Yl+0op@p14s>
In-Reply-To: <ZxuxwriIj4Yl+0op@p14s>
From: anish kumar <yesanishhere@gmail.com>
Date: Fri, 25 Oct 2024 08:13:14 -0700
Message-ID: <CABCoZhCjiYqFmc7sg+2vJqO3MPZf7O1ka_V4gzXd5JTVEAOumg@mail.gmail.com>
Subject: Re: [PATCH V4 3/7] Documentation: remoteproc: add more information
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, corbet@lwn.net, 
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 7:57=E2=80=AFAM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Thu, Oct 24, 2024 at 11:17:40AM -0700, anish kumar wrote:
> > On Thu, Oct 24, 2024 at 8:53=E2=80=AFAM Mathieu Poirier
> > <mathieu.poirier@linaro.org> wrote:
> > >
> > > On Tue, Oct 22, 2024 at 10:33:53PM -0700, anish kumar wrote:
> > > > Added following changes:
> > > > 1. Components provided by remoteproc framework.
> > > > 2. Remoteproc driver responsibilities.
> > > > 3. Remoteproc framework responsibilities.
> > > > 4. Better explanation of how to ask for resources
> > > > from the framework by the remote processor.
> > > >
> > > > Signed-off-by: anish kumar <yesanishhere@gmail.com>
> > > > ---
> > > >  .../driver-api/remoteproc/remoteproc.rst      | 596 +++++++-------=
----
> > > >  1 file changed, 243 insertions(+), 353 deletions(-)
> > > >
> > > > diff --git a/Documentation/driver-api/remoteproc/remoteproc.rst b/D=
ocumentation/driver-api/remoteproc/remoteproc.rst
> > > > index 9cccd3dd6a4b..7ca545eea153 100644
> > > > --- a/Documentation/driver-api/remoteproc/remoteproc.rst
> > > > +++ b/Documentation/driver-api/remoteproc/remoteproc.rst
> > > > @@ -1,359 +1,249 @@
> > > > +.. SPDX-License-Identifier: GPL-2.0
> > > > +
> > > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > > >  Remote Processor Framework
> > > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > > >
> > > > -Introduction
> > > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > -
> > > > -Modern SoCs typically have heterogeneous remote processor devices =
in asymmetric
> > > > -multiprocessing (AMP) configurations, which may be running differe=
nt instances
> > > > -of operating system, whether it's Linux or any other flavor of rea=
l-time OS.
> > > > -
> > > > -OMAP4, for example, has dual Cortex-A9, dual Cortex-M3 and a C64x+=
 DSP.
> > > > -In a typical configuration, the dual cortex-A9 is running Linux in=
 a SMP
> > > > -configuration, and each of the other three cores (two M3 cores and=
 a DSP)
> > > > -is running its own instance of RTOS in an AMP configuration.
> > > > -
> > > > -The remoteproc framework allows different platforms/architectures =
to
> > > > -control (power on, load firmware, power off) those remote processo=
rs while
> > > > -abstracting the hardware differences, so the entire driver doesn't=
 need to be
> > > > -duplicated. In addition, this framework also adds rpmsg virtio dev=
ices
> > > > -for remote processors that supports this kind of communication. Th=
is way,
> > > > -platform-specific remoteproc drivers only need to provide a few lo=
w-level
> > > > -handlers, and then all rpmsg drivers will then just work
> > > > -(for more information about the virtio-based rpmsg bus and its dri=
vers,
> > > > -please read Documentation/staging/rpmsg.rst).
> > > > -Registration of other types of virtio devices is now also possible=
. Firmwares
> > > > -just need to publish what kind of virtio devices do they support, =
and then
> > > > -remoteproc will add those devices. This makes it possible to reuse=
 the
> > > > -existing virtio drivers with remote processor backends at a minima=
l development
> > > > -cost.
> > > > -
> > > > -User API
> > > > -=3D=3D=3D=3D=3D=3D=3D=3D
> > > > -
> > > > -::
> > > > -
> > > > -  int rproc_boot(struct rproc *rproc)
> > > > -
> > > > -Boot a remote processor (i.e. load its firmware, power it on, ...)=
.
> > > > -
> > > > -If the remote processor is already powered on, this function immed=
iately
> > > > -returns (successfully).
> > > > -
> > > > -Returns 0 on success, and an appropriate error value otherwise.
> > > > -Note: to use this function you should already have a valid rproc
> > > > -handle. There are several ways to achieve that cleanly (devres, pd=
ata,
> > > > -the way remoteproc_rpmsg.c does this, or, if this becomes prevalen=
t, we
> > > > -might also consider using dev_archdata for this).
> > > > -
> > > > -::
> > > > -
> > > > -  void rproc_shutdown(struct rproc *rproc)
> > > > -
> > > > -Power off a remote processor (previously booted with rproc_boot())=
.
> > > > -In case @rproc is still being used by an additional user(s), then
> > > > -this function will just decrement the power refcount and exit,
> > > > -without really powering off the device.
> > > > -
> > > > -Every call to rproc_boot() must (eventually) be accompanied by a c=
all
> > > > -to rproc_shutdown(). Calling rproc_shutdown() redundantly is a bug=
.
> > > > -
> > > > -.. note::
> > > > -
> > > > -  we're not decrementing the rproc's refcount, only the power refc=
ount.
> > > > -  which means that the @rproc handle stays valid even after
> > > > -  rproc_shutdown() returns, and users can still use it with a subs=
equent
> > > > -  rproc_boot(), if needed.
> > > > -
> > > > -::
> > > > -
> > > > -  struct rproc *rproc_get_by_phandle(phandle phandle)
> > > > -
> > > > -Find an rproc handle using a device tree phandle. Returns the rpro=
c
> > > > -handle on success, and NULL on failure. This function increments
> > > > -the remote processor's refcount, so always use rproc_put() to
> > > > -decrement it back once rproc isn't needed anymore.
> > > > -
> > > > -Typical usage
> > > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > -
> > > > -::
> > > > -
> > > > -  #include <linux/remoteproc.h>
> > > > -
> > > > -  /* in case we were given a valid 'rproc' handle */
> > > > -  int dummy_rproc_example(struct rproc *my_rproc)
> > > > -  {
> > > > -     int ret;
> > > > -
> > > > -     /* let's power on and boot our remote processor */
> > > > -     ret =3D rproc_boot(my_rproc);
> > > > -     if (ret) {
> > > > -             /*
> > > > -              * something went wrong. handle it and leave.
> > > > -              */
> > > > -     }
> > > > -
> > > > -     /*
> > > > -      * our remote processor is now powered on... give it some wor=
k
> > > > -      */
> > > > -
> > > > -     /* let's shut it down now */
> > > > -     rproc_shutdown(my_rproc);
> > > > -  }
> > > > -
> > > > -API for implementors
> > > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > -
> > > > -::
> > > > -
> > > > -  struct rproc *rproc_alloc(struct device *dev, const char *name,
> > > > -                             const struct rproc_ops *ops,
> > > > -                             const char *firmware, int len)
> > > > -
> > > > -Allocate a new remote processor handle, but don't register
> > > > -it yet. Required parameters are the underlying device, the
> > > > -name of this remote processor, platform-specific ops handlers,
> > > > -the name of the firmware to boot this rproc with, and the
> > > > -length of private data needed by the allocating rproc driver (in b=
ytes).
> > > > -
> > > > -This function should be used by rproc implementations during
> > > > -initialization of the remote processor.
> > > > -
> > > > -After creating an rproc handle using this function, and when ready=
,
> > > > -implementations should then call rproc_add() to complete
> > > > -the registration of the remote processor.
> > > > -
> > > > -On success, the new rproc is returned, and on failure, NULL.
> > > > -
> > > > -.. note::
> > > > -
> > > > -  **never** directly deallocate @rproc, even if it was not registe=
red
> > > > -  yet. Instead, when you need to unroll rproc_alloc(), use rproc_f=
ree().
> > > > -
> > > > -::
> > > > -
> > > > -  void rproc_free(struct rproc *rproc)
> > > > -
> > > > -Free an rproc handle that was allocated by rproc_alloc.
> > > > -
> > > > -This function essentially unrolls rproc_alloc(), by decrementing t=
he
> > > > -rproc's refcount. It doesn't directly free rproc; that would happe=
n
> > > > -only if there are no other references to rproc and its refcount no=
w
> > > > -dropped to zero.
> > > > -
> > > > -::
> > > > -
> > > > -  int rproc_add(struct rproc *rproc)
> > > > -
> > > > -Register @rproc with the remoteproc framework, after it has been
> > > > -allocated with rproc_alloc().
> > > > -
> > > > -This is called by the platform-specific rproc implementation, when=
ever
> > > > -a new remote processor device is probed.
> > > > -
> > > > -Returns 0 on success and an appropriate error code otherwise.
> > > > -Note: this function initiates an asynchronous firmware loading
> > > > -context, which will look for virtio devices supported by the rproc=
's
> > > > -firmware.
> > > > -
> > > > -If found, those virtio devices will be created and added, so as a =
result
> > > > -of registering this remote processor, additional virtio drivers mi=
ght get
> > > > -probed.
> > > > -
> > > > -::
> > > > -
> > > > -  int rproc_del(struct rproc *rproc)
> > > > -
> > > > -Unroll rproc_add().
> > > > -
> > > > -This function should be called when the platform specific rproc
> > > > -implementation decides to remove the rproc device. it should
> > > > -_only_ be called if a previous invocation of rproc_add()
> > > > -has completed successfully.
> > > > -
> > > > -After rproc_del() returns, @rproc is still valid, and its
> > > > -last refcount should be decremented by calling rproc_free().
> > > > -
> > > > -Returns 0 on success and -EINVAL if @rproc isn't valid.
> > > > -
> > > > -::
> > > > -
> > > > -  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_ty=
pe type)
> > > > -
> > > > -Report a crash in a remoteproc
> > > > -
> > > > -This function must be called every time a crash is detected by the
> > > > -platform specific rproc implementation. This should not be called =
from a
> > > > -non-remoteproc driver. This function can be called from atomic/int=
errupt
> > > > -context.
> > > > -
> > > > -Implementation callbacks
> > > > +.. Contents:
> > > > +
> > > > +   1.  Introduction
> > > > +   2.  Remoteproc framework responsibilities
> > > > +   3.  Remoteproc driver responsibilities
> > > > +   4.  Virtio and rpmsg
> > > > +
> > > > +1. Introduction
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +Modern System on Chips (SoCs) typically integrate heterogeneous re=
mote
> > > > +processor devices in asymmetric multiprocessing (AMP) configuratio=
ns.
> > > > +These processors may run different operating systems, such as Linu=
x and
> > > > +various real-time operating systems (RTOS).
> > >
> > > You are moving things around _and_ making modifications to the text i=
n the same
> > > patch, something I specifically asked not to do.  Moreover, the above=
 conveys
> >
> > Sorry for doing that, I thought I moved the file first as you instructe=
d but
> > I didn't understand that I should also not reword the sentences that co=
nvey
> > the same meaning. Will keep the text of below content in the same file:
> > 1. Introduction
> > 2. Binary Firmware Structure: will just add example as shown in this pa=
tch.
> > 3. Virtio and remoteproc: didn't change anything in the patch for this.
>
> We don't seem to understand each other - the "Virtio and remoteproc" sect=
ion is
> the first thing I red and what made me aware of the rewording.

I double checked and found you are right, I initially had changed
it but had no intention of changing in following
patches but somehow it creeped in. Will keep everything as before.

>
> >
> > For below:
> > 1. User API:
> > 2. Typical usage:
> > 3. API for implementors :
> >
> > Should I just move all of the above text as it is to
> > remoteproc-kernel-api.rst or
> > you prefer here as I feel it belongs there?
>
> I have looked at other subsystems documented under Documentation/driver-a=
pi and
> I can't find instances of the type [subsystem]-kernel-api.rst.  As such I=
 don't
> see what is so special about remoteproc that it would mandate adding a ne=
w file.
> Why can't it just be in a single file like most subsystems do?

Certainly, I can do that. Let me keep only the main file which
was the case, just add the relevant updates to the sections that
needs updates. Will that be agreeable to you?

>
> >
> > > exactly the same information as found in [1] but using different word=
s.  I
> > > am in favour of enhancing documentation but not creating unneeded chu=
rn.
> > >
> > > I found several instances of the same rewording pattern in the sectio=
ns below.
> > > As such I will not look at the other patches nor move forward with th=
is set.
> > >
> > > Thanks,
> > > Mathieu
> >
> > Thanks Mathieu, for reviewing and providing feedback as always.
> >
> > >
> > > [1]. https://elixir.bootlin.com/linux/v6.12-rc4/source/Documentation/=
staging/remoteproc.rst
> > >
> > > > +
> > > > +For example, the OMAP4 platform features dual Cortex-A9 cores, dua=
l
> > > > +Cortex-M3 cores, and a C64x+ DSP. In a standard setup, the Cortex-=
A9
> > > > +cores execute Linux in a symmetric multiprocessing (SMP) configura=
tion,
> > > > +while the M3 cores and DSP run independent instances of an RTOS.
> > > > +
> > > > +The remoteproc framework allows various platforms and architecture=
s to
> > > > +manage remote processors, including operations such as powering on=
,
> > > > +loading firmware, and powering off. This framework abstracts hardw=
are
> > > > +differences, promoting code reuse and minimizing duplication. It a=
lso
> > > > +supports rpmsg virtio devices for remote processors that utilize t=
his
> > > > +communication method. Consequently, platform-specific remoteproc d=
rivers
> > > > +need only implement a few low-level handlers, enabling seamless op=
eration
> > > > +of all rpmsg drivers. (For more details about the virtio-based rpm=
sg
> > > > +bus and its drivers, refer to rpmsg documentation.)
> > > > +
> > > > +Additionally, the framework allows for the registration of various
> > > > +virtio devices. Firmware can publish the types of virtio devices i=
t
> > > > +supports, facilitating their addition to the remoteproc framework.=
 This
> > > > +flexibility enables the reuse of existing virtio drivers with remo=
te
> > > > +processor backends at minimal development cost.
> > > > +
> > > > +The primary purpose of the remoteproc framework is to download fir=
mware
> > > > +for remote processors and manage their lifecycle. The framework co=
nsists
> > > > +of several key components:
> > > > +
> > > > +- **Character Driver**: Provides userspace access to control the r=
emote
> > > > +  processor.
> > > > +- **ELF Utility**: Offers functions for handling ELF files and man=
aging
> > > > +  resources requested by the remote processor.
> > > > +- **Remoteproc Core**: Manages firmware downloads and recovery act=
ions
> > > > +  in case of a remote processor crash.
> > > > +- **Coredump**: Provides facilities for coredumping and tracing fr=
om
> > > > +  the remote processor in the event of a crash.
> > > > +- **Userspace Interaction**: Uses sysfs and debugfs to manage the
> > > > +  lifecycle and status of the remote processor.
> > > > +- **Virtio Support**: Facilitates interaction with the virtio and
> > > > +  rpmsg bus.
> > > > +
> > > > +From here on, references to "framework" denote the remoteproc
> > > > +framework, and "driver" refers to the remoteproc driver that utili=
zes
> > > > +the framework for managing remote processors.
> > > > +
> > > > +2. Remoteproc framework Responsibilities
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +The framework begins by gathering information about the firmware f=
ile
> > > > +to be downloaded through the request_firmware function. It support=
s
> > > > +the ELF format and parses the firmware image to identify the physi=
cal
> > > > +addresses that need to be populated from the corresponding ELF sec=
tions.
> > > > +The framework also requires knowledge of the logical or I/O-mapped
> > > > +addresses in the application processor. Once this information is
> > > > +obtained from the driver, the framework transfers the data to the
> > > > +specified addresses and starts the remote, along with
> > > > +any devices physically or logically connected to it.
> > > > +
> > > > +Dependent devices, referred to as `subdevices` within the framewor=
k,
> > > > +are also managed post-registration by their respective drivers.
> > > > +Subdevices can register themselves using `rproc_(add/remove)_subde=
v`.
> > > > +Non-remoteproc drivers can use subdevices as a way to logically co=
nnect
> > > > +to remote and get lifecycle notifications of the remote.
> > > > +
> > > > +The framework oversees the lifecycle of the remote and
> > > > +provides the `rproc_report_crash` function, which the driver invok=
es
> > > > +upon receiving a crash notification from the remote. The
> > > > +notification method can differ based on the design of the remote
> > > > +processor and its communication with the application processor. Fo=
r
> > > > +instance, if the remote is a DSP equipped with a watchdog,
> > > > +unresponsive behavior triggers the watchdog, generating an interru=
pt
> > > > +that routes to the application processor, allowing it to call
> > > > +`rproc_report_crash` in the driver's interrupt context.
> > > > +
> > > > +During crash handling, the framework performs the following action=
s:
> > > > +
> > > > +a. Sends a request to stop the remote and any connected or
> > > > +   dependent subdevices.
> > > > +b. Generates a coredump, dumping all `resources` requested by the
> > > > +   remote alongside relevant debugging information. Resources are
> > > > +   explained below.
> > > > +c. Reloads the firmware and restarts the remote.
> > > > +
> > > > +If the `RPROC_FEAT_ATTACH_ON_RECOVERY` flag is set, the detach and
> > > > +attach callbacks of the driver are invoked without reloading the
> > > > +firmware. This is useful when the remote requires no
> > > > +assistance for recovery, or when the application processor can res=
tart
> > > > +independently. After recovery, the application processor can reatt=
ach
> > > > +to the remote.
> > > > +
> > > > +The remote can request resources from the framework, which
> > > > +allocates a ".resource_table" section. During the ELF parsing phas=
e,
> > > > +the framework identifies this section and calls the appropriate
> > > > +handler to allocate the requested resources.
> > > > +
> > > > +Resource management within the framework can accommodate any type =
of
> > > > +`fw_resource_type`.
> > > > +
> > > > +.. code-block:: c
> > > > +
> > > > +   enum fw_resource_type {
> > > > +       RSC_CARVEOUT      =3D 0,
> > > > +       RSC_DEVMEM        =3D 1,
> > > > +       RSC_TRACE         =3D 2,
> > > > +       RSC_VDEV          =3D 3,
> > > > +       RSC_LAST          =3D 4,
> > > > +       RSC_VENDOR_START  =3D 128,
> > > > +       RSC_VENDOR_END    =3D 512,
> > > > +   };
> > > > +
> > > > +   struct resource_table {
> > > > +       u32 ver;
> > > > +       u32 num;
> > > > +       u32 reserved[2];
> > > > +       u32 offset[];
> > > > +   } __packed;
> > > > +
> > > > +   struct fw_rsc_hdr {
> > > > +       u32 type;
> > > > +       u8 data[];
> > > > +   } __packed;
> > > > +
> > > > +For example, if the remote requests both `RSC_TRACE` and
> > > > +`RSC_CARVEOUT` for memory allocation, the ELF firmware can be stru=
ctured
> > > > +as follows:
> > > > +
> > > > +.. code-block:: c
> > > > +
> > > > +   #define MAX_SHARED_RESOURCE 2
> > > > +   #define LOG_BUF_SIZE 1000
> > > > +   #define CARVEOUT_DUMP_PA 0x12345678
> > > > +   #define CARVEOUT_DUMP_SIZE 2000
> > > > +
> > > > +   struct shared_resource_table {
> > > > +       u32 ver;
> > > > +       u32 num;
> > > > +       u32 reserved[2];
> > > > +       u32 offset[MAX_SHARED_RESOURCE];
> > > > +       struct fw_rsc_trace log_trace;
> > > > +       struct fw_rsc_carveout dump_carveout;
> > > > +   };
> > > > +
> > > > +   volatile struct shared_resource_table table =3D {
> > > > +       .ver =3D 1,
> > > > +       .num =3D 2,
> > > > +       .reserved =3D {0, 0},
> > > > +       .offset =3D {
> > > > +           offsetof(struct resource_table, log_trace),
> > > > +           offsetof(struct resource_table, dump_carveout),
> > > > +       },
> > > > +       .log_trace =3D {
> > > > +           RSC_TRACE,
> > > > +           (u32)log_buf, LOG_BUF_SIZE, 0, "log_trace",
> > > > +       },
> > > > +       .dump_carveout =3D {
> > > > +           RSC_CARVEOUT,
> > > > +           (u32)FW_RSC_ADDR_ANY, CARVEOUT_PA, 0, "carveout_dump",
> > > > +       },
> > > > +   };
> > > > +
> > > > +The framework creates a sysfs file when it encounters the `RSC_TRA=
CE`
> > > > +type to expose log information to userspace. Other resource types =
are
> > > > +handled accordingly. In the example above, `CARVEOUT_DUMP_SIZE` by=
tes
> > > > +of DMA memory will be allocated starting from `CARVEOUT_DUMP_PA`.
> > > > +
> > > > +
> > > > +3. Remoteproc driver responsibilities
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +The driver must provide the following information to the core:
> > > > +
> > > > +a. Translate device addresses (physical addresses) found in the EL=
F
> > > > +   firmware to virtual addresses in Linux using the `da_to_va`
> > > > +   callback. This allows the framework to copy ELF firmware from t=
he
> > > > +   filesystem to the addresses expected by the remote since
> > > > +   the framework cannot directly access those physical addresses.
> > > > +b. Prepare/unprepare the remote prior to firmware loading,
> > > > +   which may involve allocating carveout and reserved memory regio=
ns.
> > > > +c. Implement methods for starting and stopping the remote,
> > > > +   whether by setting registers or sending explicit interrupts,
> > > > +   depending on the hardware design.
> > > > +d. Provide attach and detach callbacks to start the remote
> > > > +   without loading the firmware. This is beneficial when the remot=
e
> > > > +   processor is already loaded and running.
> > > > +e. Implement a load callback for firmware loading, typically using
> > > > +   the ELF loader provided by the framework; currently, only ELF
> > > > +   format is supported.
> > > > +f. Invoke the framework's crash handler API upon detecting a remot=
e
> > > > +   crash.
> > > > +
> > > > +Drivers must fill the `rproc_ops` structure and call `rproc_alloc`
> > > > +to register themselves with the framework.
> > > > +
> > > > +.. code-block:: c
> > > > +
> > > > +   struct rproc_ops {
> > > > +       int (*prepare)(struct rproc *rproc);
> > > > +       int (*unprepare)(struct rproc *rproc);
> > > > +       int (*start)(struct rproc *rproc);
> > > > +       int (*stop)(struct rproc *rproc);
> > > > +       int (*attach)(struct rproc *rproc);
> > > > +       int (*detach)(struct rproc *rproc);
> > > > +       void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len,
> > > > +                          bool *is_iomem);
> > > > +       int (*parse_fw)(struct rproc *rproc, const struct firmware =
*fw);
> > > > +       int (*handle_rsc)(struct rproc *rproc, u32 rsc_type,
> > > > +                         void *rsc, int offset, int avail);
> > > > +       int (*load)(struct rproc *rproc, const struct firmware *fw)=
;
> > > > +       //snip
> > > > +   };
> > > > +
> > > > +
> > > > +4. Virtio and Remoteproc
> > > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > > >
> > > > -These callbacks should be provided by platform-specific remoteproc
> > > > -drivers::
> > > > -
> > > > -  /**
> > > > -   * struct rproc_ops - platform-specific device handlers
> > > > -   * @start: power on the device and boot it
> > > > -   * @stop:  power off the device
> > > > -   * @kick:  kick a virtqueue (virtqueue id given as a parameter)
> > > > -   */
> > > > -  struct rproc_ops {
> > > > -     int (*start)(struct rproc *rproc);
> > > > -     int (*stop)(struct rproc *rproc);
> > > > -     void (*kick)(struct rproc *rproc, int vqid);
> > > > -  };
> > > > -
> > > > -Every remoteproc implementation should at least provide the ->star=
t and ->stop
> > > > -handlers. If rpmsg/virtio functionality is also desired, then the =
->kick handler
> > > > -should be provided as well.
> > > > -
> > > > -The ->start() handler takes an rproc handle and should then power =
on the
> > > > -device and boot it (use rproc->priv to access platform-specific pr=
ivate data).
> > > > -The boot address, in case needed, can be found in rproc->bootaddr =
(remoteproc
> > > > -core puts there the ELF entry point).
> > > > -On success, 0 should be returned, and on failure, an appropriate e=
rror code.
> > > > -
> > > > -The ->stop() handler takes an rproc handle and powers the device d=
own.
> > > > -On success, 0 is returned, and on failure, an appropriate error co=
de.
> > > > -
> > > > -The ->kick() handler takes an rproc handle, and an index of a virt=
queue
> > > > -where new message was placed in. Implementations should interrupt =
the remote
> > > > -processor and let it know it has pending messages. Notifying remot=
e processors
> > > > -the exact virtqueue index to look in is optional: it is easy (and =
not
> > > > -too expensive) to go through the existing virtqueues and look for =
new buffers
> > > > -in the used rings.
> > > > -
> > > > -Binary Firmware Structure
> > > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > > -
> > > > -At this point remoteproc supports ELF32 and ELF64 firmware binarie=
s. However,
> > > > -it is quite expected that other platforms/devices which we'd want =
to
> > > > -support with this framework will be based on different binary form=
ats.
> > > > -
> > > > -When those use cases show up, we will have to decouple the binary =
format
> > > > -from the framework core, so we can support several binary formats =
without
> > > > -duplicating common code.
> > > > -
> > > > -When the firmware is parsed, its various segments are loaded to me=
mory
> > > > -according to the specified device address (might be a physical add=
ress
> > > > -if the remote processor is accessing memory directly).
> > > > -
> > > > -In addition to the standard ELF segments, most remote processors w=
ould
> > > > -also include a special section which we call "the resource table".
> > > > -
> > > > -The resource table contains system resources that the remote proce=
ssor
> > > > -requires before it should be powered on, such as allocation of phy=
sically
> > > > -contiguous memory, or iommu mapping of certain on-chip peripherals=
.
> > > > -Remotecore will only power up the device after all the resource ta=
ble's
> > > > -requirement are met.
> > > > -
> > > > -In addition to system resources, the resource table may also conta=
in
> > > > -resource entries that publish the existence of supported features
> > > > -or configurations by the remote processor, such as trace buffers a=
nd
> > > > -supported virtio devices (and their configurations).
> > > > -
> > > > -The resource table begins with this header::
> > > > -
> > > > -  /**
> > > > -   * struct resource_table - firmware resource table header
> > > > -   * @ver: version number
> > > > -   * @num: number of resource entries
> > > > -   * @reserved: reserved (must be zero)
> > > > -   * @offset: array of offsets pointing at the various resource en=
tries
> > > > -   *
> > > > -   * The header of the resource table, as expressed by this struct=
ure,
> > > > -   * contains a version number (should we need to change this form=
at in the
> > > > -   * future), the number of available resource entries, and their =
offsets
> > > > -   * in the table.
> > > > -   */
> > > > -  struct resource_table {
> > > > -     u32 ver;
> > > > -     u32 num;
> > > > -     u32 reserved[2];
> > > > -     u32 offset[0];
> > > > -  } __packed;
> > > > -
> > > > -Immediately following this header are the resource entries themsel=
ves,
> > > > -each of which begins with the following resource entry header::
> > > > -
> > > > -  /**
> > > > -   * struct fw_rsc_hdr - firmware resource entry header
> > > > -   * @type: resource type
> > > > -   * @data: resource data
> > > > -   *
> > > > -   * Every resource entry begins with a 'struct fw_rsc_hdr' header=
 providing
> > > > -   * its @type. The content of the entry itself will immediately f=
ollow
> > > > -   * this header, and it should be parsed according to the resourc=
e type.
> > > > -   */
> > > > -  struct fw_rsc_hdr {
> > > > -     u32 type;
> > > > -     u8 data[0];
> > > > -  } __packed;
> > > > -
> > > > -Some resources entries are mere announcements, where the host is i=
nformed
> > > > -of specific remoteproc configuration. Other entries require the ho=
st to
> > > > -do something (e.g. allocate a system resource). Sometimes a negoti=
ation
> > > > -is expected, where the firmware requests a resource, and once allo=
cated,
> > > > -the host should provide back its details (e.g. address of an alloc=
ated
> > > > -memory region).
> > > > -
> > > > -Here are the various resource types that are currently supported::
> > > > -
> > > > -  /**
> > > > -   * enum fw_resource_type - types of resource entries
> > > > -   *
> > > > -   * @RSC_CARVEOUT:   request for allocation of a physically conti=
guous
> > > > -   *             memory region.
> > > > -   * @RSC_DEVMEM:     request to iommu_map a memory-based peripher=
al.
> > > > -   * @RSC_TRACE:         announces the availability of a trace buf=
fer into which
> > > > -   *             the remote processor will be writing logs.
> > > > -   * @RSC_VDEV:       declare support for a virtio device, and ser=
ve as its
> > > > -   *             virtio header.
> > > > -   * @RSC_LAST:       just keep this one at the end
> > > > -   * @RSC_VENDOR_START:      start of the vendor specific resource=
 types range
> > > > -   * @RSC_VENDOR_END:        end of the vendor specific resource t=
ypes range
> > > > -   *
> > > > -   * Please note that these values are used as indices to the rpro=
c_handle_rsc
> > > > -   * lookup table, so please keep them sane. Moreover, @RSC_LAST i=
s used to
> > > > -   * check the validity of an index before the lookup table is acc=
essed, so
> > > > -   * please update it as needed.
> > > > -   */
> > > > -  enum fw_resource_type {
> > > > -     RSC_CARVEOUT            =3D 0,
> > > > -     RSC_DEVMEM              =3D 1,
> > > > -     RSC_TRACE               =3D 2,
> > > > -     RSC_VDEV                =3D 3,
> > > > -     RSC_LAST                =3D 4,
> > > > -     RSC_VENDOR_START        =3D 128,
> > > > -     RSC_VENDOR_END          =3D 512,
> > > > -  };
> > > > -
> > > > -For more details regarding a specific resource type, please see it=
s
> > > > -dedicated structure in include/linux/remoteproc.h.
> > > > -
> > > > -We also expect that platform-specific resource entries will show u=
p
> > > > -at some point. When that happens, we could easily add a new RSC_PL=
ATFORM
> > > > -type, and hand those resources to the platform-specific rproc driv=
er to handle.
> > > > -
> > > > -Virtio and remoteproc
> > > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > -
> > > > -The firmware should provide remoteproc information about virtio de=
vices
> > > > -that it supports, and their configurations: a RSC_VDEV resource en=
try
> > > > -should specify the virtio device id (as in virtio_ids.h), virtio f=
eatures,
> > > > -virtio config space, vrings information, etc.
> > > > -
> > > > -When a new remote processor is registered, the remoteproc framewor=
k
> > > > -will look for its resource table and will register the virtio devi=
ces
> > > > -it supports. A firmware may support any number of virtio devices, =
and
> > > > -of any type (a single remote processor can also easily support sev=
eral
> > > > -rpmsg virtio devices this way, if desired).
> > > > -
> > > > -Of course, RSC_VDEV resource entries are only good enough for stat=
ic
> > > > -allocation of virtio devices. Dynamic allocations will also be mad=
e possible
> > > > -using the rpmsg bus (similar to how we already do dynamic allocati=
ons of
> > > > -rpmsg channels; read more about it in rpmsg.txt).
> > > > +The firmware must provide remoteproc with information regarding th=
e
> > > > +virtio devices it supports and their configurations: an `RSC_VDEV`
> > > > +resource entry should detail the virtio device ID (as defined in
> > > > +`virtio_ids.h`), virtio features, virtio config space, vrings
> > > > +information, etc.
> > > > +
> > > > +Upon registration of a new remote, the remoteproc framework
> > > > +searches for its resource table and registers the supported virtio
> > > > +devices. A firmware may support multiple virtio devices, of variou=
s
> > > > +types (a single remote can support multiple rpmsg virtio
> > > > +devices if required).
> > > > +
> > > > +Moreover, `RSC_VDEV` resource entries suffice for static allocatio=
n
> > > > +of virtio devices. Dynamic allocations will also be supported usin=
g
> > > > +the rpmsg bus, akin to the handling of dynamic allocations for rpm=
sg
> > > > +channels. For more information, refer to rpmsg documentation.
> > > > --
> > > > 2.39.3 (Apple Git-146)
> > > >
