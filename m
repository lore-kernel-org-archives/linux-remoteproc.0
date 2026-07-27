Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1FA38AC9A
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 15:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165999; cv=pass; b=d7if0cDs8Xj1yCGlfOqyVsUwUJBOb2Rai5hsk7vrSK9xvkMKCED2EL1XD8ySoIJkXENhBTacPMufhZ1vISEfioq2BEl2w1voh9rS83DmAPT43HnfBVCZ45FIeEbGSvXzRqx8OzQZEjtfkPQdFJX9cq+s8pk33++RL1rY8oQDkcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165999; c=relaxed/simple;
	bh=zChXYxa0dNITfGolAnEP87ENiL/LOJieJUcOkQe7LCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vB/GIpu+do45ZTJPCGEpJBLRvEoBFlLNfvtg1nUtewMSs2I9k4PugLxKuDi1wdrxUWmXeZONw1ghYlDpmM2yIPXRp2UmfAJJ5yNXGK+twBFffAFc9qEEKkbzPKiGvwMBOcRF8egrz3JTgnlKRER54rlBvh3F0gq67REnwCrjqsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AwSBuGwK; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AwSBuGwK"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15dd4b9132so420223966b.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 08:26:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785165996; cv=none;
        d=google.com; s=arc-20260327;
        b=HH1e2zj5EY335pEB327KPJgwnVVJUgMUGR4RnWScUz9TGKzUlvW67LJiOB0k1ZYs/1
         JbCJJz/yGdOnfH3J38MtG0Xo8tWHwloE62CmBNXB5NDvPqdUlTYnrrVM5QwoBG0lboAp
         iSmiMfemq2EdNa4QiaSdfGo5c5CmzE53EhroGRASyZxgv64ilObdDgperc4JezmFAQp4
         8LHb8XfgbAohSnix4anogPKnpCUmAc7NOXEMd82mZCTfi+JyW3uXJGIbQwqZmgEyUonJ
         sXPTDkZ0BnRPS6MbKIjo7UF7ttIVBhJw05duOWSOr9WEOA6+mZGZnRW7Ea2lwsfRjnTc
         iO9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EV03ipGM5VnOvgkn9WlfL0PnqSbQvl4eFULExmllDpM=;
        fh=tqhwozJWJBW3cleFOmrWHaZi/4iJ251+Kms9eKOgldw=;
        b=N/eAav7hH/ncofQJsDA4FRModBV6xWQO7nek7RBdiWgXrMKVBXC7pFBLaQQ82b+Svo
         Er3d8EOxW9ZVcZ/XL9xHmZ7SAGvD+N3zEYgqU3L4GONVUesxkYYXNmv5E56Yy+c6WCpA
         /quOe0mZo9xeBWnlBlHHss2/38W3JkhqnvduwyJDmWTGiE4IrTrfOm45+vuxA3QAYRNf
         Gkir2wQC44QWWVEGU0ATMX4nqRBalk+8vYIBrUNxazvPp+8bq8DSaSNUjxyt9zS4pZPC
         eTx7qxuB98rMsCcVPIlMFeUP44elnUhiwqTULM1XbjssouzUxhIwi6my6gteQTkpTFk/
         cVOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785165996; x=1785770796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EV03ipGM5VnOvgkn9WlfL0PnqSbQvl4eFULExmllDpM=;
        b=AwSBuGwKjKV3UnTO88AKaQDshUgshGn5WurlaoFnyaq9e5h6ZugnujMk+RZK5wHNVA
         S8kxMLzgRvW09NDUphWKJJn00rwyG4nlIwA3t/ivjCef6NOG1J0ye59Rq1ILYHo7jw0y
         Nyby5BE6RRq9zreGn/iV5iC+dTeyVA4mFPyUO1TrQsYfWXGbfM/KFQrrHrhEFNIsyZS0
         hnX50ZXYkdDBEWvLg6IlWFXIYzIjlZ0mg3ZFyN6Sl6szjhlPolIlKAgcV0+jL/Gtzwiy
         6WBbs7twvqkzhzpRAIEmIejKp1XnrjzU82oPJhQ1QD+k54kaEe7M5D3jH6cUAm33JFkQ
         86AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785165996; x=1785770796;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EV03ipGM5VnOvgkn9WlfL0PnqSbQvl4eFULExmllDpM=;
        b=WKhIaDxLFTeXNS9u40W1GhA/DQ4h33sCDvYXkKgayGyv7Rus6t1MlqDvP/eN6laY7M
         vgINdLj49t9BJ/6JZfOnfb37kI3ERZObLQEbPxCJOE1t0voq7gQ5+wmSgXGUS8pcdWAx
         iaC73M3J41bgU8owONdNiJTrv+K/FqrchzPMAAAG/c0C22q0ZZ3qdnUIRQhK2HRaOKfe
         +QaxM9psZZwa5ujl7+njBsdwJAfi9eIVO7/cJmkRGWDGSaxrcW3Cn4MgMQmauEWG9hBg
         ocx+DJDhWEYjcrxr4zBIRmlDSy64e631PP8Nw3QhZ4remAlWpig+ZtKYJurntykHVu/3
         JvTg==
