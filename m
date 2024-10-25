Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E047155392
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Oct 2024 15:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729869556; cv=none; b=bhfB1jMgJhS47c24bo1W6QJB7zjzB6wCIuREiSSHr0ZaP8jw25EE0zxnuOJKnRyWKMMdnQvCr5L4mCPrzuKbvNFUL0IIWE0JOiIb8i9CYTO3XWM/KH4pbruVQk2GqThg7/a0DdDDFG4WPwBr6kao35tVWF989KOGqOzSuNYgCMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729869556; c=relaxed/simple;
	bh=w/EVm7RX10Mo/xavKXY9QL9sFtWfopGynoXJ0TDEfWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kuw36oSBle5ZN1wAbY7cX1nGSCbpPPvDWY+UcVS5z8Zw0q8cKXe/bqTPXKq4ub7ULxrj1oboKUM6PG8qtq+7gmXlY2octG73A61dN7fhX2yR6HBrFqSl44Fqr4YIJMJU4a4RIf0CTUxDgjOF+wGJwHZi+Ky0fJHJ+gjjEkQSLZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xy8diyUC; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xy8diyUC"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb498a92f6so22471321fa.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Oct 2024 08:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729869549; x=1730474349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqy9tTbcesTY55+1tQYSFph3XRgcGmbNDC2loV1sPWk=;
        b=xy8diyUCeitIp1h8HZCBjz4vHCCZQWpeeYuwU2lhypnuc5WAhn3Df5Yi0+vGj7TtxX
         F/dICbqTJoWJw4f5drllNKQucyJrq7X3a4Vnt5GKVyeZF1uEVza7EpmOSPY6ZKgn9+h4
         yHneQdZTP2KeWikXMTU/caJDxPLFFVGMZkt0aMvX/yeHB9T9PY3CgiBEEOiyliJYZPa8
         blDTJieAumCU0H1ZUaFTbCf3F4Cg+uceZF2WBoZpqI38AnwNUuJFkCDCigEDJ5SS2i8a
         PJYBBsNUxQAGYzqk8tKI0gXIw5xyZS/LdA+OuYuLWS1OHcN3rRikwhRWUBRZzSzaUZuy
         HaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729869549; x=1730474349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqy9tTbcesTY55+1tQYSFph3XRgcGmbNDC2loV1sPWk=;
        b=QaxXPGrXPJ+YlMMuAtLYKIg9v+Z/+8bKO6y64M/r3PsTlUq/IQhfWaiDbeSfYVbYRk
         5kXgRFMVeWTwDZngBuh82TdTkb/XE+Wiink0SchyZW85bNVq32qcZSrY1YUNf9LmkL5f
         DVJINwCQ+BHOjmjc5bggMBdU13PkgC3W1BrjhDhUGgDzV39BwYAgbUBOLaKLRfR1zfR/
         FxB2fsEBD4a4+Fu/s1WGYglwK65+VzRXoiAfCqUa2HAVjS2ne0QyX8hJ1O98yA+zPQe8
         QdJ9ufdnR4JyZWIMcEt+IDehv4AErzIMxwmlPeG/pWnIv6QAAZqi02vVOfAp8LyCmxRE
         gxuA==
X-Forwarded-Encrypted: i=1; AJvYcCVtqbm53QL4XkuD2/t1XVk81rFYA+BQxF/o22/rL+E7rtuPhw4eMTCYMbVMMaoehhCjOjQU2TPtkR+t9U2oz1mN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw7Ym8Txv9WW6umeiT+qT3hQg5URnFMcapIqOQtCVq2/aD6iSu
	UPmR+bzYNwxkpMYVArI/SXJVTlZSj0fU1rMaLzS7drCZKTFaukhQvb3Ewlu8lfhFMaPIm9MTt+n
	TH0pxESosQa5JTJ56oBM8L194o06a+mkxESo13g==
X-Google-Smtp-Source: AGHT+IEjWYCuye96mIuGxQiGs3DCuE5G72CtYOWE7DM8OAkfSxC9a3o+Nom/H2K7MHCUZcflLHD6ELIJ/+TMzmpvIkU=
X-Received: by 2002:a2e:a9a0:0:b0:2f5:2e2:eadf with SMTP id
 38308e7fff4ca-2fca81d6eeamr37762131fa.10.1729869548092; Fri, 25 Oct 2024
 08:19:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023053357.5261-1-yesanishhere@gmail.com> <20241023053357.5261-4-yesanishhere@gmail.com>
 <ZxptkuoohxeWKaeD@p14s> <CABCoZhDHnAMEkUc5Qh+1atdZi2S7H+JHk1Ng6vjvGsF-NjW7dg@mail.gmail.com>
 <ZxuxwriIj4Yl+0op@p14s> <CABCoZhCjiYqFmc7sg+2vJqO3MPZf7O1ka_V4gzXd5JTVEAOumg@mail.gmail.com>
