Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8BEB658;
	Thu, 24 Oct 2024 18:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729793879; cv=none; b=D5hAP/ngKissZZkQl4b/d7qhNrjANmuX8GvXGXlKUnOZHiSaohS9aUJF0afikVqjfrtVHevYAHVXm9gB+oie3iRELSK6+5qm6f1YgJtf+l3mMu8VmOSIIEfpYzrsaNslyT5CvgFZN8VpyffVJEibIjqvViiDIjngpaBUXA49bx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729793879; c=relaxed/simple;
	bh=XSuLiY23sTP0qXNbYAENCzf8JUYLTfkOweSyaF8Wk+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sRx274RTFEOYf3i9rIpJq4FtQNXXbisQZ4R5ydoKbbE+oOkXdRrJNDv3oNiRetqQinauAXObuoqqAJXgcdBbWUFW1uRTtKt4fHFP5z55IIKiMCgOQyJvasrjGiPlokiSpNMcGhYDbC6XIqQjdvMIwcyvHzKzWjNTji3PirSGdvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4O17xzi; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4O17xzi"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so11544941fa.2;
        Thu, 24 Oct 2024 11:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729793873; x=1730398673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8ZkGbKnQuq8DTX5ubJKH9bykijneuDXRtwq63DjPKE=;
        b=L4O17xziZ6Yr1s0PjoYtRlweA8h/h/n4LVNVLDHOJZuewk/m7G8KUWuD2esPHacUga
         uSoukFGW3/gVg39shDbeNY1GMZZbBAtJYbXVsL+vaPydHSC/6ZFEUPHhVZvsaNSDypaD
         daZKdmX4FFjjLGT2DFOgt3X+wIN9gJyoJR5m62S3rfFKd6YCCCcQBGZih2VcUZKGMIw/
         1w37MCrEAH7Oe2U+O6dzeoN++o+hnMEFyPv3ZIuMDfjw5eaK/q+XbVKHIZSVgDJl5QCv
         77t66vbTL84a7cRDtIXppnkjl6CNwoTLLt9Asmybr8leKiPJKCpVMIxiOXw+r58WBUHJ
         B+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729793873; x=1730398673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8ZkGbKnQuq8DTX5ubJKH9bykijneuDXRtwq63DjPKE=;
        b=IJKmMKozru621ZONFzpoZjuk5w+FwryNBdYgwheaIU+B24b8ToRW77wX948CDxu321
         BKT7qsGNJkR/WFhExmZYqgreRtd3LPyB+pXL1G8iBqldtJ88cKG8elzIF+HLH12E9t5j
         G70DGNeeL0+c319zSGQr/OhPahWfi0bcpdlqmmYr0MzISVw5KIfBJ8Q/o3jfS/f8qbQY
         dLLbVxZvVwXK0NsNULnP926M8tE3+9CSeVb1PtIrMSfMhaK1LCssI8GNZZAOfEQWwF1l
         dHllPxzj+UcXTJLZzfiFBgUHiPE+luvuPSAZRV8zJLKOd5IY9GhZxiAPKEYFAxoARfZ8
         NtrA==
X-Forwarded-Encrypted: i=1; AJvYcCUR8HdAaoWXoilHcTrDgnu0eXXQfnau+pek/kNrZm3JburG7tLjrM5ikrCHRxegOOqlgIF9xjEzbP8=@vger.kernel.org, AJvYcCUXXcL6Hd881G+mNWNEoRP0z7tlZ2ZxLHHWqZI5RIMdaP/wAgeEimUIirI6XZUE7Q7+t+NXilC2XiI8eHxn@vger.kernel.org, AJvYcCWYV37JlSVtnn21Ie45Icr3ilAD7cTnzEmh0e/5/vge/RDdEVRBrJgIViJMoqieACcW4sg0seN3NDMtdC61Zh2oEw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn5b9taFYIGw19a4a15CY8tXr3GdOAQgMBsONF3W9tQYrRHPph
	NwiqlTF46tHExjsE09LGwFxY1Zzw1gIN8DH/7CYN+kkRbFv6rFpeTaph8j7Z7Lm2iubh1KiQn4d
	j0sGjiRkAT3P00QqhGmrKP8tmkS4=