X-Forwarded-Encrypted: i=1; AHgh+RrjkWuLwgey+kC3qxYaR2UhNh3QxMAfwTeLwhkLq+jU4L2KArJk5w1ceUmelfT1pQgBYMF3fkE0jzPuS7RMZeX0@vger.kernel.org
X-Gm-Message-State: AOJu0YzRzKJM38zywVcZdE0BUPeXZAZJUUnSNCNbOOVs/DUrHWRex4Pk
	9KRP4IwMFWYCIXkOIVFkq2WgucCjHZuRupV0WabwMBCF8ug+nX0IFwlcvZNTIhv55J6mrQJ1hYt
	o+q/iE4c6OZ7KyFm4C9uqoklsykaZvwNE/EahRWI1Dm9Prh8VuEquZhM=
X-Gm-Gg: AR+sD130fq5YpcYgwu6UgiQWF6kJK9IQ2ODBjLCxNXZ1IeRDVOpN9k2rhZRqWdALtAg
	0SdLk/RfkuOAsk3IvvJxrGPe8i8vJQz5y0L3JMGDXkQ6EZkul0znRoIs4gdphfShRrxPXTnWAyq
	kvZXAsX52XR7z4WqeZink73ch0PwXDxsIZo7LQlAfWhCZoHWH8saVDB9F+mWpNaP3/14LQBtwqe
	rXRM96uQM7qvTBwEyq38o5QSXyOMiFWz1es5g94wCqKA5B40uc3JAZqQfWbrAMKqpzrWiM7aMaR
	Hbjj3M6A2Z6hhegSlXTJ
X-Received: by 2002:a17:907:d641:b0:c15:ca27:5818 with SMTP id
 a640c23a62f3a-c1f1eeaa320mr434923366b.28.1785165995746; Mon, 27 Jul 2026
 08:26:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710192831.3440427-1-tanmay.shah@amd.com> <20260710192831.3440427-4-tanmay.shah@amd.com>
 <ale0KIu6hXNvN0q9@p14s> <66e4a85c-be14-4bd8-8328-bf17d2437994@amd.com>
 <CANLsYkyL8_YSb39QqbC0Z+udahMtCV1e+OeoKGvmGSxQ6h3_qA@mail.gmail.com>
 <c8f62152-fb7b-4771-87d7-9420c7e3f452@amd.com> <al-VRUCcl6NWzQkY@p14s>
 <a37bb772-2b27-44fa-9bf1-30707c419141@amd.com> <amDYiyTFFLkkTv5K@p14s>
 <c1d24c44-8daf-48bc-9785-7ab394353356@foss.st.com> <CANLsYkzCKpNG-2W24EA1FEjEEr1J+w6VvM=sPwr8wMRDNqm9jg@mail.gmail.com>
 <c6826750-03b3-4ad6-9f88-394b0234ec27@foss.st.com> <db46a271-147b-4b3d-a8c4-209344b0d969@amd.com>