In-Reply-To: <CABCoZhCjiYqFmc7sg+2vJqO3MPZf7O1ka_V4gzXd5JTVEAOumg@mail.gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 25 Oct 2024 09:18:56 -0600
Message-ID: <CANLsYkx8tC=XMsqJoSAqgKssHs3F=7EqLz_D0H5Rkj+g_YNTjA@mail.gmail.com>
Subject: Re: [PATCH V4 3/7] Documentation: remoteproc: add more information
To: anish kumar <yesanishhere@gmail.com>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, corbet@lwn.net, 
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 25 Oct 2024 at 09:13, anish kumar <yesanishhere@gmail.com> wrote:
>
> On Fri, Oct 25, 2024 at 7:57=E2=80=AFAM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > On Thu, Oct 24, 2024 at 11:17:40AM -0700, anish kumar wrote:
> > > On Thu, Oct 24, 2024 at 8:53=E2=80=AFAM Mathieu Poirier
> > > <mathieu.poirier@linaro.org> wrote:
> > > >
> > > > On Tue, Oct 22, 2024 at 10:33:53PM -0700, anish kumar wrote:
> > > > > Added following changes:
> > > > > 1. Components provided by remoteproc framework.
> > > > > 2. Remoteproc driver responsibilities.
> > > > > 3. Remoteproc framework responsibilities.
> > > > > 4. Better explanation of how to ask for resources
> > > > > from the framework by the remote processor.
> > > > >
> > > > > Signed-off-by: anish kumar <yesanishhere@gmail.com>
> > > > > ---
> > > > >  .../driver-api/remoteproc/remoteproc.rst      | 596 +++++++-----=
------
> > > > >  1 file changed, 243 insertions(+), 353 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/driver-api/remoteproc/remoteproc.rst b=
/Documentation/driver-api/remoteproc/remoteproc.rst
> > > > > index 9cccd3dd6a4b..7ca545eea153 100644
> > > > > --- a/Documentation/driver-api/remoteproc/remoteproc.rst
> > > > > +++ b/Documentation/driver-api/remoteproc/remoteproc.rst
> > > > > @@ -1,359 +1,249 @@
> > > > > +.. SPDX-License-Identifier: GPL-2.0
> > > > > +
> > > > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > > > >  Remote Processor Framework
> > > > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > > > >
> > > > > -Introduction
> > > > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > -
> > > > > -Modern SoCs typically have heterogeneous remote processor device=
s in asymmetric
> > > > > -multiprocessing (AMP) configurations, which may be running diffe=
rent instances
> > > > > -of operating system, whether it's Linux or any other flavor of r=
eal-time OS.
> > > > > -
> > > > > -OMAP4, for example, has dual Cortex-A9, dual Cortex-M3 and a C64=
x+ DSP.
> > > > > -In a typical configuration, the dual cortex-A9 is running Linux =
in a SMP
> > > > > -configuration, and each of the other three cores (two M3 cores a=
nd a DSP)
> > > > > -is running its own instance of RTOS in an AMP configuration.
> > > > > -
> > > > > -The remoteproc framework allows different platforms/architecture=
s to
> > > > > -control (power on, load firmware, power off) those remote proces=
sors while
> > > > > -abstracting the hardware differences, so the entire driver doesn=
't need to be
> > > > > -duplicated. In addition, this framework also adds rpmsg virtio d=
evices
> > > > > -for remote processors that supports this kind of communication. =
This way,
> > > > > -platform-specific remoteproc drivers only need to provide a few =
low-level
> > > > > -handlers, and then all rpmsg drivers will then just work
> > > > > -(for more information about the virtio-based rpmsg bus and its d=
rivers,
> > > > > -please read Documentation/staging/rpmsg.rst).
> > > > > -Registration of other types of virtio devices is now also possib=
le. Firmwares
> > > > > -just need to publish what kind of virtio devices do they support=
, and then
> > > > > -remoteproc will add those devices. This makes it possible to reu=
se the
> > > > > -existing virtio drivers with remote processor backends at a mini=
mal development
> > > > > -cost.
> > > > > -
> > > > > -User API
> > > > > -=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > -
> > > > > -::
> > > > > -
> > > > > -  int rproc_boot(struct rproc *rproc)
> > > > > -
> > > > > -Boot a remote processor (i.e. load its firmware, power it on, ..=
.).
> > > > > -
> > > > > -If the remote processor is already powered on, this function imm=
ediately
> > > > > -returns (successfully).
> > > > > -
> > > > > -Returns 0 on success, and an appropriate error value otherwise.
> > > > > -Note: to use this function you should already have a valid rproc
> > > > > -handle. There are several ways to achieve that cleanly (devres, =
pdata,
> > > > > -the way remoteproc_rpmsg.c does this, or, if this becomes preval=
ent, we
> > > > > -might also consider using dev_archdata for this).
> > > > > -
> > > > > -::
> > > > > -
> > > > > -  void rproc_shutdown(struct rproc *rproc)
> > > > > -
> > > > > -Power off a remote processor (previously booted with rproc_boot(=
)).
> > > > > -In case @rproc is still being used by an additional user(s), the=
n
> > > > > -this function will just decrement the power refcount and exit,
> > > > > -without really powering off the device.
> > > > > -
> > > > > -Every call to rproc_boot() must (eventually) be accompanied by a=
 call