X-Google-Smtp-Source: AGHT+IGWqEUQFGkgweD370Fk+a17Jn5kX5kvwtpDOUuPjxR7J3Ao5SFqVxyDZL6+zMJ9hIhrF9M6uDAJhKmqHlNhn/I=
X-Received: by 2002:a2e:4a19:0:b0:2fa:bb5d:db67 with SMTP id
 38308e7fff4ca-2fca8261caemr16210751fa.32.1729793872238; Thu, 24 Oct 2024
 11:17:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023053357.5261-1-yesanishhere@gmail.com> <20241023053357.5261-4-yesanishhere@gmail.com>
 <ZxptkuoohxeWKaeD@p14s>
In-Reply-To: <ZxptkuoohxeWKaeD@p14s>
From: anish kumar <yesanishhere@gmail.com>
Date: Thu, 24 Oct 2024 11:17:40 -0700
Message-ID: <CABCoZhDHnAMEkUc5Qh+1atdZi2S7H+JHk1Ng6vjvGsF-NjW7dg@mail.gmail.com>
Subject: Re: [PATCH V4 3/7] Documentation: remoteproc: add more information
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, corbet@lwn.net, 
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 8:53=E2=80=AFAM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Tue, Oct 22, 2024 at 10:33:53PM -0700, anish kumar wrote:
> > Added following changes:
> > 1. Components provided by remoteproc framework.
> > 2. Remoteproc driver responsibilities.
> > 3. Remoteproc framework responsibilities.
> > 4. Better explanation of how to ask for resources
> > from the framework by the remote processor.
> >
> > Signed-off-by: anish kumar <yesanishhere@gmail.com>
> > ---
> >  .../driver-api/remoteproc/remoteproc.rst      | 596 +++++++-----------
> >  1 file changed, 243 insertions(+), 353 deletions(-)
> >
> > diff --git a/Documentation/driver-api/remoteproc/remoteproc.rst b/Docum=
entation/driver-api/remoteproc/remoteproc.rst
> > index 9cccd3dd6a4b..7ca545eea153 100644
> > --- a/Documentation/driver-api/remoteproc/remoteproc.rst
> > +++ b/Documentation/driver-api/remoteproc/remoteproc.rst
> > @@ -1,359 +1,249 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >  Remote Processor Framework
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >
> > -Introduction
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -
> > -Modern SoCs typically have heterogeneous remote processor devices in a=
symmetric
> > -multiprocessing (AMP) configurations, which may be running different i=
nstances
> > -of operating system, whether it's Linux or any other flavor of real-ti=
me OS.
> > -
> > -OMAP4, for example, has dual Cortex-A9, dual Cortex-M3 and a C64x+ DSP=
.
> > -In a typical configuration, the dual cortex-A9 is running Linux in a S=
MP
> > -configuration, and each of the other three cores (two M3 cores and a D=
SP)
> > -is running its own instance of RTOS in an AMP configuration.
> > -
> > -The remoteproc framework allows different platforms/architectures to
> > -control (power on, load firmware, power off) those remote processors w=
hile
> > -abstracting the hardware differences, so the entire driver doesn't nee=
d to be
> > -duplicated. In addition, this framework also adds rpmsg virtio devices
> > -for remote processors that supports this kind of communication. This w=
ay,
> > -platform-specific remoteproc drivers only need to provide a few low-le=
vel
> > -handlers, and then all rpmsg drivers will then just work
> > -(for more information about the virtio-based rpmsg bus and its drivers=
,
> > -please read Documentation/staging/rpmsg.rst).
> > -Registration of other types of virtio devices is now also possible. Fi=
rmwares
> > -just need to publish what kind of virtio devices do they support, and =
then
> > -remoteproc will add those devices. This makes it possible to reuse the
> > -existing virtio drivers with remote processor backends at a minimal de=
velopment
> > -cost.
> > -
> > -User API
> > -=3D=3D=3D=3D=3D=3D=3D=3D
> > -
> > -::
> > -
> > -  int rproc_boot(struct rproc *rproc)
> > -
> > -Boot a remote processor (i.e. load its firmware, power it on, ...).
> > -
> > -If the remote processor is already powered on, this function immediate=
ly
> > -returns (successfully).
> > -
> > -Returns 0 on success, and an appropriate error value otherwise.
> > -Note: to use this function you should already have a valid rproc
> > -handle. There are several ways to achieve that cleanly (devres, pdata,
> > -the way remoteproc_rpmsg.c does this, or, if this becomes prevalent, w=
e
> > -might also consider using dev_archdata for this).
> > -
> > -::
> > -
> > -  void rproc_shutdown(struct rproc *rproc)
> > -
> > -Power off a remote processor (previously booted with rproc_boot()).
> > -In case @rproc is still being used by an additional user(s), then
> > -this function will just decrement the power refcount and exit,
> > -without really powering off the device.
> > -
> > -Every call to rproc_boot() must (eventually) be accompanied by a call
> > -to rproc_shutdown(). Calling rproc_shutdown() redundantly is a bug.
> > -
> > -.. note::
> > -
> > -  we're not decrementing the rproc's refcount, only the power refcount=
.
> > -  which means that the @rproc handle stays valid even after
> > -  rproc_shutdown() returns, and users can still use it with a subseque=
nt
> > -  rproc_boot(), if needed.
> > -
> > -::
> > -
> > -  struct rproc *rproc_get_by_phandle(phandle phandle)
> > -
> > -Find an rproc handle using a device tree phandle. Returns the rproc
> > -handle on success, and NULL on failure. This function increments
> > -the remote processor's refcount, so always use rproc_put() to
> > -decrement it back once rproc isn't needed anymore.
> > -
> > -Typical usage
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -
> > -::
> > -
> > -  #include <linux/remoteproc.h>
> > -
> > -  /* in case we were given a valid 'rproc' handle */
> > -  int dummy_rproc_example(struct rproc *my_rproc)
> > -  {
> > -     int ret;
> > -
> > -     /* let's power on and boot our remote processor */
> > -     ret =3D rproc_boot(my_rproc);
> > -     if (ret) {
> > -             /*
> > -              * something went wrong. handle it and leave.
> > -              */
> > -     }
> > -
> > -     /*
> > -      * our remote processor is now powered on... give it some work
> > -      */
> > -
> > -     /* let's shut it down now */
> > -     rproc_shutdown(my_rproc);
> > -  }
> > -
> > -API for implementors
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -
> > -::
> > -
> > -  struct rproc *rproc_alloc(struct device *dev, const char *name,
> > -                             const struct rproc_ops *ops,
> > -                             const char *firmware, int len)
> > -
> > -Allocate a new remote processor handle, but don't register
> > -it yet. Required parameters are the underlying device, the
> > -name of this remote processor, platform-specific ops handlers,
> > -the name of the firmware to boot this rproc with, and the
> > -length of private data needed by the allocating rproc driver (in bytes=
).
> > -
> > -This function should be used by rproc implementations during
> > -initialization of the remote processor.
> > -
> > -After creating an rproc handle using this function, and when ready,
> > -implementations should then call rproc_add() to complete
> > -the registration of the remote processor.
> > -
> > -On success, the new rproc is returned, and on failure, NULL.
> > -
> > -.. note::
> > -
> > -  **never** directly deallocate @rproc, even if it was not registered
> > -  yet. Instead, when you need to unroll rproc_alloc(), use rproc_free(=
).
> > -
> > -::
> > -
> > -  void rproc_free(struct rproc *rproc)
> > -
> > -Free an rproc handle that was allocated by rproc_alloc.
> > -
> > -This function essentially unrolls rproc_alloc(), by decrementing the
> > -rproc's refcount. It doesn't directly free rproc; that would happen
> > -only if there are no other references to rproc and its refcount now
> > -dropped to zero.
> > -
> > -::
> > -
> > -  int rproc_add(struct rproc *rproc)
> > -
> > -Register @rproc with the remoteproc framework, after it has been
> > -allocated with rproc_alloc().
> > -
> > -This is called by the platform-specific rproc implementation, whenever
> > -a new remote processor device is probed.
> > -
> > -Returns 0 on success and an appropriate error code otherwise.
> > -Note: this function initiates an asynchronous firmware loading
> > -context, which will look for virtio devices supported by the rproc's
> > -firmware.
> > -
> > -If found, those virtio devices will be created and added, so as a resu=
lt
> > -of registering this remote processor, additional virtio drivers might =
get
> > -probed.
> > -
> > -::
> > -
> > -  int rproc_del(struct rproc *rproc)
> > -
> > -Unroll rproc_add().
> > -
> > -This function should be called when the platform specific rproc
> > -implementation decides to remove the rproc device. it should
> > -_only_ be called if a previous invocation of rproc_add()
> > -has completed successfully.
> > -
> > -After rproc_del() returns, @rproc is still valid, and its
> > -last refcount should be decremented by calling rproc_free().
> > -
> > -Returns 0 on success and -EINVAL if @rproc isn't valid.
> > -
> > -::
> > -
> > -  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type t=
ype)
> > -
> > -Report a crash in a remoteproc
> > -
> > -This function must be called every time a crash is detected by the
> > -platform specific rproc implementation. This should not be called from=
 a