In-Reply-To: <db46a271-147b-4b3d-a8c4-209344b0d969@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 27 Jul 2026 09:26:24 -0600
X-Gm-Features: AUfX_mzcn9iY8H-Cf8GTnIcHPHZIbTSEOq0zOBeCR6UY5nMgAtfiRbXWXfoDRaM
Message-ID: <CANLsYkzKmwd7e8oFrbsXZnZpbZ32R9SR+CSwJQTMicpa3Uh0wA@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
To: tanmay.shah@amd.com
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, andersson@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-remoteproc@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Jul 2026 at 18:28, Shah, Tanmay <tanmays@amd.com> wrote:
>
>
>
> On 7/23/2026 12:27 PM, Arnaud POULIQUEN wrote:
> >
> >
> > On 7/23/26 16:13, Mathieu Poirier wrote:
> >> On Thu, 23 Jul 2026 at 03:11, Arnaud POULIQUEN
> >> <arnaud.pouliquen@foss.st.com> wrote:
> >>>
> >>> Hello Mathieu,
> >>>
> >>> On 7/22/26 16:49, Mathieu Poirier wrote:
> >>>> On Tue, Jul 21, 2026 at 11:02:13AM -0500, Shah, Tanmay wrote:
> >>>>>
> >>>>>
> >>>>> On 7/21/2026 10:50 AM, Mathieu Poirier wrote:
> >>>>>> On Thu, Jul 16, 2026 at 11:12:55AM -0500, Shah, Tanmay wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>> On 7/16/2026 10:48 AM, Mathieu Poirier wrote:
> >>>>>>>> On Wed, 15 Jul 2026 at 11:28, Shah, Tanmay <tanmays@amd.com> wro=
te:
> >>>>>>>>>
> >>>>>>>>> Hi,
> >>>>>>>>>
> >>>>>>>>> Please find my response below:
> >>>>>>>>>
> >>>>>>>>> On 7/15/2026 11:24 AM, Mathieu Poirier wrote:
> >>>>>>>>>> On Fri, Jul 10, 2026 at 12:28:29PM -0700, Tanmay Shah wrote:
> >>>>>>>>>>> 512 bytes isn't always suitable for all case, let firmware
> >>>>>>>>>>> maker decide the best value from resource table.
> >>>>>>>>>>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
> >>>>>>>>>>>
> >>>>>>>>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >>>>>>>>>>> ---
> >>>>>>>>>>> Changes in v5:
> >>>>>>>>>>>
> >>>>>>>>>>>     - fix documentation about alignment of the buffer size
> >>>>>>>>>>>     - change version field from u16 to u8
> >>>>>>>>>>>     - remove buffer alignment check
> >>>>>>>>>>>     - Separate buffer alignment vs MTU of a single buffer
> >>>>>>>>>>>     - Use buffer alignment only to get next buffer address at
> >>>>>>>>>>> alignment
> >>>>>>>>>>>       boundary
> >>>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> [...]
> >>>>>>>>>
> >>>>>>>>>>> +#ifndef _LINUX_VIRTIO_RPMSG_H
> >>>>>>>>>>> +#define _LINUX_VIRTIO_RPMSG_H
> >>>>>>>>>>> +
> >>>>>>>>>>> +#include <linux/types.h>
> >>>>>>>>>>> +#include <linux/virtio_types.h>
> >>>>>>>>>>> +
> >>>>>>>>>>> +/* The feature bitmap for virtio rpmsg */
> >>>>>>>>>>> +#define VIRTIO_RPMSG_F_NS   0 /* RP supports name service
> >>>>>>>>>>> notifications */
> >>>>>>>>>>> +#define VIRTIO_RPMSG_F_BUFSZ        1 /* RP get buffer size
> >>>>>>>>>>> from config space */
> >>>>>>>>>>> +
> >>>>>>>>>>> +/* Version of struct virtio_rpmsg_config understood by this
> >>>>>>>>>>> driver */
> >>>>>>>>>>> +#define RPMSG_VDEV_CONFIG_V1        1
> >>>>>>>>>>> +
> >>>>>>>>>>> +/**
> >>>>>>>>>>> + * struct virtio_rpmsg_config - config space for rpmsg
> >>>>>>>>>>> virtio device
> >>>>>>>>>>> + *
> >>>>>>>>>>> + * @version:        version of this structure, currently
> >>>>>>>>>>> %RPMSG_VDEV_CONFIG_V1.
> >>>>>>>>>>> + * @size:   size of this structure in bytes.
> >>>>>>>>>>> + * @rpmsg_buf_align: alignment in bytes for each buffer.
> >>>>>>>>>>> Must be a power of
> >>>>>>>>>>> + *               two. If 0 then no alignment will be done.
> >>>>>>>>>>> This alignment
> >>>>>>>>>>> + *               will not decide actual size of the buffer
> >>>>>>>>>>> but will be
> >>>>>>>>>>> + *               used to decided the start address of the
> >>>>>>>>>>> buffer. The
> >>>>>>>>>>> + *               actual size of the buffer can be different
> >>>>>>>>>>> than the
> >>>>>>>>>>> + *               aligned size of the buffer.
> >>>>>>>>>>
> >>>>>>>>>> Is there really a need to have a buffer size different from
> >>>>>>>>>> its alignment?  It's
> >>>>>>>>>> not like the (small) delta between the buffer size and its
> >>>>>>>>>> alignment will be
> >>>>>>>>>> used for something else.  I'm fine with a buffer alignment
> >>>>>>>>>> requirement but in
> >>>>>>>>>> those cases, the firmware should set the size of the buffer in
> >>>>>>>>>> accordance with
> >>>>>>>>>> its alignment requirement.  Otherwise, the complexity needed
> >>>>>>>>>> to manage the
> >>>>>>>>>> discrpancy between the two yields a driver that is hard to
> >>>>>>>>>> maintain and prone to
> >>>>>>>>>> bugs.
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> I had the same concern before. However, following example
> >>>>>>>>> changed my mind:
> >>>>>>>>>
> >>>>>>>>> So, a single buffer size is the MTU size of a packet for the
> >>>>>>>>> protocol
> >>>>>>>>> supported by the firmware. Now that can be different than the
> >>>>>>>>> aligned
> >>>>>>>>> size of the buffer.
> >>>>>>>>>
> >>>>>>>>> For example, the higher level protocol (not rpmsg) has 430
> >>>>>>>>> bytes as the
> >>>>>>>>> max size of a payload. However, cache line alignment is 64-
> >>>>>>>>> bytes. Then
> >>>>>>>>> in that case, the aligned buffer size is 448 bytes. But, that
> >>>>>>>>> doesn't
> >>>>>>>>> mean we can say protocol's MTU size is 448 bytes. If user end u=
p
> >>>>>>>>> treating MTU size 448 bytes and use space beyond 430 bytes,
> >>>>>>>>> then the
> >>>>>>>>> higher level apps might discard that data and communication may
> >>>>>>>>> fail.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> How is that scenario different from today's 512 byte buffer size=
?
> >>>>>>>> Most users don't use all 512 bytes and we don't run in the probl=
em
> >>>>>>>> described above?
> >>>>>>>>
> >>>>>>>
> >>>>>>> 512 buffer size is hardcoded, so it is enforced on the protocol
> >>>>>>> by the
> >>>>>>> framework. But by allowing the configuration of the buffer size
> >>>>>>> we are
> >>>>>>> allowing the protocol to decide what the buffer size should be.
> >>>>>>> So, when
> >>>>>>> user request the buffer via rpmsg_get_mtu() API, then that should
> >>>>>>> be the
> >>>>>>> original buffer size which is expected by the protocol, which may
> >>>>>>> not be
> >>>>>>> same as the aligned buffer size.
> >>>>>>
> >>>>>> Regardless of the buffer size, whether it is set to 512 byte or
> >>>>>> some arbitrary
> >>>>>> value by the remote processsor's firmware, there is a possibility
> >>>>>> of a
> >>>>>> discrepancy with what is expected by the protocol.  Right now
> >>>>>> rpmsg_get_mtu()
> >>>>>> returns 512 regardless of what a protocol uses.  The only thing
> >>>>>> that should be
> >>>>>> important to the protocol is not to exceed that limit.
> >>>>>>
> >>>>>
> >>>>> I think I am missing something. Are you saying that buffer size can
> >>>>> not
> >>>>> be configured greater than 512 bytes?
> >>>>
> >>>> I am not.
> >>>>
> >>>> What I am saying is that if alignment is important to a remote
> >>>> processor, it
> >>>> should choose the buffer size accordingly.  rpmsg_get_mtu() should
> >>>> return the
> >>>> value of the buffer size, exactly the way it is today.
> >>>
> >>> Did you get a chance to look to my previous reply [1]?
> >>>
> >>
> >> Unfortunately I haven't had the opportunity to reach that point in my
> >> Inbox.
> >>
> >>>   From my understanding, due to the Virtio specification, we cannot
> >>> guarantee that
> >>> the buffer size will not be updated by the main processor. Having an
> >>> alignment
> >>> field ensures that the main processor takes the remote processor=E2=
=80=99s
> >>> constraints
> >>> into account if it updates the RPMsg buffer size.
> >>>
> >>
> >> Where does the main processor change the buffer size?
> >
> > Linux does not, but any main processor may do so, consistent with the
> > Virtio specification. If requested in OpenAMP with a valid usecase, no
> > reason to reject if it is not specified that it is not possible.
> >
> > What we define here will probably become the reference for all RPMsg
> > implementations...
> >
> >>
> >>> That said, if we decide to remove the alignment field, we must clearl=
y
> >>> document the constraints for the RPMsg Virtio config space:
> >>>
> >>> - virtio_rpmsg_config cannot be changed by the Virtio driver.
> >>> - the sizes must respect the device and driver alignment constraint.
> >>>
> >>
> >> If the size chosen by the device isn't compatible with what the driver
> >> can accommodate, then initialization simply fails.
> >>
> >>> This is not my preferred solution,because that means that the remote
> >>> processor has
> >>> to know the alignment constraints of the main processor.
> >>>
> >>
> >> It would have to anyway wouldn't it?
> >
> > I think I was wrong about this last argument. Since the main processor
> > allocates the buffers, it can apply its own alignment constraints,so th=
e
> > remote processor does not need to know them.
> >
> > That makes the option without an alignment field acceptable to me,
> > if restrictions are documented.
> >
> > Here are the constraints that I would like to see documented (not
> > necessary using the exact terms) in Linux and OpenAMP to make the usage
> > clear for the RPMsg virtio config space:
> > - The virtio driver must not update the config space.
>
> Ack.
>
> > - The virtio driver can allocate a memory area equal to or greater than
> >   the RX/TX message size specified by the device. The effective RX/TX s=
ize
> >   remains the one requested by the device.
>
> Here I have a question. Currently we do not have any mechanism (such as
> dt property) that allows the driver (linux) side alignment. In such case
> why even mention it in the documentation? Or if we do, then we also need
> to make it clear that Linux provides no such mechanism today.
>

I agree.  Alignment is chosen by the device and should be documented
with the device.

> > The effective RX/TX size remains the one requested by the device.
>
> IIUC, does this mean rpmsg_get_mtu() API should return an aligned buffer
> size from device not from the driver ?
>

Correct.

> > - The virtio device should specify sizes that respect its own alignment
> >   constraints.
>
> Ack. This means, we don't need extra alignment field at all in the
> config space. The firmware directly mention aligned size only in the
> txbuf_size and rxbuf_size fields.
>

That is what I think.

> Please let me know if my understanding is missing something. I am okay
> to document above points.
>
> Thanks.
>
> >
> > Does this would be acceptable to you?
> > Regards,
> > Arnaud
> >
> >>
> >>   And as I said from the beginning, this is not something that has com=
e
> >> up in the 20 years this subsystem existed.  There is no point in
> >> adding all this complexity for a something that _may_ happen.
> >>
> >>> [1]https://www.mail-archive.com/linux-kernel@vger.kernel.org/
> >>> msg2643398.html
> >>>
> >>> Regards,
> >>>
> >>> Arnaud
> >>>>
> >>>>>
> >>>>> If the higher level protocol (not RPMsg) wants to use 4030 bytes fo=
r
> >>>>> single packet payload then that is what the MTU size should be. And=
 so
> >>>>> the firmware will configure 4030 bytes as single buffer size in the
> >>>>> vdev
> >>>>> config space. That is why alignment should be treated separately.
> >>>>> Because it is not equal to payload size needed by higher level
> >>>>> protocol.
> >>>>
> >>>> In that case and assuming alignment is required, the buffer size
> >>>> should be 4096
> >>>> and rpmsg_get_mtu() should also return 4096.  How a higher protocol
> >>>> uses the
> >>>> buffer space is none of our concern.
> >>>>
> >>>> Currently, the buffer size is set to 512 and users don't always fill
> >>>> the entire
> >>>> buffer.  I don't see why things should be different with a
> >>>> configurable buffer
> >>>> size.
> >>>>
> >>>>>
> >>>>>>>
> >>>>>>> If for internal management we want to treat buffer size =3D align=
ed
> >>>>>>> buffer
> >>>>>>> size, I am okay. But rpmsg_get_mtu() must give unaligned buffer s=
ize
> >>>>>>> which is expected by the protocol.
> >>>>>>
> >>>>>> I agree with the first sentence but not the second.  The only
> >>>>>> thing protocols
> >>>>>> should care about is the start address of a buffer and that its
> >>>>>> size is
> >>>>>> sufficient for what it needs.
> >>>>>>
> >>>>>>>
> >>>>>>> Thanks,
> >>>>>>> Tanmay
> >>>>>>>
> >>>>>>>>> The alignment field is used only to decide where the next
> >>>>>>>>> buffer start
> >>>>>>>>> address is to ease cache operations.
> >>>>>>>>>
> >>>>>>>>> Sure, we need to maintain this complexity, but I think it's
> >>>>>>>>> worth it.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> The same as in my previous email to Arnaud applies here - is
> >>>>>>>> this an
> >>>>>>>> immediate requirement of something we think may be happening in =
the
> >>>>>>>> future?
> >>>>>>>>
> >>>>>>>
> >>>>>>> IMHO, vendors will use it if the feature is available, otherwise =
the
> >>>>>>> need to optimize alignment is not easily encountered.
> >>>>>>>
> >>>>>>>>
> >>>>>>>>> Thanks,
> >>>>>>>>> Tanmay
> >>>>>>>>>
> >>>>>>>>>>> + * @txbuf_size:     Tx buf size from remote's view. For
> >>>>>>>>>>> Linux this is rx buf size.
> >>>>>>>>>>> + * @rxbuf_size:     Rx buf size from remote's view. For
> >>>>>>>>>>> Linux this is tx buf size.
> >>>>>>>>>>> + *
> >>>>>>>>>>> + * This is the configuration structure shared by the device
> >>>>>>>>>>> and the driver,
> >>>>>>>>>>> + * read when %VIRTIO_RPMSG_F_BUFSZ is negotiated. The fields
> >>>>>>>>>>> are laid out so
> >>>>>>>>>>> + * the structure is naturally 32-bit aligned.
> >>>>>>>>>>> + */
> >>>>>>>>>>> +struct virtio_rpmsg_config {
> >>>>>>>>>>> +    u8 version;
> >>>>>>>>>>> +    __virtio16 size;
> >>>>>>>>>>> +    __virtio16 rpmsg_buf_align;
> >>>>>>>>>>> +    /* The tx/rx individual buffer size (if
> >>>>>>>>>>> VIRTIO_RPMSG_F_BUFSZ) */
> >>>>>>>>>>> +    __virtio32 txbuf_size;
> >>>>>>>>>>> +    __virtio32 rxbuf_size;
> >>>>>>>>>>> +} __packed;
> >>>>>>>>>>> +
> >>>>>>>>>>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
> >>>>>>>>>>> --
> >>>>>>>>>>> 2.34.1
> >>>>>>>>>>>
> >>>>>>>>>
> >>>>>>>
> >>>>>
> >>>>
> >>>
> >
>