> > > > > -to rproc_shutdown(). Calling rproc_shutdown() redundantly is a b=
ug.
> > > > > -
> > > > > -.. note::
> > > > > -
> > > > > -  we're not decrementing the rproc's refcount, only the power re=
fcount.
> > > > > -  which means that the @rproc handle stays valid even after
> > > > > -  rproc_shutdown() returns, and users can still use it with a su=
bsequent
> > > > > -  rproc_boot(), if needed.
> > > > > -
> > > > > -::
> > > > > -
> > > > > -  struct rproc *rproc_get_by_phandle(phandle phandle)
> > > > > -
> > > > > -Find an rproc handle using a device tree phandle. Returns the rp=
roc
> > > > > -handle on success, and NULL on failure. This function increments
> > > > > -the remote processor's refcount, so always use rproc_put() to
> > > > > -decrement it back once rproc isn't needed anymore.
> > > > > -
> > > > > -Typical usage
> > > > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > -
> > > > > -::
> > > > > -
> > > > > -  #include <linux/remoteproc.h>
> > > > > -
> > > > > -  /* in case we were given a valid 'rproc' handle */
> > > > > -  int dummy_rproc_example(struct rproc *my_rproc)
> > > > > -  {
> > > > > -     int ret;
> > > > > -
> > > > > -     /* let's power on and boot our remote processor */
> > > > > -     ret =3D rproc_boot(my_rproc);
> > > > > -     if (ret) {
> > > > > -             /*
> > > > > -              * something went wrong. handle it and leave.
> > > > > -              */
> > > > > -     }
> > > > > -
> > > > > -     /*
> > > > > -      * our remote processor is now powered on... give it some w=
ork
> > > > > -      */
> > > > > -
> > > > > -     /* let's shut it down now */
> > > > > -     rproc_shutdown(my_rproc);
> > > > > -  }
> > > > > -
> > > > > -API for implementors
> > > > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > -
> > > > > -::
> > > > > -
> > > > > -  struct rproc *rproc_alloc(struct device *dev, const char *name=
,
> > > > > -                             const struct rproc_ops *ops,
> > > > > -                             const char *firmware, int len)
> > > > > -
> > > > > -Allocate a new remote processor handle, but don't register
> > > > > -it yet. Required parameters are the underlying device, the
> > > > > -name of this remote processor, platform-specific ops handlers,
> > > > > -the name of the firmware to boot this rproc with, and the
> > > > > -length of private data needed by the allocating rproc driver (in=
 bytes).
> > > > > -
> > > > > -This function should be used by rproc implementations during
> > > > > -initialization of the remote processor.
> > > > > -
> > > > > -After creating an rproc handle using this function, and when rea=
dy,
> > > > > -implementations should then call rproc_add() to complete
> > > > > -the registration of the remote processor.
> > > > > -
> > > > > -On success, the new rproc is returned, and on failure, NULL.
> > > > > -
> > > > > -.. note::
> > > > > -
> > > > > -  **never** directly deallocate @rproc, even if it was not regis=
tered
> > > > > -  yet. Instead, when you need to unroll rproc_alloc(), use rproc=
_free().
> > > > > -
> > > > > -::
> > > > > -
> > > > > -  void rproc_free(struct rproc *rproc)
> > > > > -
> > > > > -Free an rproc handle that was allocated by rproc_alloc.
> > > > > -
> > > > > -This function essentially unrolls rproc_alloc(), by decrementing=
 the
> > > > > -rproc's refcount. It doesn't directly free rproc; that would hap=
pen
> > > > > -only if there are no other references to rproc and its refcount =
now
> > > > > -dropped to zero.
> > > > > -
> > > > > -::
> > > > > -
> > > > > -  int rproc_add(struct rproc *rproc)
> > > > > -
> > > > > -Register @rproc with the remoteproc framework, after it has been
> > > > > -allocated with rproc_alloc().
> > > > > -
> > > > > -This is called by the platform-specific rproc implementation, wh=
enever
> > > > > -a new remote processor device is probed.
> > > > > -
> > > > > -Returns 0 on success and an appropriate error code otherwise.
> > > > > -Note: this function initiates an asynchronous firmware loading
> > > > > -context, which will look for virtio devices supported by the rpr=
oc's
> > > > > -firmware.
> > > > > -
> > > > > -If found, those virtio devices will be created and added, so as =
a result
> > > > > -of registering this remote processor, additional virtio drivers =
might get
> > > > > -probed.
> > > > > -
> > > > > -::
> > > > > -
> > > > > -  int rproc_del(struct rproc *rproc)
> > > > > -
> > > > > -Unroll rproc_add().
> > > > > -
> > > > > -This function should be called when the platform specific rproc
> > > > > -implementation decides to remove the rproc device. it should
> > > > > -_only_ be called if a previous invocation of rproc_add()
> > > > > -has completed successfully.
> > > > > -
> > > > > -After rproc_del() returns, @rproc is still valid, and its
> > > > > -last refcount should be decremented by calling rproc_free().
> > > > > -
> > > > > -Returns 0 on success and -EINVAL if @rproc isn't valid.
> > > > > -
> > > > > -::
> > > > > -
> > > > > -  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_=
type type)
> > > > > -
> > > > > -Report a crash in a remoteproc
> > > > > -
> > > > > -This function must be called every time a crash is detected by t=
he
> > > > > -platform specific rproc implementation. This should not be calle=
d from a
> > > > > -non-remoteproc driver. This function can be called from atomic/i=
nterrupt
> > > > > -context.
> > > > > -
> > > > > -Implementation callbacks
> > > > > +.. Contents:
> > > > > +
> > > > > +   1.  Introduction
> > > > > +   2.  Remoteproc framework responsibilities
> > > > > +   3.  Remoteproc driver responsibilities
> > > > > +   4.  Virtio and rpmsg
> > > > > +
> > > > > +1. Introduction
> > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > +
> > > > > +Modern System on Chips (SoCs) typically integrate heterogeneous =
remote
> > > > > +processor devices in asymmetric multiprocessing (AMP) configurat=
ions.
> > > > > +These processors may run different operating systems, such as Li=
nux and
> > > > > +various real-time operating systems (RTOS).
> > > >
> > > > You are moving things around _and_ making modifications to the text=
 in the same