> > -non-remoteproc driver. This function can be called from atomic/interru=
pt
> > -context.
> > -
> > -Implementation callbacks
> > +.. Contents:
> > +
> > +   1.  Introduction
> > +   2.  Remoteproc framework responsibilities
> > +   3.  Remoteproc driver responsibilities
> > +   4.  Virtio and rpmsg
> > +
> > +1. Introduction
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Modern System on Chips (SoCs) typically integrate heterogeneous remote
> > +processor devices in asymmetric multiprocessing (AMP) configurations.
> > +These processors may run different operating systems, such as Linux an=
d
> > +various real-time operating systems (RTOS).
>
> You are moving things around _and_ making modifications to the text in th=
e same
> patch, something I specifically asked not to do.  Moreover, the above con=
veys

Sorry for doing that, I thought I moved the file first as you instructed bu=
t
I didn't understand that I should also not reword the sentences that convey
the same meaning. Will keep the text of below content in the same file:
1. Introduction
2. Binary Firmware Structure: will just add example as shown in this patch.
3. Virtio and remoteproc: didn't change anything in the patch for this.

For below:
1. User API:
2. Typical usage:
3. API for implementors :

Should I just move all of the above text as it is to
remoteproc-kernel-api.rst or
you prefer here as I feel it belongs there?