> > > > patch, something I specifically asked not to do.  Moreover, the abo=
ve conveys
> > >
> > > Sorry for doing that, I thought I moved the file first as you instruc=
ted but
> > > I didn't understand that I should also not reword the sentences that =
convey
> > > the same meaning. Will keep the text of below content in the same fil=
e:
> > > 1. Introduction
> > > 2. Binary Firmware Structure: will just add example as shown in this =
patch.
> > > 3. Virtio and remoteproc: didn't change anything in the patch for thi=
s.
> >
> > We don't seem to understand each other - the "Virtio and remoteproc" se=
ction is
> > the first thing I red and what made me aware of the rewording.
>
> I double checked and found you are right, I initially had changed
> it but had no intention of changing in following
> patches but somehow it creeped in. Will keep everything as before.
>
> >
> > >
> > > For below:
> > > 1. User API:
> > > 2. Typical usage:
> > > 3. API for implementors :
> > >
> > > Should I just move all of the above text as it is to
> > > remoteproc-kernel-api.rst or
> > > you prefer here as I feel it belongs there?
> >
> > I have looked at other subsystems documented under Documentation/driver=
-api and
> > I can't find instances of the type [subsystem]-kernel-api.rst.  As such=
 I don't
> > see what is so special about remoteproc that it would mandate adding a =
new file.
> > Why can't it just be in a single file like most subsystems do?
>
> Certainly, I can do that. Let me keep only the main file which
> was the case, just add the relevant updates to the sections that
> needs updates. Will that be agreeable to you?
>

That's all I'm asking for.

> >
> > >
> > > > exactly the same information as found in [1] but using different wo=
rds.  I
> > > > am in favour of enhancing documentation but not creating unneeded c=
hurn.
> > > >
> > > > I found several instances of the same rewording pattern in the sect=
ions below.
> > > > As such I will not look at the other patches nor move forward with =
this set.
> > > >
> > > > Thanks,
> > > > Mathieu
> > >
> > > Thanks Mathieu, for reviewing and providing feedback as always.
> > >
> > > >
> > > > [1]. https://elixir.bootlin.com/linux/v6.12-rc4/source/Documentatio=
n/staging/remoteproc.rst
> > > >
> > > > > +
> > > > > +For example, the OMAP4 platform features dual Cortex-A9 cores, d=
ual
> > > > > +Cortex-M3 cores, and a C64x+ DSP. In a standard setup, the Corte=
x-A9
> > > > > +cores execute Linux in a symmetric multiprocessing (SMP) configu=
ration,
> > > > > +while the M3 cores and DSP run independent instances of an RTOS.
> > > > > +
> > > > > +The remoteproc framework allows various platforms and architectu=
res to
> > > > > +manage remote processors, including operations such as powering =
on,
> > > > > +loading firmware, and powering off. This framework abstracts har=
dware
> > > > > +differences, promoting code reuse and minimizing duplication. It=
 also
> > > > > +supports rpmsg virtio devices for remote processors that utilize=
 this
> > > > > +communication method. Consequently, platform-specific remoteproc=
 drivers
> > > > > +need only implement a few low-level handlers, enabling seamless =
operation
> > > > > +of all rpmsg drivers. (For more details about the virtio-based r=
pmsg
> > > > > +bus and its drivers, refer to rpmsg documentation.)
> > > > > +
> > > > > +Additionally, the framework allows for the registration of vario=
us
> > > > > +virtio devices. Firmware can publish the types of virtio devices=
 it
> > > > > +supports, facilitating their addition to the remoteproc framewor=
k. This
> > > > > +flexibility enables the reuse of existing virtio drivers with re=
mote
> > > > > +processor backends at minimal development cost.
> > > > > +
> > > > > +The primary purpose of the remoteproc framework is to download f=
irmware
> > > > > +for remote processors and manage their lifecycle. The framework =
consists
> > > > > +of several key components:
> > > > > +
> > > > > +- **Character Driver**: Provides userspace access to control the=
 remote
> > > > > +  processor.
> > > > > +- **ELF Utility**: Offers functions for handling ELF files and m=
anaging
> > > > > +  resources requested by the remote processor.
> > > > > +- **Remoteproc Core**: Manages firmware downloads and recovery a=
ctions
> > > > > +  in case of a remote processor crash.
> > > > > +- **Coredump**: Provides facilities for coredumping and tracing =
from
> > > > > +  the remote processor in the event of a crash.
> > > > > +- **Userspace Interaction**: Uses sysfs and debugfs to manage th=
e
> > > > > +  lifecycle and status of the remote processor.
> > > > > +- **Virtio Support**: Facilitates interaction with the virtio an=
d
> > > > > +  rpmsg bus.
> > > > > +
> > > > > +From here on, references to "framework" denote the remoteproc
> > > > > +framework, and "driver" refers to the remoteproc driver that uti=
lizes
> > > > > +the framework for managing remote processors.
> > > > > +
> > > > > +2. Remoteproc framework Responsibilities
> > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > +
> > > > > +The framework begins by gathering information about the firmware=
 file
> > > > > +to be downloaded through the request_firmware function. It suppo=
rts
> > > > > +the ELF format and parses the firmware image to identify the phy=
sical
> > > > > +addresses that need to be populated from the corresponding ELF s=
ections.
> > > > > +The framework also requires knowledge of the logical or I/O-mapp=
ed
> > > > > +addresses in the application processor. Once this information is
> > > > > +obtained from the driver, the framework transfers the data to th=
e
> > > > > +specified addresses and starts the remote, along with
> > > > > +any devices physically or logically connected to it.
> > > > > +
> > > > > +Dependent devices, referred to as `subdevices` within the framew=
ork,
> > > > > +are also managed post-registration by their respective drivers.
> > > > > +Subdevices can register themselves using `rproc_(add/remove)_sub=
dev`.
> > > > > +Non-remoteproc drivers can use subdevices as a way to logically =
connect
> > > > > +to remote and get lifecycle notifications of the remote.
> > > > > +
> > > > > +The framework oversees the lifecycle of the remote and
> > > > > +provides the `rproc_report_crash` function, which the driver inv=
okes
> > > > > +upon receiving a crash notification from the remote. The
> > > > > +notification method can differ based on the design of the remote
> > > > > +processor and its communication with the application processor. =
For
> > > > > +instance, if the remote is a DSP equipped with a watchdog,
> > > > > +unresponsive behavior triggers the watchdog, generating an inter=
rupt
> > > > > +that routes to the application processor, allowing it to call
> > > > > +`rproc_report_crash` in the driver's interrupt context.
> > > > > +
> > > > > +During crash handling, the framework performs the following acti=
ons:
> > > > > +
> > > > > +a. Sends a request to stop the remote and any connected or
> > > > > +   dependent subdevices.
> > > > > +b. Generates a coredump, dumping all `resources` requested by th=
e
> > > > > +   remote alongside relevant debugging information. Resources ar=
e
> > > > > +   explained below.
> > > > > +c. Reloads the firmware and restarts the remote.
> > > > > +
> > > > > +If the `RPROC_FEAT_ATTACH_ON_RECOVERY` flag is set, the detach a=
nd
> > > > > +attach callbacks of the driver are invoked without reloading the
> > > > > +firmware. This is useful when the remote requires no
> > > > > +assistance for recovery, or when the application processor can r=
estart
> > > > > +independently. After recovery, the application processor can rea=
ttach
> > > > > +to the remote.
> > > > > +
> > > > > +The remote can request resources from the framework, which
> > > > > +allocates a ".resource_table" section. During the ELF parsing ph=
ase,
> > > > > +the framework identifies this section and calls the appropriate
> > > > > +handler to allocate the requested resources.
> > > > > +
> > > > > +Resource management within the framework can accommodate any typ=
e of
> > > > > +`fw_resource_type`.
> > > > > +
> > > > > +.. code-block:: c
> > > > > +
> > > > > +   enum fw_resource_type {
> > > > > +       RSC_CARVEOUT      =3D 0,
> > > > > +       RSC_DEVMEM        =3D 1,
> > > > > +       RSC_TRACE         =3D 2,
> > > > > +       RSC_VDEV          =3D 3,
> > > > > +       RSC_LAST          =3D 4,
> > > > > +       RSC_VENDOR_START  =3D 128,
> > > > > +       RSC_VENDOR_END    =3D 512,
> > > > > +   };
> > > > > +
> > > > > +   struct resource_table {
> > > > > +       u32 ver;
> > > > > +       u32 num;
> > > > > +       u32 reserved[2];
> > > > > +       u32 offset[];
> > > > > +   } __packed;
> > > > > +
> > > > > +   struct fw_rsc_hdr {
> > > > > +       u32 type;
> > > > > +       u8 data[];
> > > > > +   } __packed;
> > > > > +
> > > > > +For example, if the remote requests both `RSC_TRACE` and
> > > > > +`RSC_CARVEOUT` for memory allocation, the ELF firmware can be st=
ructured
> > > > > +as follows:
> > > > > +
> > > > > +.. code-block:: c
> > > > > +
> > > > > +   #define MAX_SHARED_RESOURCE 2
> > > > > +   #define LOG_BUF_SIZE 1000
> > > > > +   #define CARVEOUT_DUMP_PA 0x12345678
> > > > > +   #define CARVEOUT_DUMP_SIZE 2000
> > > > > +
> > > > > +   struct shared_resource_table {
> > > > > +       u32 ver;
> > > > > +       u32 num;
> > > > > +       u32 reserved[2];
> > > > > +       u32 offset[MAX_SHARED_RESOURCE];
> > > > > +       struct fw_rsc_trace log_trace;
> > > > > +       struct fw_rsc_carveout dump_carveout;
> > > > > +   };
> > > > > +
> > > > > +   volatile struct shared_resource_table table =3D {
> > > > > +       .ver =3D 1,
> > > > > +       .num =3D 2,
> > > > > +       .reserved =3D {0, 0},
> > > > > +       .offset =3D {
> > > > > +           offsetof(struct resource_table, log_trace),
> > > > > +           offsetof(struct resource_table, dump_carveout),
> > > > > +       },
> > > > > +       .log_trace =3D {
> > > > > +           RSC_TRACE,
> > > > > +           (u32)log_buf, LOG_BUF_SIZE, 0, "log_trace",
> > > > > +       },
> > > > > +       .dump_carveout =3D {
> > > > > +           RSC_CARVEOUT,
> > > > > +           (u32)FW_RSC_ADDR_ANY, CARVEOUT_PA, 0, "carveout_dump"=
,
> > > > > +       },
> > > > > +   };
> > > > > +
> > > > > +The framework creates a sysfs file when it encounters the `RSC_T=
RACE`
> > > > > +type to expose log information to userspace. Other resource type=
s are
> > > > > +handled accordingly. In the example above, `CARVEOUT_DUMP_SIZE` =
bytes
> > > > > +of DMA memory will be allocated starting from `CARVEOUT_DUMP_PA`=
.
> > > > > +
> > > > > +
> > > > > +3. Remoteproc driver responsibilities
> > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > +
> > > > > +The driver must provide the following information to the core:
> > > > > +
> > > > > +a. Translate device addresses (physical addresses) found in the =
ELF
> > > > > +   firmware to virtual addresses in Linux using the `da_to_va`
> > > > > +   callback. This allows the framework to copy ELF firmware from=
 the