> exactly the same information as found in [1] but using different words.  =
I
> am in favour of enhancing documentation but not creating unneeded churn.
>
> I found several instances of the same rewording pattern in the sections b=
elow.
> As such I will not look at the other patches nor move forward with this s=
et.
>
> Thanks,
> Mathieu

Thanks Mathieu, for reviewing and providing feedback as always.

>
> [1]. https://elixir.bootlin.com/linux/v6.12-rc4/source/Documentation/stag=
ing/remoteproc.rst
>
> > +
> > +For example, the OMAP4 platform features dual Cortex-A9 cores, dual
> > +Cortex-M3 cores, and a C64x+ DSP. In a standard setup, the Cortex-A9
> > +cores execute Linux in a symmetric multiprocessing (SMP) configuration=
,
> > +while the M3 cores and DSP run independent instances of an RTOS.
> > +
> > +The remoteproc framework allows various platforms and architectures to
> > +manage remote processors, including operations such as powering on,
> > +loading firmware, and powering off. This framework abstracts hardware
> > +differences, promoting code reuse and minimizing duplication. It also
> > +supports rpmsg virtio devices for remote processors that utilize this
> > +communication method. Consequently, platform-specific remoteproc drive=
rs
> > +need only implement a few low-level handlers, enabling seamless operat=
ion
> > +of all rpmsg drivers. (For more details about the virtio-based rpmsg
> > +bus and its drivers, refer to rpmsg documentation.)
> > +
> > +Additionally, the framework allows for the registration of various
> > +virtio devices. Firmware can publish the types of virtio devices it
> > +supports, facilitating their addition to the remoteproc framework. Thi=
s
> > +flexibility enables the reuse of existing virtio drivers with remote
> > +processor backends at minimal development cost.
> > +
> > +The primary purpose of the remoteproc framework is to download firmwar=
e
> > +for remote processors and manage their lifecycle. The framework consis=
ts
> > +of several key components:
> > +
> > +- **Character Driver**: Provides userspace access to control the remot=
e
> > +  processor.
> > +- **ELF Utility**: Offers functions for handling ELF files and managin=
g
> > +  resources requested by the remote processor.
> > +- **Remoteproc Core**: Manages firmware downloads and recovery actions
> > +  in case of a remote processor crash.
> > +- **Coredump**: Provides facilities for coredumping and tracing from
> > +  the remote processor in the event of a crash.
> > +- **Userspace Interaction**: Uses sysfs and debugfs to manage the
> > +  lifecycle and status of the remote processor.
> > +- **Virtio Support**: Facilitates interaction with the virtio and
> > +  rpmsg bus.
> > +
> > +From here on, references to "framework" denote the remoteproc
> > +framework, and "driver" refers to the remoteproc driver that utilizes
> > +the framework for managing remote processors.
> > +
> > +2. Remoteproc framework Responsibilities
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The framework begins by gathering information about the firmware file
> > +to be downloaded through the request_firmware function. It supports
> > +the ELF format and parses the firmware image to identify the physical
> > +addresses that need to be populated from the corresponding ELF section=
s.
> > +The framework also requires knowledge of the logical or I/O-mapped
> > +addresses in the application processor. Once this information is
> > +obtained from the driver, the framework transfers the data to the
> > +specified addresses and starts the remote, along with
> > +any devices physically or logically connected to it.
> > +
> > +Dependent devices, referred to as `subdevices` within the framework,
> > +are also managed post-registration by their respective drivers.
> > +Subdevices can register themselves using `rproc_(add/remove)_subdev`.
> > +Non-remoteproc drivers can use subdevices as a way to logically connec=
t
> > +to remote and get lifecycle notifications of the remote.
> > +
> > +The framework oversees the lifecycle of the remote and
> > +provides the `rproc_report_crash` function, which the driver invokes
> > +upon receiving a crash notification from the remote. The
> > +notification method can differ based on the design of the remote
> > +processor and its communication with the application processor. For
> > +instance, if the remote is a DSP equipped with a watchdog,
> > +unresponsive behavior triggers the watchdog, generating an interrupt
> > +that routes to the application processor, allowing it to call
> > +`rproc_report_crash` in the driver's interrupt context.
> > +
> > +During crash handling, the framework performs the following actions:
> > +
> > +a. Sends a request to stop the remote and any connected or
> > +   dependent subdevices.
> > +b. Generates a coredump, dumping all `resources` requested by the
> > +   remote alongside relevant debugging information. Resources are
> > +   explained below.
> > +c. Reloads the firmware and restarts the remote.
> > +
> > +If the `RPROC_FEAT_ATTACH_ON_RECOVERY` flag is set, the detach and
> > +attach callbacks of the driver are invoked without reloading the
> > +firmware. This is useful when the remote requires no
> > +assistance for recovery, or when the application processor can restart
> > +independently. After recovery, the application processor can reattach
> > +to the remote.
> > +
> > +The remote can request resources from the framework, which
> > +allocates a ".resource_table" section. During the ELF parsing phase,
> > +the framework identifies this section and calls the appropriate
> > +handler to allocate the requested resources.
> > +
> > +Resource management within the framework can accommodate any type of
> > +`fw_resource_type`.
> > +
> > +.. code-block:: c
> > +
> > +   enum fw_resource_type {
> > +       RSC_CARVEOUT      =3D 0,
> > +       RSC_DEVMEM        =3D 1,
> > +       RSC_TRACE         =3D 2,
> > +       RSC_VDEV          =3D 3,
> > +       RSC_LAST          =3D 4,
> > +       RSC_VENDOR_START  =3D 128,
> > +       RSC_VENDOR_END    =3D 512,
> > +   };
> > +
> > +   struct resource_table {
> > +       u32 ver;
> > +       u32 num;
> > +       u32 reserved[2];
> > +       u32 offset[];
> > +   } __packed;
> > +
> > +   struct fw_rsc_hdr {
> > +       u32 type;
> > +       u8 data[];
> > +   } __packed;
> > +
> > +For example, if the remote requests both `RSC_TRACE` and
> > +`RSC_CARVEOUT` for memory allocation, the ELF firmware can be structur=
ed
> > +as follows:
> > +
> > +.. code-block:: c
> > +
> > +   #define MAX_SHARED_RESOURCE 2
> > +   #define LOG_BUF_SIZE 1000
> > +   #define CARVEOUT_DUMP_PA 0x12345678
> > +   #define CARVEOUT_DUMP_SIZE 2000
> > +
> > +   struct shared_resource_table {
> > +       u32 ver;
> > +       u32 num;
> > +       u32 reserved[2];
> > +       u32 offset[MAX_SHARED_RESOURCE];
> > +       struct fw_rsc_trace log_trace;
> > +       struct fw_rsc_carveout dump_carveout;
> > +   };
> > +
> > +   volatile struct shared_resource_table table =3D {
> > +       .ver =3D 1,
> > +       .num =3D 2,
> > +       .reserved =3D {0, 0},
> > +       .offset =3D {
> > +           offsetof(struct resource_table, log_trace),
> > +           offsetof(struct resource_table, dump_carveout),
> > +       },
> > +       .log_trace =3D {
> > +           RSC_TRACE,
> > +           (u32)log_buf, LOG_BUF_SIZE, 0, "log_trace",
> > +       },
> > +       .dump_carveout =3D {
> > +           RSC_CARVEOUT,
> > +           (u32)FW_RSC_ADDR_ANY, CARVEOUT_PA, 0, "carveout_dump",
> > +       },
> > +   };
> > +
> > +The framework creates a sysfs file when it encounters the `RSC_TRACE`
> > +type to expose log information to userspace. Other resource types are
> > +handled accordingly. In the example above, `CARVEOUT_DUMP_SIZE` bytes
> > +of DMA memory will be allocated starting from `CARVEOUT_DUMP_PA`.
> > +
> > +
> > +3. Remoteproc driver responsibilities
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The driver must provide the following information to the core:
> > +
> > +a. Translate device addresses (physical addresses) found in the ELF
> > +   firmware to virtual addresses in Linux using the `da_to_va`
> > +   callback. This allows the framework to copy ELF firmware from the
> > +   filesystem to the addresses expected by the remote since
> > +   the framework cannot directly access those physical addresses.
> > +b. Prepare/unprepare the remote prior to firmware loading,
> > +   which may involve allocating carveout and reserved memory regions.
> > +c. Implement methods for starting and stopping the remote,
> > +   whether by setting registers or sending explicit interrupts,
> > +   depending on the hardware design.
> > +d. Provide attach and detach callbacks to start the remote
> > +   without loading the firmware. This is beneficial when the remote
> > +   processor is already loaded and running.
> > +e. Implement a load callback for firmware loading, typically using
> > +   the ELF loader provided by the framework; currently, only ELF
> > +   format is supported.
> > +f. Invoke the framework's crash handler API upon detecting a remote
> > +   crash.
> > +
> > +Drivers must fill the `rproc_ops` structure and call `rproc_alloc`
> > +to register themselves with the framework.
> > +
> > +.. code-block:: c
> > +
> > +   struct rproc_ops {
> > +       int (*prepare)(struct rproc *rproc);
> > +       int (*unprepare)(struct rproc *rproc);
> > +       int (*start)(struct rproc *rproc);
> > +       int (*stop)(struct rproc *rproc);
> > +       int (*attach)(struct rproc *rproc);
> > +       int (*detach)(struct rproc *rproc);
> > +       void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len,
> > +                          bool *is_iomem);
> > +       int (*parse_fw)(struct rproc *rproc, const struct firmware *fw)=
;
> > +       int (*handle_rsc)(struct rproc *rproc, u32 rsc_type,
> > +                         void *rsc, int offset, int avail);
> > +       int (*load)(struct rproc *rproc, const struct firmware *fw);
> > +       //snip
> > +   };
> > +
> > +
> > +4. Virtio and Remoteproc
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> >
> > -These callbacks should be provided by platform-specific remoteproc
> > -drivers::
> > -
> > -  /**
> > -   * struct rproc_ops - platform-specific device handlers
> > -   * @start: power on the device and boot it
> > -   * @stop:  power off the device
> > -   * @kick:  kick a virtqueue (virtqueue id given as a parameter)
> > -   */
> > -  struct rproc_ops {
> > -     int (*start)(struct rproc *rproc);
> > -     int (*stop)(struct rproc *rproc);
> > -     void (*kick)(struct rproc *rproc, int vqid);
> > -  };
> > -
> > -Every remoteproc implementation should at least provide the ->start an=
d ->stop
> > -handlers. If rpmsg/virtio functionality is also desired, then the ->ki=
ck handler
> > -should be provided as well.
> > -
> > -The ->start() handler takes an rproc handle and should then power on t=
he
> > -device and boot it (use rproc->priv to access platform-specific privat=
e data).
> > -The boot address, in case needed, can be found in rproc->bootaddr (rem=
oteproc
> > -core puts there the ELF entry point).
> > -On success, 0 should be returned, and on failure, an appropriate error=
 code.