> > > > > +   filesystem to the addresses expected by the remote since
> > > > > +   the framework cannot directly access those physical addresses=
.
> > > > > +b. Prepare/unprepare the remote prior to firmware loading,
> > > > > +   which may involve allocating carveout and reserved memory reg=
ions.
> > > > > +c. Implement methods for starting and stopping the remote,
> > > > > +   whether by setting registers or sending explicit interrupts,
> > > > > +   depending on the hardware design.
> > > > > +d. Provide attach and detach callbacks to start the remote
> > > > > +   without loading the firmware. This is beneficial when the rem=
ote
> > > > > +   processor is already loaded and running.
> > > > > +e. Implement a load callback for firmware loading, typically usi=
ng
> > > > > +   the ELF loader provided by the framework; currently, only ELF
> > > > > +   format is supported.
> > > > > +f. Invoke the framework's crash handler API upon detecting a rem=
ote
> > > > > +   crash.
> > > > > +
> > > > > +Drivers must fill the `rproc_ops` structure and call `rproc_allo=
c`
> > > > > +to register themselves with the framework.
> > > > > +
> > > > > +.. code-block:: c
> > > > > +
> > > > > +   struct rproc_ops {
> > > > > +       int (*prepare)(struct rproc *rproc);
> > > > > +       int (*unprepare)(struct rproc *rproc);
> > > > > +       int (*start)(struct rproc *rproc);
> > > > > +       int (*stop)(struct rproc *rproc);
> > > > > +       int (*attach)(struct rproc *rproc);
> > > > > +       int (*detach)(struct rproc *rproc);
> > > > > +       void * (*da_to_va)(struct rproc *rproc, u64 da, size_t le=
n,
> > > > > +                          bool *is_iomem);
> > > > > +       int (*parse_fw)(struct rproc *rproc, const struct firmwar=
e *fw);
> > > > > +       int (*handle_rsc)(struct rproc *rproc, u32 rsc_type,
> > > > > +                         void *rsc, int offset, int avail);
> > > > > +       int (*load)(struct rproc *rproc, const struct firmware *f=
w);
> > > > > +       //snip
> > > > > +   };
> > > > > +
> > > > > +
> > > > > +4. Virtio and Remoteproc
> > > > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > > >
> > > > > -These callbacks should be provided by platform-specific remotepr=
oc
> > > > > -drivers::
> > > > > -
> > > > > -  /**
> > > > > -   * struct rproc_ops - platform-specific device handlers
> > > > > -   * @start: power on the device and boot it
> > > > > -   * @stop:  power off the device
> > > > > -   * @kick:  kick a virtqueue (virtqueue id given as a parameter=
)
> > > > > -   */
> > > > > -  struct rproc_ops {
> > > > > -     int (*start)(struct rproc *rproc);
> > > > > -     int (*stop)(struct rproc *rproc);
> > > > > -     void (*kick)(struct rproc *rproc, int vqid);
> > > > > -  };
> > > > > -
> > > > > -Every remoteproc implementation should at least provide the ->st=
art and ->stop
> > > > > -handlers. If rpmsg/virtio functionality is also desired, then th=
e ->kick handler
> > > > > -should be provided as well.
> > > > > -
> > > > > -The ->start() handler takes an rproc handle and should then powe=
r on the
> > > > > -device and boot it (use rproc->priv to access platform-specific =
private data).
> > > > > -The boot address, in case needed, can be found in rproc->bootadd=
r (remoteproc
> > > > > -core puts there the ELF entry point).
> > > > > -On success, 0 should be returned, and on failure, an appropriate=
 error code.
> > > > > -
> > > > > -The ->stop() handler takes an rproc handle and powers the device=
 down.
> > > > > -On success, 0 is returned, and on failure, an appropriate error =
code.
> > > > > -
> > > > > -The ->kick() handler takes an rproc handle, and an index of a vi=
rtqueue
> > > > > -where new message was placed in. Implementations should interrup=
t the remote
> > > > > -processor and let it know it has pending messages. Notifying rem=
ote processors
> > > > > -the exact virtqueue index to look in is optional: it is easy (an=
d not
> > > > > -too expensive) to go through the existing virtqueues and look fo=
r new buffers
> > > > > -in the used rings.
> > > > > -
> > > > > -Binary Firmware Structure
> > > > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > > > > -
> > > > > -At this point remoteproc supports ELF32 and ELF64 firmware binar=
ies. However,
> > > > > -it is quite expected that other platforms/devices which we'd wan=
t to
> > > > > -support with this framework will be based on different binary fo=
rmats.
> > > > > -
> > > > > -When those use cases show up, we will have to decouple the binar=
y format
> > > > > -from the framework core, so we can support several binary format=
s without
> > > > > -duplicating common code.
> > > > > -
> > > > > -When the firmware is parsed, its various segments are loaded to =
memory
> > > > > -according to the specified device address (might be a physical a=
ddress
> > > > > -if the remote processor is accessing memory directly).
> > > > > -
> > > > > -In addition to the standard ELF segments, most remote processors=
 would
> > > > > -also include a special section which we call "the resource table=
".
> > > > > -
> > > > > -The resource table contains system resources that the remote pro=
cessor
> > > > > -requires before it should be powered on, such as allocation of p=
hysically
> > > > > -contiguous memory, or iommu mapping of certain on-chip periphera=
ls.
> > > > > -Remotecore will only power up the device after all the resource =
table's
> > > > > -requirement are met.
> > > > > -
> > > > > -In addition to system resources, the resource table may also con=
tain
> > > > > -resource entries that publish the existence of supported feature=
s
> > > > > -or configurations by the remote processor, such as trace buffers=
 and
> > > > > -supported virtio devices (and their configurations).
> > > > > -
> > > > > -The resource table begins with this header::
> > > > > -
> > > > > -  /**
> > > > > -   * struct resource_table - firmware resource table header
> > > > > -   * @ver: version number
> > > > > -   * @num: number of resource entries
> > > > > -   * @reserved: reserved (must be zero)
> > > > > -   * @offset: array of offsets pointing at the various resource =
entries
> > > > > -   *
> > > > > -   * The header of the resource table, as expressed by this stru=
cture,
> > > > > -   * contains a version number (should we need to change this fo=
rmat in the
> > > > > -   * future), the number of available resource entries, and thei=
r offsets
> > > > > -   * in the table.
> > > > > -   */
> > > > > -  struct resource_table {
> > > > > -     u32 ver;
> > > > > -     u32 num;
> > > > > -     u32 reserved[2];
> > > > > -     u32 offset[0];
> > > > > -  } __packed;
> > > > > -
> > > > > -Immediately following this header are the resource entries thems=
elves,
> > > > > -each of which begins with the following resource entry header::
> > > > > -
> > > > > -  /**
> > > > > -   * struct fw_rsc_hdr - firmware resource entry header
> > > > > -   * @type: resource type
> > > > > -   * @data: resource data
> > > > > -   *
> > > > > -   * Every resource entry begins with a 'struct fw_rsc_hdr' head=
er providing
> > > > > -   * its @type. The content of the entry itself will immediately=
 follow
> > > > > -   * this header, and it should be parsed according to the resou=
rce type.
> > > > > -   */
> > > > > -  struct fw_rsc_hdr {
> > > > > -     u32 type;
> > > > > -     u8 data[0];
> > > > > -  } __packed;
> > > > > -
> > > > > -Some resources entries are mere announcements, where the host is=
 informed