> > -
> > -The ->stop() handler takes an rproc handle and powers the device down.
> > -On success, 0 is returned, and on failure, an appropriate error code.
> > -
> > -The ->kick() handler takes an rproc handle, and an index of a virtqueu=
e
> > -where new message was placed in. Implementations should interrupt the =
remote
> > -processor and let it know it has pending messages. Notifying remote pr=
ocessors
> > -the exact virtqueue index to look in is optional: it is easy (and not
> > -too expensive) to go through the existing virtqueues and look for new =
buffers
> > -in the used rings.
> > -
> > -Binary Firmware Structure
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > -
> > -At this point remoteproc supports ELF32 and ELF64 firmware binaries. H=
owever,
> > -it is quite expected that other platforms/devices which we'd want to
> > -support with this framework will be based on different binary formats.
> > -
> > -When those use cases show up, we will have to decouple the binary form=
at
> > -from the framework core, so we can support several binary formats with=
out
> > -duplicating common code.
> > -
> > -When the firmware is parsed, its various segments are loaded to memory
> > -according to the specified device address (might be a physical address
> > -if the remote processor is accessing memory directly).
> > -
> > -In addition to the standard ELF segments, most remote processors would
> > -also include a special section which we call "the resource table".
> > -
> > -The resource table contains system resources that the remote processor
> > -requires before it should be powered on, such as allocation of physica=
lly
> > -contiguous memory, or iommu mapping of certain on-chip peripherals.
> > -Remotecore will only power up the device after all the resource table'=
s
> > -requirement are met.
> > -
> > -In addition to system resources, the resource table may also contain
> > -resource entries that publish the existence of supported features
> > -or configurations by the remote processor, such as trace buffers and
> > -supported virtio devices (and their configurations).
> > -
> > -The resource table begins with this header::
> > -
> > -  /**
> > -   * struct resource_table - firmware resource table header
> > -   * @ver: version number
> > -   * @num: number of resource entries
> > -   * @reserved: reserved (must be zero)
> > -   * @offset: array of offsets pointing at the various resource entrie=
s
> > -   *
> > -   * The header of the resource table, as expressed by this structure,
> > -   * contains a version number (should we need to change this format i=
n the
> > -   * future), the number of available resource entries, and their offs=
ets
> > -   * in the table.
> > -   */
> > -  struct resource_table {
> > -     u32 ver;
> > -     u32 num;
> > -     u32 reserved[2];
> > -     u32 offset[0];
> > -  } __packed;
> > -
> > -Immediately following this header are the resource entries themselves,
> > -each of which begins with the following resource entry header::
> > -
> > -  /**
> > -   * struct fw_rsc_hdr - firmware resource entry header
> > -   * @type: resource type
> > -   * @data: resource data
> > -   *
> > -   * Every resource entry begins with a 'struct fw_rsc_hdr' header pro=
viding
> > -   * its @type. The content of the entry itself will immediately follo=
w
> > -   * this header, and it should be parsed according to the resource ty=
pe.
> > -   */
> > -  struct fw_rsc_hdr {
> > -     u32 type;
> > -     u8 data[0];
> > -  } __packed;
> > -
> > -Some resources entries are mere announcements, where the host is infor=
med
> > -of specific remoteproc configuration. Other entries require the host t=
o
> > -do something (e.g. allocate a system resource). Sometimes a negotiatio=
n
> > -is expected, where the firmware requests a resource, and once allocate=
d,
> > -the host should provide back its details (e.g. address of an allocated
> > -memory region).
> > -
> > -Here are the various resource types that are currently supported::
> > -
> > -  /**
> > -   * enum fw_resource_type - types of resource entries
> > -   *
> > -   * @RSC_CARVEOUT:   request for allocation of a physically contiguou=
s
> > -   *             memory region.
> > -   * @RSC_DEVMEM:     request to iommu_map a memory-based peripheral.
> > -   * @RSC_TRACE:         announces the availability of a trace buffer =
into which
> > -   *             the remote processor will be writing logs.
> > -   * @RSC_VDEV:       declare support for a virtio device, and serve a=
s its
> > -   *             virtio header.
> > -   * @RSC_LAST:       just keep this one at the end
> > -   * @RSC_VENDOR_START:      start of the vendor specific resource typ=
es range
> > -   * @RSC_VENDOR_END:        end of the vendor specific resource types=
 range
> > -   *
> > -   * Please note that these values are used as indices to the rproc_ha=
ndle_rsc
> > -   * lookup table, so please keep them sane. Moreover, @RSC_LAST is us=
ed to
> > -   * check the validity of an index before the lookup table is accesse=
d, so
> > -   * please update it as needed.
> > -   */
> > -  enum fw_resource_type {
> > -     RSC_CARVEOUT            =3D 0,
> > -     RSC_DEVMEM              =3D 1,
> > -     RSC_TRACE               =3D 2,
> > -     RSC_VDEV                =3D 3,
> > -     RSC_LAST                =3D 4,
> > -     RSC_VENDOR_START        =3D 128,
> > -     RSC_VENDOR_END          =3D 512,
> > -  };
> > -
> > -For more details regarding a specific resource type, please see its
> > -dedicated structure in include/linux/remoteproc.h.
> > -
> > -We also expect that platform-specific resource entries will show up
> > -at some point. When that happens, we could easily add a new RSC_PLATFO=
RM
> > -type, and hand those resources to the platform-specific rproc driver t=
o handle.
> > -
> > -Virtio and remoteproc
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -
> > -The firmware should provide remoteproc information about virtio device=
s
> > -that it supports, and their configurations: a RSC_VDEV resource entry
> > -should specify the virtio device id (as in virtio_ids.h), virtio featu=
res,
> > -virtio config space, vrings information, etc.
> > -
> > -When a new remote processor is registered, the remoteproc framework
> > -will look for its resource table and will register the virtio devices
> > -it supports. A firmware may support any number of virtio devices, and
> > -of any type (a single remote processor can also easily support several
> > -rpmsg virtio devices this way, if desired).
> > -
> > -Of course, RSC_VDEV resource entries are only good enough for static
> > -allocation of virtio devices. Dynamic allocations will also be made po=
ssible
> > -using the rpmsg bus (similar to how we already do dynamic allocations =
of
> > -rpmsg channels; read more about it in rpmsg.txt).
> > +The firmware must provide remoteproc with information regarding the
> > +virtio devices it supports and their configurations: an `RSC_VDEV`
> > +resource entry should detail the virtio device ID (as defined in
> > +`virtio_ids.h`), virtio features, virtio config space, vrings
> > +information, etc.
> > +
> > +Upon registration of a new remote, the remoteproc framework
> > +searches for its resource table and registers the supported virtio
> > +devices. A firmware may support multiple virtio devices, of various
> > +types (a single remote can support multiple rpmsg virtio
> > +devices if required).
> > +
> > +Moreover, `RSC_VDEV` resource entries suffice for static allocation
> > +of virtio devices. Dynamic allocations will also be supported using
> > +the rpmsg bus, akin to the handling of dynamic allocations for rpmsg
> > +channels. For more information, refer to rpmsg documentation.
> > --
> > 2.39.3 (Apple Git-146)
> >