> > > > > -of specific remoteproc configuration. Other entries require the =
host to
> > > > > -do something (e.g. allocate a system resource). Sometimes a nego=
tiation
> > > > > -is expected, where the firmware requests a resource, and once al=
located,
> > > > > -the host should provide back its details (e.g. address of an all=
ocated
> > > > > -memory region).
> > > > > -
> > > > > -Here are the various resource types that are currently supported=
::
> > > > > -
> > > > > -  /**
> > > > > -   * enum fw_resource_type - types of resource entries
> > > > > -   *
> > > > > -   * @RSC_CARVEOUT:   request for allocation of a physically con=
tiguous
> > > > > -   *             memory region.
> > > > > -   * @RSC_DEVMEM:     request to iommu_map a memory-based periph=
eral.
> > > > > -   * @RSC_TRACE:         announces the availability of a trace b=
uffer into which
> > > > > -   *             the remote processor will be writing logs.
> > > > > -   * @RSC_VDEV:       declare support for a virtio device, and s=
erve as its
> > > > > -   *             virtio header.
> > > > > -   * @RSC_LAST:       just keep this one at the end
> > > > > -   * @RSC_VENDOR_START:      start of the vendor specific resour=
ce types range
> > > > > -   * @RSC_VENDOR_END:        end of the vendor specific resource=
 types range
> > > > > -   *
> > > > > -   * Please note that these values are used as indices to the rp=
roc_handle_rsc
> > > > > -   * lookup table, so please keep them sane. Moreover, @RSC_LAST=
 is used to
> > > > > -   * check the validity of an index before the lookup table is a=
ccessed, so
> > > > > -   * please update it as needed.
> > > > > -   */
> > > > > -  enum fw_resource_type {
> > > > > -     RSC_CARVEOUT            =3D 0,
> > > > > -     RSC_DEVMEM              =3D 1,
> > > > > -     RSC_TRACE               =3D 2,
> > > > > -     RSC_VDEV                =3D 3,
> > > > > -     RSC_LAST                =3D 4,
> > > > > -     RSC_VENDOR_START        =3D 128,
> > > > > -     RSC_VENDOR_END          =3D 512,
> > > > > -  };
> > > > > -
> > > > > -For more details regarding a specific resource type, please see =
its
> > > > > -dedicated structure in include/linux/remoteproc.h.
> > > > > -
> > > > > -We also expect that platform-specific resource entries will show=
 up
> > > > > -at some point. When that happens, we could easily add a new RSC_=
PLATFORM
> > > > > -type, and hand those resources to the platform-specific rproc dr=
iver to handle.
> > > > > -
> > > > > -Virtio and remoteproc
> > > > > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > -
> > > > > -The firmware should provide remoteproc information about virtio =
devices
> > > > > -that it supports, and their configurations: a RSC_VDEV resource =
entry
> > > > > -should specify the virtio device id (as in virtio_ids.h), virtio=
 features,
> > > > > -virtio config space, vrings information, etc.
> > > > > -
> > > > > -When a new remote processor is registered, the remoteproc framew=
ork
> > > > > -will look for its resource table and will register the virtio de=
vices
> > > > > -it supports. A firmware may support any number of virtio devices=
, and
> > > > > -of any type (a single remote processor can also easily support s=
everal
> > > > > -rpmsg virtio devices this way, if desired).
> > > > > -
> > > > > -Of course, RSC_VDEV resource entries are only good enough for st=
atic
> > > > > -allocation of virtio devices. Dynamic allocations will also be m=
ade possible
> > > > > -using the rpmsg bus (similar to how we already do dynamic alloca=
tions of
> > > > > -rpmsg channels; read more about it in rpmsg.txt).
> > > > > +The firmware must provide remoteproc with information regarding =
the
> > > > > +virtio devices it supports and their configurations: an `RSC_VDE=
V`
> > > > > +resource entry should detail the virtio device ID (as defined in
> > > > > +`virtio_ids.h`), virtio features, virtio config space, vrings
> > > > > +information, etc.
> > > > > +
> > > > > +Upon registration of a new remote, the remoteproc framework
> > > > > +searches for its resource table and registers the supported virt=
io
> > > > > +devices. A firmware may support multiple virtio devices, of vari=
ous
> > > > > +types (a single remote can support multiple rpmsg virtio
> > > > > +devices if required).
> > > > > +
> > > > > +Moreover, `RSC_VDEV` resource entries suffice for static allocat=
ion
> > > > > +of virtio devices. Dynamic allocations will also be supported us=
ing
> > > > > +the rpmsg bus, akin to the handling of dynamic allocations for r=
pmsg
> > > > > +channels. For more information, refer to rpmsg documentation.
> > > > > --
> > > > > 2.39.3 (Apple Git-146)
> > > > >
